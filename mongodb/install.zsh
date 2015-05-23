#!/bin/zsh
. `pwd`/include.zsh

# Mongo installation steps from bevacqua/dotfiles
# https://github.com/bevacqua/dotfiles/blob/master/ubuntu/dev.zsh

if ! [ -f /etc/apt/sources.list.d/mongodb.list ]; then
	sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
	echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
	sudo apt-get update
fi

ensurePackageInstalled mongodb-10gen

# Install robomongo like we're downloading it from their website
# Unfortunately this locks the version number

if ! doesCommandExist robomongo; then
	mkdir -p temp
	cd temp
	curl http://robomongo.org/files/linux/robomongo-0.8.5-x86_64.deb -o robomongo.deb
	sudo gdebi --n robomongo.deb
fi
