#!/bin/bash

#Selinux status check for Linux Security Lab
echo "Checking Selinux status..."

#Quick status
SELINUX_STATUS=$(getenforce)
echo "Current Selinux status: $SELINUX_STATUS"

#Detail status
sestatus

#Optional recommendations
if [ "$SELINUX_STATUS" != "Enforcing" ]; then
	echo " Selinux is not enforcing. Recommended to enable it."
fi

