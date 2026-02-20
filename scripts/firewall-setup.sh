#!/bin/bash

#Firewall setup for Linux Security lab
#Zones: public, drop, block
#Rich rules: SSH, ICMP, custom ports

echo "Setting up firewall zones and rules..."

#Ensure firewalld is running
systemctl enable --now firewalld

#Add custom zones (if they don`t exist)
for zone in drop block; do
	if ! firewall-cmd --get-zones | grep -qw $zone; then
		firewall-cmd --new-zone=$zone --permanent
	fi
done

#Reload to apply new zones
firewall-cmd --reload

#Example rich rules
firewall-cmd --zone=drop --add-rich-rule='rule family="ipv4" source address="192.168.0.108" reject'
firewall-cmd --zone=block --add-rich-rule='rule family="ipv4" source address="192.168.0.107" drop'

#Reload firewalld
firewall-cmd --reload

echo "Firewall setup completed."
firewall-cmd --list-all-zones


