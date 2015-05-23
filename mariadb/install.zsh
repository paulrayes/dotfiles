#!/bin/zsh
. `pwd`/include.zsh

if ! [ -f /etc/apt/sources.list.d/mariadb.list ]; then
	sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
	#sudo add-apt-repository 'deb http://nyc2.mirrors.digitalocean.com/mariadb/repo/10.0/ubuntu vivid main'
	echo "deb http://nyc2.mirrors.digitalocean.com/mariadb/repo/10.0/ubuntu "$(lsb_release -sc)" main" | sudo tee /etc/apt/sources.list.d/mariadb.list
	sudo apt-get update
fi

ensurePackageInstalled mariadb-server
