#!/bin/bash
# iptables-stop.sh status | stop | disable | tunning
ipt_mod_conf="/etc/modprobe.d/iptables-blacklist.conf"
nf_max=$(sysctl -e -n net.nf_conntrack_max)
nf_cur=$(sysctl -e -n net.netfilter.nf_conntrack_count)

fuck_ipt_mod(){
/bin/cat > ${ipt_mod_conf} << _rm-ipt-modprobe
blacklist iptable_nat
blacklist ipt_REDIRECT
blacklist nf_conntrack
blacklist nf_conntrack_ftp
blacklist nf_conntrack_ipv4
blacklist nf_conntrack_ipv6
blacklist nf_nat
blacklist xt_conntrack
blacklist xt_state
_rm-ipt-modprobe
for ipt_mod in $(awk '{print $NF}' ${ipt_mod_conf}); do
    modprobe -r ${ipt_mod}
done
}

clean_ipt_rule(){
iptables -F
iptables -X
iptables -Z
for ipt_table in $(cat /proc/net/ip_tables_names 2>/dev/null); do
    iptables -t ${ipt_table} -F
    iptables -t ${ipt_table} -X
    iptables -t ${ipt_table} -Z
done
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
}

ipt_tunning(){
/bin/cat > ${ipt_mod_conf} << _rm-ipt-modprobe
options nf_conntrack hashsize=262144
_rm-ipt-modprobe
modprobe -r nf_conntrack && modprobe -a nf_conntrack
dmesg --reltime | grep nf_conntrack | tail -2 2>/dev/null
sysctl -e -w net.nf_conntrack_max=4194304
sysctl -e -w net.ipv4.netfilter.ip_conntrack_max=4194304
sysctl -e -w net.netfilter.nf_conntrack_max=4194304
sysctl -e -w net.netfilter.nf_conntrack_tcp_timeout_established=1200
sysctl -e -w net.netfilter.nf_conntrack_tcp_timeout_close_wait=60
sysctl -e -w net.netfilter.nf_conntrack_tcp_timeout_fin_wait=120
sysctl -e -w net.netfilter.nf_conntrack_tcp_timeout_time_wait=120
}

case "$1" in
status)
    if [[ -z ${nf_max} ]]; then
        echo 'nf_conntrack disabled.'
    else
        echo "nf_conntrack used: ${nf_cur}/${nf_max}."
    fi
    ;;
stop)
    clean_ipt_rule
    $0 status
    ;;
disable)
    $0 stop
    fuck_ipt_mod
    ;;
tunning)
    ipt_tunning
    $0 status
;;
*)
    echo "Usage: $0 {status|stop|disable|tunning}"
    exit 2
    ;;
esac
exit 0
