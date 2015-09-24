#!/bin/bash
# https://github.com/sklochkov/performance-tuner/blob/master/src/network-queues.sh
cpus=`fgrep -c processor /proc/cpuinfo`
if [ $cpus -ge 32 ] ; then
    cpus=32
fi
q=`fgrep -i eth /proc/interrupts | awk '{print $1}' | cut -d: -f 1`

ENTR=$[4096*$cpus]

sysctl net.core.rps_sock_flow_entries=$ENTR >/dev/null 2>&1

if [ $? -gt 0 ] ; then
    echo "Kernel does not support net.core.rps_sock_flow_entries"
    exit 0
fi

k=0
for i in $q ; do
    affinity_mask=`printf "%01X" $[2**($k % $cpus)]`
    echo $affinity_mask > /proc/irq/$i/smp_affinity
    k=$[$k+1]
done

interfaces=`ifconfig | grep ^eth | awk '{print $1}' | fgrep -v :`
for t_iface in $interfaces ; do
    if [ -d /sys/class/net/$t_iface/queues ] ; then
        RX=`ls -ld /sys/class/net/$t_iface/queues/rx* 2>/dev/null | wc -l`
        TX=`ls -ld /sys/class/net/$t_iface/queues/tx* 2>/dev/null | wc -l`
        if [ $RX -gt 0 ] ; then
            for i in `seq $RX` ; do
                printf "%01X" $[2**$cpus - 1] > /sys/class/net/$t_iface/queues/rx-$[$i - 1]/rps_cpus
                echo $[$ENTR / $RX] > /sys/class/net/$t_iface/queues/rx-$[$i - 1]/rps_flow_cnt
            done
        fi
        if [ $TX -gt 0 ] ; then
            for i in `seq $TX` ; do
                printf "%01X" $[2**$cpus - 1] > /sys/class/net/$t_iface/queues/tx-$[$i - 1]/xps_cpus
            done
        fi
    fi
done
