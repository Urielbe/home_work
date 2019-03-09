#!/bin/bash

##########
#created by: uriel
#date: 9.3.19
#purpose: nmcli - script
#version: 1.0.0
########

#####VAR####

echo "############--Begin Config your Network--############"
###DEVICE######
nmcli dev status| awk '{print$1}'
echo "Select Device to configure"
echo "Please enter your device:"
read device
echo "Your Device is: $device"
####Profile#####
echo "Please enter Name for profile"
read profile
echo "Your Profile is: $profile"
#####IP/Net-mask/Default-gateway/dns####
echo "Please enter IP (Example 10.0.0.2/24)"
read ipv4
echo "Now enter your Default gateway"
read dg
echo "now enter DNS server (for two dns server "8.8.8.8 1.1.1.1") "
read dnssrv
##########################COMMAND__NMCLI################################
nmcli connection add type ethernet con-name $profile ifname $device ip4 $ipv4 gw4 $dg
nmcli con mod $profile ipv4.dns $dnssrv
nmcli device status 

echo "All done"


