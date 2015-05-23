#!/bin/zsh
. `pwd`/include.zsh

# sublime text 3
if ! isPackageInstalled sublime-text-installer
then
	sudo add-apt-repository -y ppa:webupd8team/sublime-text-3
	sudo apt-get update
	sudo apt-get install -y sublime-text-installer
fi

mkdir -p ~/.config/sublime-text-3/Packages/User
mkdir -p ~/.config/sublime-text-3/Installed\ Packages

# st3 as default text editor
sudo sed -i 's/gedit.desktop/sublime_text.desktop/g' /usr/share/applications/defaults.list

# st3 preferences
#ln -sfn $PWD/st3/preferences ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings
cp $PWD/st3/Preferences.sublime-settings ~/.config/sublime-text-3/Packages/User/Preferences.sublime-settings

# st3 package control plugin
if ! [ -f ~/.config/sublime-text-3/Installed\ Packages/Package\ Control.sublime-package ]
then
	curl https://sublime.wbond.net/Package%20Control.sublime-package -o ~/.config/sublime-text-3/Installed\ Packages/Package\ Control.sublime-package
fi
