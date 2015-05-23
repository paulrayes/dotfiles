#!/bin/zsh
. `pwd`/include.zsh

# Following the steps given on the Redis website

if ! [ -d /opt/redis ]; then
	cd /opt
	sudo wget http://download.redis.io/redis-stable.tar.gz
	sudo tar xzf redis-stable.tar.gz
	rm redis-stable.tar.gz
	sudo mv redis-stable redis
	cd redis
	sudo make
fi

# Install redis-desktop-manager like we're downloading it from their website
# Unfortunately this locks the version number

if ! doesCommandExist redis-desktop-manager; then
	mkdir -p temp
	cd temp
	curl https://github.com/uglide/RedisDesktopManager/releases/download/0.7.6/redis-desktop-manager_0.7.6.8_amd64_ubuntu.deb -o redis-desktop-manager.deb
	sudo gdebi --n redis-desktop-manager.deb
fi
