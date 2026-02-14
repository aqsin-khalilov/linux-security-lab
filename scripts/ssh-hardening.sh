#!/bin/bash

echo "Starting SSH Hardening..."

#Backup original config
cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

#Disable root login
sed -i 's/^#PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config
sed -i 's/^PermitRootLogin yes/PermitRootLogin no/' /etc/ssh/sshd_config

#Disable password authentication 
sed -i 's/^#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config
sed -i 's/^PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config

#Change SSH port to 2222
sed -i 's/^#Port 22/Port 2222/' /etc/ssh/sshd_config
sed -i 's/^Port 22/Port 2222/' /etc/ssh/sshd_config

#Restart SSH service
systemctl restart sshd

echo "SSH Hardening completed successfully."

