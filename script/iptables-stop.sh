#!/bin/bash
# iptables-stop.sh status | stop | disable
ipt_mod_conf="/etc/modprobe.d/iptables-blacklist.conf"
nf_max=$(sysctl net.nf_conntrack_max 2>/dev/null)
nf_cur=$(wc -l /proc/net/nf_conntrack 2>/dev/null)

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
*)
    echo "Usage: $0 status|stop|disable"
    exit 2
    ;;
esac
exit 0
