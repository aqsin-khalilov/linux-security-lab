#!/bin/bash

echo "Installing and configuring Fail2Ban..."

#Install Fail2Ban (RHEL_based systems)
dnf install fail2ban -y

#Enable and start service
systemctl enable --now fail2ban

#Create local jail configuration
cat <<EOF > /etc/fail2ban/jail.local
[sshd]
enabled = true
port = 2222
logpath = /var/log/secure
maxretry = 3
bantime = 600
findtime = 300
EOF

#Restart Fail2Ban
systemctl restart fail2ban

echo "Fail2Ban setup completed."

