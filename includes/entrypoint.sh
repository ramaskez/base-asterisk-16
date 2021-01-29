#!/bin/bash

#Whats my ip?
IP=`hostname -i`

#Set Metida and Signal Address for PJSIP
sed -i "s/CHANGEMEIP/$IP/g" /etc/asterisk/pjsip.conf

#Start asterisk
asterisk -vvvvvvfp