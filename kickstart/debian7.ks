#### Contents of the preconfiguration file (for &releasename;)
# Careone, <zzbusagain@yahoo.com.cn>, China, 2009

### Localization
# Locale sets language and country.
d-i debian-installer/locale string en_US
#d-i debian-installer/locale string zh_CN
d-i debian-installer/language string en
d-i debian-installer/country string CN
d-i debian-installer/locale string en_GB.UTF-8

d-i localechooser/supported-locales en_US.UTF-8

# Keyboard selection.
# Disable automatic (interactive) keymap detection.
d-i console-setup/ask_detect boolean false
d-i console-setup/modelcode string pc105
d-i console-setup/layoutcode string us
# To select a variant of the selected layout (if you leave this out, the
# basic form of the layout will be used):
d-i console-setup/variantcode string USA

#d-i console-setup/modelcode string SKIP

# Keyboard selection.
#d-i console-tools/archs select at
d-i console-keymaps-at/keymap select us

# Example for a different keyboard architecture
#d-i console-keymaps-usb/keymap select mac-usb-us

d-i keyboard-configuration/xkb-keymap select us
# Example for a different keyboard architecture
#d-i console-keymaps-usb/keymap select mac-usb-us


### Network configuration
# netcfg will choose an interface that has link if possible. This makes it
# skip displaying a list if there is more than one interface.
d-i netcfg/choose_interface select auto

# To pick a particular interface instead:
d-i netcfg/choose_interface select eth0

# If you have a slow dhcp server and the installer times out waiting for
# it, this might be useful.
#d-i netcfg/dhcp_timeout string 60

# If you prefer to configure the network manually, uncomment this line and
# the static network configuration below.
d-i netcfg/disable_dhcp boolean true

# If you want the preconfiguration file to work on systems both with and
# without a dhcp server, uncomment these lines and the static network
# configuration below.
#d-i netcfg/dhcp_failed note
#d-i netcfg/dhcp_options select Configure network manually

# Static network configuration.
d-i netcfg/get_ipaddress string 172.16.3.126
d-i netcfg/get_nameservers string 172.16.3.1
d-i netcfg/get_netmask string 255.255.255.0
d-i netcfg/get_gateway string 172.16.3.1
d-i netcfg/confirm_static boolean true

# Any hostname and domain names assigned from dhcp take precedence over
# values set here. However, setting the values still prevents the questions
# from being shown, even if values come from dhcp.
d-i netcfg/get_hostname string bilibili
d-i netcfg/get_domain string unassigned-domain
#
# Disable that annoying WEP key dialog.
d-i netcfg/wireless_wep string
# The wacky dhcp hostname that some ISPs use as a password of sorts.
#d-i netcfg/dhcp_hostname string radish
#
# If non-free firmware is needed for the network or other hardware, you can
# configure the installer to always try to load it, without prompting. Or
# change to false to disable asking.
#d-i hw-detect/load_firmware boolean true

# If you select ftp, the mirror/country string does not need to be set.

d-i mirror/protocol string http
d-i mirror/country string China
d-i mirror/http/hostname string mirrors.bilibili.co
d-i mirror/http/directory string /debian
d-i mirror/http/proxy string

# Suite to install.

d-i mirror/suite string wheezy

### Clock and time zone setup
# Controls whether or not the hardware clock is set to UTC.
d-i clock-setup/utc boolean false

# You may set this to any valid setting for $TZ; see the contents of
# /usr/share/zoneinfo/ for valid values.
#d-i time/zone string US/Eastern
d-i time/zone string Asia/Shanghai

# Controls whether to use NTP to set the clock during the install
d-i clock-setup/ntp boolean true

# NTP server to use. The default is almost always fine here.
d-i clock-setup/ntp-server string ntp.bilibili.co

### Partitioning

# If the system has free space you can choose to only partition that space.
d-i partman-auto/init_automatically_partition select biggest_free

# Alternatively, you can specify a disk to partition. The device name must
# be given in traditional non-devfs format.

# Note: A disk must be specified, unless the system has only one disk.

# For example, to use the first SCSI/SATA hard disk:
d-i partman-auto/disk string /dev/sda

# In addition, you'll need to specify the method to use.
# The presently available methods are: "regular", "lvm" and "crypto"
d-i partman-auto/method string regular

# If one of the disks that are going to be automatically partitioned
# contains an old LVM configuration, the user will normally receive a
# warning. This can be preseeded away...

d-i partman-auto/purge_lvm_from_device boolean true

d-i partman-lvm/device_remove_lvm boolean true

