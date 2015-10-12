#!/bin/bash

if [ "$1" == "checksum_md5" ]; then
	printf ' '$(md5sum $2 | cut --delimiter=' ' --fields=1)' %16d '$2'\n' $(wc --bytes $2 | cut --delimiter=' ' --fields=1)
	exit
elif [ "$1" == "checksum_sha1" ]; then
	printf ' '$(sha1sum $2 | cut --delimiter=' ' --fields=1)' %16d '$2'\n' $(wc --bytes $2 | cut --delimiter=' ' --fields=1)
	exit
elif [ "$1" == "checksum_sha256" ]; then
	printf ' '$(sha256sum $2 | cut --delimiter=' ' --fields=1)' %16d '$2'\n' $(wc --bytes $2 | cut --delimiter=' ' --fields=1)
	exit
fi

BASEDIR=/mnt/hd/mirrors/ceph/debian
HEADER=${BASEDIR}/conf/main-info
OS_CODENAME=jessie
SELF_SCRIPT="`pwd`/$0"

cd ${BASEDIR}
dpkg-scanpackages pool/main 2>/tmp/deb.log | tee dists/${OS_CODENAME}/main/binary-amd64/Packages | gzip -9c > dists/${OS_CODENAME}/main/binary-amd64/Packages.gz
cat dists/${OS_CODENAME}/main/binary-amd64/Packages | bzip2 -9c > dists/${OS_CODENAME}/main/binary-amd64/Packages.bz2

cd ${BASEDIR}/dists/${OS_CODENAME}
/bin/cp -fv ${HEADER} ${BASEDIR}/dists/${OS_CODENAME}/main/binary-amd64/Release
/bin/cp -fv ${HEADER} Release
echo "MD5Sum:" >> Release
find main/ -type f | xargs -n 1 $SELF_SCRIPT checksum_md5 >> Release
echo "SHA1:" >> Release
find main/ -type f | xargs -n 1 $SELF_SCRIPT checksum_sha1 >> Release
echo "SHA256:" >> Release
find main/ -type f | xargs -n 1 $SELF_SCRIPT checksum_sha256 >> Release
rm Release.gpg InRelease
gpg --clearsign -o InRelease Release
gpg -abs -o Release.gpg Release

