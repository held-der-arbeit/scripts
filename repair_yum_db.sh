#!/bin/bash

### use at your own risk! this is for educational and informational purposes only! no warranty or guarantees at all! ###
### this script will repair the yum db if it is somehow broken and yum is not working as intended. ###

rm -f /var/lib/rpm/__db*
rpm --rebuilddb
yum clean all
