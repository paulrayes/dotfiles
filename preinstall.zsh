#!/bin/zsh
. `pwd`/include.zsh

# These are installed first, before any install scripts are run. Thus, this is a good place
# to put things that are used often, such as curl. This is also a good place to install
# miscellanious 1-line packages like gimp that don't deserve their own file.

# Essentials
ensurePackageInstalled build-essential
ensurePackageInstalled libssl-dev
ensurePackageInstalled curl
ensurePackageInstalled gdebi

# Canonical Partner PPA
if ! [ -f /etc/apt/sources.list.d/partner.list ]; then
	echo "deb http://archive.canonical.com/ubuntu "$(lsb_release -sc)" partner" | sudo tee /etc/apt/sources.list.d/partner.list
	echo "deb-src http://archive.canonical.com/ubuntu "$(lsb_release -sc)" partner" | sudo tee /etc/apt/sources.list.d/partner-src.list
	sudo apt-get update
fi

# Google Chrome
if ! [ -f /etc/apt/sources.list.d/google-chrome.list ]; then
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
	sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
	sudo apt-get update
fi
ensurePackageInstalled google-chrome-stable
#ensurePackageInstalled google-chrome-beta

# GIMP for raster graphics
ensurePackageInstalled gimp

# Inkscape for vector graphics (SVG)
ensurePackageInstalled inkscape

# Screen recording software
ensurePackageInstalled gtk-recordmydesktop

# FTP
ensurePackageInstalled filezilla

# Git GUI
ensurePackageInstalled gitg

# IRC
ensurePackageInstalled xchat-gnome
ensurePackageInstalled xchat-gnome-indicator

# Python/PIP
ensurePackageInstalled python-pip

# Dropbox

if ! isPackageInstalled dropbox; then
mkdir -p temp
cd temp
wget -O dropbox.deb https://www.dropbox.com/download?dl=packages/ubuntu/dropbox_2015.02.12_amd64.deb
sudo gdebi --n dropbox.deb
fi
