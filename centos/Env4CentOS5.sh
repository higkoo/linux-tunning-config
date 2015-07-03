#!/bin/bash

/bin/cat > /etc/sysctl.conf << _sysctl
fs.nr_open = 5242880
fs.file-max = 4194304
kernel.core_uses_pid = 1 
kernel.msgmax = 1048560 
kernel.msgmnb = 1073741824 
kernel.shmall = 4294967296 
kernel.shmmax = 68719476736 
kernel.sysrq = 0 
net.core.netdev_max_backlog = 1048576 
net.core.rmem_default = 2097152 
net.core.rmem_max = 16777216 
net.core.somaxconn = 1048576 
net.core.wmem_default = 2097152 
net.core.wmem_max = 16777216 
net.ipv4.conf.default.accept_source_route = 0 
net.ipv4.conf.default.rp_filter = 1
net.ipv4.ip_forward = 1
net.ipv4.ip_local_port_range = 1024    65000 
net.ipv4.neigh.default.gc_thresh1 = 10240 
net.ipv4.neigh.default.gc_thresh2 = 40960 
net.ipv4.neigh.default.gc_thresh3 = 81920 
net.ipv4.netfilter.ip_conntrack_max = 819200 
net.ipv4.ip_conntrack_max = 819200 
net.ipv4.netfilter.ip_conntrack_tcp_timeout_close_wait = 60
net.ipv4.netfilter.ip_conntrack_tcp_timeout_fin_wait = 120
net.ipv4.netfilter.ip_conntrack_tcp_timeout_time_wait = 120
net.ipv4.tcp_fin_timeout = 10
net.ipv4.tcp_keepalive_intvl = 15
net.ipv4.tcp_keepalive_probes = 5
net.ipv4.tcp_keepalive_time = 30
net.ipv4.tcp_max_orphans = 3276800
net.ipv4.tcp_max_syn_backlog = 1048576
net.ipv4.tcp_max_tw_buckets = 10000 
net.ipv4.tcp_mem = 94500000 915000000 927000000 
net.ipv4.tcp_orphan_retries = 3
net.ipv4.tcp_reordering = 5
net.ipv4.tcp_retrans_collapse = 0
net.ipv4.tcp_retries2 = 5
net.ipv4.tcp_rmem = 4096        87380   16777216
net.ipv4.tcp_sack = 1
net.ipv4.tcp_synack_retries = 1 
net.ipv4.tcp_syncookies = 0 
net.ipv4.tcp_syn_retries = 1
net.ipv4.tcp_timestamps = 0
net.ipv4.tcp_tw_recycle = 0 
net.ipv4.tcp_tw_reuse = 1 
net.ipv4.tcp_window_scaling = 1
net.ipv4.tcp_wmem = 4096        16384   16777216
net.ipv6.conf.all.disable_ipv6 = 1 
net.ipv6.conf.default.disable_ipv6 = 1 
vm.swappiness = 0 
_sysctl

/bin/cat > /etc/resolv.conf << _resolv
nameserver 114.114.114.114
nameserver 8.8.4.4
nameserver 8.8.8.8
_resolv

grep '^UseDNS no' /etc/ssh/sshd_config || echo "UseDNS no" >> /etc/ssh/sshd_config
echo -ne "source /etc/profile\nsysctl -e -p\nntpdate -b cn.pool.ntp.org && hwclock --systohc\n" >> /etc/rc.local
sed -i 's/GSSAPIAuthentication yes/GSSAPIAuthentication no/g' /etc/ssh/ssh_config

/bin/cat > /etc/profile.d/history.sh << _history
#!/bin/bash
HISTSIZE=5000
HISTFILESIZE=5000
HISTTIMEFORMAT="%F %T "
export HISTSIZE HISTFILESIZE HISTTIMEFORMAT
_history

/bin/cat > /etc/profile.d/ulimit.sh << _ulimit
#!/bin/bash
[ "\$(id -u)" == "0" ] && ulimit -n 4194304
ulimit -u 10000
_ulimit

/bin/cat > /etc/profile.d/rm.sh << _rm
#!/bin/bash
alias rm="/bin/rm --preserve-root --verbose ${interactive}"
_rm

/bin/cat > /etc/security/limits.conf  << _limits
* soft nproc 10000
* hard nproc 10000
* soft nofile 4194304
* hard nofile 4194304
_limits

/bin/cat > /etc/security/limits.d/90-nproc.conf << _limits1
root       soft    nproc     unlimited
_limits1

chmod +x /etc/profile.d/ulimit.sh /etc/profile.d/history.sh