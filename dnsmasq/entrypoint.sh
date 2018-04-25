#!/bin/sh


#Get specific information about the IP address
HEAD=$(echo $IP | cut -d '.' -f 1,2,3)
TAIL=$(echo $IP | cut -d '/' -f 1)

#Set static IP
ifconfig $DEVICE up
ip addr add $IP dev $DEVICE

#Postrouting for iptables
iptables -t nat -C POSTROUTING -s $HEAD.0/24 -j MASQUERADE || iptables -t nat -A POSTROUTING -s $HEAD.0/24 -j MASQUERADE
iptables -t filter -C FORWARD -o $DEVICE -j ACCEPT || iptables -t filter -A FORWARD -o $DEVICE -j ACCEPT
iptables -t filter -C FORWARD -i $DEVICE -j ACCEPT || iptables -t filter -A FORWARD -i $DEVICE -j ACCEPT



#Complete dnsmasq configuration file
sed -in "s/dhcp-range=.*/dhcp-range=$HEAD.50,$HEAD.101,1h/g" /etc/dnsmasq.conf
sed -in "s/dhcp-option=.*/dhcp-option=3,$TAIL/g" /etc/dnsmasq.conf
sed -in "s/interface=.*/interface=$DEVICE/g" /etc/dnsmasq.conf
sed -in "s/dhcp-boot=.*/dhcp-boot=$BOOT/g" /etc/dnsmasq.conf

exec $*
