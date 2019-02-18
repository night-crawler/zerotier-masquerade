#!/usr/bin/env sh

ZEROTIER_INTERFACE="zt0"
INTERFACES=`ip r l | cut -d' ' -f 3 | grep eth | sort`

for iface in ${INTERFACES}
do
    echo "Applying iptables routing rules for interface '$iface'"
    iptables -A FORWARD -i ${ZEROTIER_INTERFACE} -o ${iface} -j ACCEPT
    iptables -A FORWARD -i ${iface} -o ${ZEROTIER_INTERFACE} -m state --state ESTABLISHED,RELATED -j ACCEPT
    iptables -t nat -A POSTROUTING -o ${iface} -j MASQUERADE
done
