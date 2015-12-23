#!/bin/bash
# env init for jessie
/bin/cat > /etc/sysctl.conf << _sysctl
fs.nr_open = 5242880
fs.file-max = 4194304
fs.aio-max-nr = 1048576
kernel.core_uses_pid = 1
kernel.msgmax = 1048576
kernel.msgmnb = 1073741824
kernel.shmall = 4294967296
kernel.shmmax = 68719476736
kernel.sysrq = 0
net.core.netdev_max_backlog = 1048576
net.core.rmem_default = 2097152
net.core.rmem_max = 16777216
net.core.wmem_default = 2097152
net.core.wmem_max = 16777216
net.core.somaxconn = 65535
net.nf_conntrack_max = 4194304
net.netfilter.nf_conntrack_max= 4194304
net.ipv4.netfilter.ip_conntrack_max = 4194304
net.netfilter.nf_conntrack_tcp_timeout_established = 1200
net.ipv4.conf.all.accept_source_route = 0
net.ipv4.conf.default.accept_source_route = 0
net.ipv4.conf.all.rp_filter = 0
net.ipv4.conf.default.rp_filter = 0
net.ipv4.ip_forward = 1
net.ipv4.ip_local_port_range = 1024    65535
net.ipv4.neigh.default.gc_thresh1 = 10240
net.ipv4.neigh.default.gc_thresh2 = 40960
net.ipv4.neigh.default.gc_thresh3 = 81920
net.ipv4.tcp_fin_timeout = 10
net.ipv4.tcp_keepalive_intvl = 15
net.ipv4.tcp_keepalive_probes = 3
net.ipv4.tcp_keepalive_time = 30
net.ipv4.tcp_max_orphans = 3276800
net.ipv4.tcp_max_syn_backlog = 1048576
net.ipv4.tcp_max_tw_buckets = 10000
net.ipv4.tcp_orphan_retries = 3
net.ipv4.tcp_reordering = 5
net.ipv4.tcp_retrans_collapse = 0
net.ipv4.tcp_retries2 = 5
net.ipv4.tcp_rmem = 4096        87380   16777216
net.ipv4.tcp_wmem = 4096        16384   16777216
net.ipv4.tcp_mem = 94500000 915000000 927000000
net.ipv4.tcp_sack = 0
net.ipv4.tcp_synack_retries = 1
net.ipv4.tcp_syncookies = 0
net.ipv4.tcp_syn_retries = 1
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_tw_recycle = 0
net.ipv4.tcp_tw_reuse = 1
net.ipv4.tcp_window_scaling = 1
net.ipv6.conf.all.disable_ipv6 = 1
net.ipv6.conf.default.disable_ipv6 = 1
vm.swappiness = 0
vm.overcommit_memory = 1
net.ipv4.conf.all.accept_redirects = 0
net.ipv4.conf.default.accept_redirects = 0
net.ipv4.conf.all.secure_redirects = 0
net.ipv4.conf.default.secure_redirects = 0
net.ipv4.icmp_echo_ignore_broadcasts = 1
net.ipv4.icmp_ignore_bogus_error_responses = 1
ernel.nmi_watchdog = 0
kernel.soft_watchdog = 0
kernel.watchdog = 0
kernel.watchdog_thresh = 0
_sysctl

/bin/cat > /etc/resolv.conf << _resolv
nameserver 223.5.5.5
nameserver 223.6.6.6
nameserver 114.114.114.114
nameserver 8.8.4.4
nameserver 8.8.8.8
_resolv

/bin/cat > /etc/profile.d/history.sh << _history
#!/bin/bash
export HISTFILESIZE=100000
export HISTSIZE=1000
export PROMPT_COMMAND="history -a"
export HISTTIMEFORMAT="%Y-%m-%d_%H:%M:%S "
export HISTIGNORE="history*:pwd:ls:ll"
export HISTCONTROL="ignoredups"
export HISTSIZE HISTFILESIZE HISTTIMEFORMAT PROMPT_COMMAND HISTIGNORE HISTCONTROL
_history