# The same applies to pre-existing software RAID array:
d-i partman-md/device_remove_md boolean true

# And the same goes for the confirmation to write the lvm partitions.
d-i partman-lvm/confirm boolean true

d-i partman-auto-lvm/guided_size string max

# You can choose one of the three predefined partitioning recipes:
# - atomic: all files in one partition
# - home:   separate /home partition
# - multi:  separate /home, /usr, /var, and /tmp partitions
d-i partman-auto/choose_recipe select atomic

# Or provide a recipe of your own...

# The recipe format is documented in the file devel/partman-auto-recipe.txt.

# If you have a way to get a recipe file into the d-i environment, you can
# just point at it.
#d-i partman-auto/expert_recipe_file string /hd-media/recipe

# If not, you can put an entire recipe into the preconfiguration file in one
# (logical) line. This example creates a small /boot partition, suitable
# swap, and uses the rest of the space for the root partition:

#d-i partman-auto/expert_recipe string                         \
#      boot-root ::                                            \
#              40 50 100 ext3                                  \
#                      $primary{ } $bootable{ }                \
#                      method{ format } format{ }              \
#                      use_filesystem{ } filesystem{ ext3 }    \
#                      mountpoint{ /boot }                     \
#              .                                               \
#              500 10000 1000000000 ext3                       \
#                      method{ format } format{ }              \
#                      use_filesystem{ } filesystem{ ext3 }    \
#                      mountpoint{ / }                         \
#              .                                               \
#              64 512 300% linux-swap                          \
#                      method{ swap } format{ }                \
#              .

# This makes partman automatically partition without confirmation, provided
# that you told it what to do using one of the methods above.

# If you just want to change the default filesystem from ext3 to something
# else, you can do that without providing a full recipe.
d-i partman/default_filesystem string ext4

# This makes partman automatically partition without confirmation, provided
# that you told it what to do using one of the methods above.

d-i partman/confirm_write_new_label boolean true

d-i partman/choose_partition select finish

d-i partman/confirm boolean true

d-i partman/confirm_nooverwrite boolean true
d-i partman-lvm/confirm_nooverwrite boolean true

### Base system installation

# Select the initramfs generator used to generate the initrd for 2.6 kernels.
#d-i base-installer/kernel/linux/initramfs-generators string yaird

# The kernel image (meta) package to be installed; "none" can be used if no
# kernel is to be installed.
#d-i base-installer/kernel/image string linux-image-2.6-486

### Account setup

# Skip creation of a root account (normal user account will be able to
# use sudo).
d-i passwd/root-login boolean true

# Alternatively, to skip creation of a normal user account.
d-i passwd/make-user boolean false

# Root password, either in clear text
d-i passwd/root-password password bilibili

d-i passwd/root-password-again password bilibili

# or encrypted using an MD5 hash.
#d-i passwd/root-password-crypted password [MD5 hash]
#d-i passwd/root-password-crypted password $1$uvh20/$kUIdD2Jdu5JerGZHJPcvZ0

# To create a normal user account.
#d-i passwd/user-fullname string Debian User
#d-i passwd/user-fullname string user password user1234
#d-i passwd/username string user

# Normal user's password, either in clear text
#d-i passwd/user-password password user1234

#d-i passwd/user-password-again password user1234

# or encrypted using an MD5 hash.
#d-i passwd/user-password-crypted password [MD5 hash]
#d-i passwd/user-password-crypted password $1$7tg20/$hnbObW86VeE20WNC8dkqo/

# Create the first user with the specified UID instead of the default.
#d-i passwd/user-uid string 1010

# The user account will be added to some standard initial groups. To
# override that, use this.
#d-i passwd/user-default-groups string audio cdrom video

### Apt setup
# You can choose to install non-free and contrib software.

d-i apt-setup/non-free boolean true

d-i apt-setup/contrib boolean true

# Uncomment this if you don't want to use a network mirror.

d-i apt-setup/use_mirror boolean true

# Select which update services to use; define the mirrors to be used.
# Values shown below are the normal defaults.

d-i apt-setup/services-select multiselect security

#d-i apt-setup/security_host string security.debian.org
#d-i apt-setup/volatile_host string volatile.debian.org
d-i apt-setup/security_host string mirrors.bilibili.co/debian-security
d-i apt-setup/security_path string /

# Additional repositories, local[0-9] available

#d-i apt-setup/local0/repository string \
#       http://local.server/debian stable main

#d-i apt-setup/local0/comment string local server

# Enable deb-src lines
d-i apt-setup/local0/source boolean true

