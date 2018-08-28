#!/bin/bash

### use at your own risk! this is for educational and informational purposes only! no warranty or guarantees at all! ###
### this script will update configured packagelists, perform a dist-upgrade and remove unneeded packages using "Advanced Packaging Tool" ###

update(){
	# -qq implies -y
	sudo apt-get -qq update
}

upgrade(){
	# -qq implies -y
	sudo apt-get -qq dist-upgrade
}

autoremove(){
	# -qq implies -y
	sudo apt-get -qq autoremove
}

echo "running packagelist update"
update
echo "upgrading system"
upgrade
echo "removing unneeded packages"
autoremove
