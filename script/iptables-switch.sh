#!/bin/bash
# iptables.sh status | disable | enable
ipt_mod_conf="/etc/modprobe.d/iptables.conf"
ipt_mod_list="iptable_filter xt_length xt_tcpudp ipt_MASQUERADE xt_conntrack xt_multiport xt_addrtype ip_vs iptable_nat nf_conntrack_ipv4 nf_defrag_ipv4 nf_nat_ipv4 nf_nat nf_conntrack x_tables ip_tables"
disable_ipt_mod=0
nf_max=$(sysctl -e -n net.nf_conntrack_max)
nf_cur=$(sysctl -e -n net.netfilter.nf_conntrack_count)
ipt_hsize=$(grep 'MemTotal' /proc/meminfo | awk '{printf("%d",$2/64)}')

fuck_ipt_mod(){
[ $disable_ipt_mod ] && echo '# disable iptables conntrack modules' > ${ipt_mod_conf}
for ipt_mod in ${ipt_mod_list}; do
    [ $disable_ipt_mod ] && echo "blacklist ${ipt_mod}" >> ${ipt_mod_conf}
    modprobe -r ${ipt_mod}
done
}

clean_ipt_rule(){
iptables -F
iptables -Z
iptables -X
for ipt_table in $(cat /proc/net/ip_tables_names 2>/dev/null); do
    iptables -t ${ipt_table} -F
    iptables -t ${ipt_table} -Z
    iptables -t ${ipt_table} -X
    echo "Table: ${ipt_table} stopped."
done
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT
}

ipt_enable(){
echo "options nf_conntrack hashsize=${ipt_hsize}" > ${ipt_mod_conf} # /sys/module/nf_conntrack/parameters/hashsize
for ipt_mod in ${ipt_mod_list}; do
    modprobe -a ${ipt_mod}
done
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
    disable_ipt_mod=1
    $0 disable
    ;;
disable)
    clean_ipt_rule
    fuck_ipt_mod
    $0 status
    ;;
enable)
    ipt_enable
    $0 status
;;
*)
    echo "Usage: $0 {status|stop|disable|enable}"
    exit 2
    ;;
esac
exit 0