# URL to the public key of the local repository; you must provide a key or
# apt will complain about the unauthenticated repository and so the
# sources.list line will be left commented out
#d-i apt-setup/local0/key string http://local.server/key

# By default the installer requires that repositories be authenticated
# using a known gpg key. This setting can be used to disable that
# authentication. Warning: Insecure, not recommended.
#d-i debian-installer/allow_unauthenticated string true

### Package selection

tasksel tasksel/first multiselect standard

d-i	debian-installer/splash	boolean false

# If the desktop task is selected, install the kde and xfce desktops
# instead of the default gnome desktop.
#tasksel tasksel/desktop multiselect kde, xfce

# Individual additional packages to install
d-i pkgsel/include string openssh-server build-essential command-not-found command-not-found-data bash-completion bridge-utils ifenslave-2.6 linux-headers-3.2.0-4-amd64 dkms vim

d-i pkgsel/language-packs string 
d-i	pkgsel/install-language-support boolean false

d-i pkgsel/update-policy select unattended-upgrades

# Whether to upgrade packages after debootstrap.
# Allowed values: none, safe-upgrade, full-upgrade
d-i pkgsel/upgrade select safe-upgrade

# Some versions of the installer can report back on what software you have
# installed, and what software you use. The default is not to report back,
# but sending reports helps the project determine what software is most
# popular and include it on CDs.
popularity-contest popularity-contest/participate boolean false

d-i preseed/late_command string /bin/sh /init-firmware.sh

### Boot loader installation
# Grub is the default boot loader (for x86). If you want lilo installed
# instead, uncomment this:
#d-i grub-installer/skip boolean true

# To also skip installing lilo, and install no bootloader, uncomment this
# too:
#d-i lilo-installer/skip boolean true

# This is fairly safe to set, it makes grub install automatically to the MBR
# if no other operating system is detected on the machine.
d-i grub-installer/only_debian boolean true

# This one makes grub-installer install to the MBR if it also finds some other
# OS, which is less safe as it might not be able to boot that other OS.
d-i grub-installer/with_other_os boolean true

# Alternatively, if you want to install to a location other than the mbr,
# uncomment and edit these lines:
#d-i grub-installer/only_debian boolean false
#d-i grub-installer/with_other_os boolean false
#d-i grub-installer/bootdev  string (hd0,0)

# To install grub to multiple disks:
#d-i grub-installer/bootdev  string (hd0,0) (hd1,0) (hd2,0)

# Optional password for grub, either in clear text

#d-i grub-installer/password password root1234

#d-i grub-installer/password-again password root1234

# or encrypted using an MD5 hash, see grub-md5-crypt(8).
#d-i grub-installer/password-crypted password [MD5 hash]
#d-i grub-installer/password-crypted password [MD5 hash]

### Finishing up the installation

# During installations from serial console, the regular virtual consoles
# (VT1-VT6) are normally disabled in /etc/inittab. Uncomment the next
# line to prevent this.
#d-i finish-install/keep-consoles boolean true

# Avoid that last message about the install being complete.
d-i finish-install/reboot_in_progress note

# This will prevent the installer from ejecting the CD during the reboot,
# which is useful in some situations.
#d-i cdrom-detect/eject boolean false

# This is how to make the installer shutdown when finished, but not
# reboot into the installed system.
#d-i debian-installer/exit/halt boolean true

# This will power off the machine instead of just halting it.
#d-i debian-installer/exit/poweroff boolean true

### Preseeding other packages
# Depending on what software you choose to install, or if things go wrong
# during the installation process, it's possible that other questions may
# be asked. You can preseed those too, of course. To get a list of every
# possible question that could be asked during an install, do an
# installation, and then run these commands:
#   debconf-get-selections --installer > file
#   debconf-get-selections >> file

#### Advanced options
### Running custom commands during the installation
# d-i preseeding is inherently not secure. Nothing in the installer checks
# for attempts at buffer overflows or other exploits of the values of a
# preconfiguration file like this one. Only use preconfiguration files from
# trusted locations! To drive that home, and because it's generally useful,
# here's a way to run any shell command you'd like inside the installer,
# automatically.

# This first command is run as early as possible, just after
# preseeding is read.
#d-i preseed/early_command string anna-install some-udeb
# d-i preseed/early_command string apt-get install aptitude

# This command is run just before the install finishes, but when there is
# still a usable /target directory. You can chroot to /target and use it
# directly, or use the apt-install and in-target commands to easily install
# packages and run commands in the target system.
#d-i preseed/late_command string apt-install zsh; in-target chsh -s /bin/zsh
