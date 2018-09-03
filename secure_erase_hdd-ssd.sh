#!/bin/bash

### This script is destructive! All data on the disk you specify will be wiped! ###
### use at your own risk! this is for educational and informational purposes only! no warranty or guarantees at all! ###

# This scripts erases a harddrive using the ata secure erase command.
# hdparm tells you in the "Security:" section which mode is supported and if the disk is frozen or not frozen.
# To successfully erase a disk it needs to be "not frozen".
# The harddrive must be connected using esata or internal sata port.
# Do not use this script if the disk is connected to a USB port!
# To successfully erase a disk follow these steps:
# 1. boot system
# 2. connect power cable to disk
# 3. connect data cable to disk
# 4. execute this script

# set argument 1 to sdz if you like to wipe disk sdz
read -p "Please input disk you want to wipe (eg sdz or sdaz): " device
disk=/dev/${device}

# set pw for wiping the disk
read -p "Please input password for wiping: " pw

# rescan sata port 2
echo "- - -" > /sys/class/scsi_host/host2/scan

# set password "CHANGEME" for hdd/ssd
hdparm --user-master u --security-set-pass $pw $disk

# secure erase hdd/ssd
time hdparm --user-master u --security-erase $pw $disk

# if supported you can also secure enhanced erase the disk 
#time hdparm --user-master u --security-erase-enhanced $pw $disk

# check hdd/ssd
hdparm -I $disk

# remove hdd/ssd from system
echo 1 | sudo tee /sys/block/${device}/device/delete
