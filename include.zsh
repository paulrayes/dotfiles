#!/bin/zsh

. `pwd`/vars.zsh

isPackageInstalled() {
	# From somewhere on Stack Overflow
	#dpkg --get-selections | grep -q "^$1[[:space:]]*install$" >/dev/null;
	dpkg --get-selections | grep $1 > /dev/null;
	return $?
}

ensurePackageInstalled() {
	if ! isPackageInstalled $1
	then
		sudo apt-get install -y $1
	fi
}

doesCommandExist() {
	# From somewhere on Stack Overflow
	which $1 | grep "$1 not found" > /dev/null
	return !$?
}