/bin/cat > /etc/profile.d/alias.sh << _alias
#!/bin/bash
alias rm="/bin/rm --preserve-root --verbose --interactive=once"
alias grep="/bin/grep --color=auto"
alias ll="/bin/ls -lh"
alias la="/bin/ls -lha"
_alias

/bin/cat > /etc/profile.d/ulimit.sh << _ulimit
#!/bin/bash
[ "\$(id -u)" == "0" ] && ulimit -n 4194304
_ulimit

/bin/cat > /etc/security/limits.conf  << _limits
* soft nproc 80000
* hard nproc 80000
* soft nofile 4194304
* hard nofile 4194304
_limits

/bin/cat > /etc/security/limits.d/90-nproc.conf << _90nproc
root       soft    nproc     unlimited
_90nproc

/bin/cat > /etc/vim/vimrc << _vimrc
runtime! debian.vim
syntax on
set showcmd   
set showmatch 
set ignorecase
set smartcase 
set incsearch 
set autowrite 
set hidden    
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif
set tabstop=4
set expandtab
set nocompatible
set cursorline
set ruler
set laststatus=2
set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
set foldenable
set foldmethod=syntax
set foldclose=all
filetype on
filetype plugin on 
_vimrc

/bin/cat > /etc/apt/sources.list << _aptsvr
deb http://mirrors.aliyun.com/debian/ jessie main contrib
deb-src http://mirrors.aliyun.com/debian/ jessie main contrib
deb http://mirrors.aliyun.com/debian-security/ jessie/updates main contrib
deb-src http://mirrors.aliyun.com/debian-security/ jessie/updates main contrib
_aptsvr

/bin/cat > /etc/cron.hourly/ntpdate << _ntpdate
#!/bin/bash
ntpdate cn.pool.ntp.org && hwclock --systohc > /tmp/ntp.log 2>&1
_ntpdate

grep '^. /etc/profile' /etc/rc.local || sed -i "s#exit 0#. /etc/profile\nexit 0#g" /etc/rc.local
grep '^sysctl -e -p' /etc/rc.local || sed -i "s#exit 0#sysctl -e -p\nexit 0#g" /etc/rc.local
grep '^ntpdate -b cn.pool.ntp.org' /etc/rc.local || sed -i "s#exit 0#ntpdate -b cn.pool.ntp.org \&\& hwclock --systohc \&\nexit 0#g" /etc/rc.local
grep '^\[\[ -f /opt/nic-rps.sh \]\]' /etc/rc.local || sed -i "s#exit 0#[[ -f /opt/nic-rps.sh ]] \&\& bash /opt/nic-rps.sh\nexit 0#g" /etc/rc.local

echo -e "SELINUX=disabled\nSELINUXTYPE=targeted" > /etc/selinux/config
sed -i 's/#ListenAddress 0.0.0.0/ListenAddress 0.0.0.0/g' /etc/ssh/sshd_config
sed -i 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config
sed -i 's/GSSAPIAuthentication yes/GSSAPIAuthentication no/g' /etc/ssh/ssh_config
sed -i 's/^GRUB_CMDLINE_LINUX=""/GRUB_CMDLINE_LINUX="net.ifnames=0 thash_entries=1048576 rhash_entries=1048576 biosdevname=0 nohz=off enforcing=0 ipv6.disable_ipv6=1 nmi_watchdog=0 selinux=0 transparent_hugepage=never cgroup_enable=memory swapaccount=1 vga=773"/g' /etc/default/grub
sed -i 's/quiet//g' /etc/default/grub
sed -i 's/^#DefaultLimitNOFILE=$/DefaultLimitNOFILE=1048576/g' /etc/systemd/system.conf /etc/systemd/user.conf
chmod +x /etc/profile.d/*.sh /etc/rc.local /etc/cron.hourly/ntpdate

service ssh reload
sysctl -e -p
. /etc/profile
sed -i 's/quiet//g' /boot/grub/grub.cfg
insserv -r nfs-common
insserv -r rpcbind
insserv -r exim4
insserv -r rsync
systemctl stop nfs-common
systemctl stop rpcbind
systemctl stop exim4
systemctl stop rsync
grub-mkconfig -o /boot/grub/grub.cfg
