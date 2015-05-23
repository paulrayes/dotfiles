#!/bin/zsh
. `pwd`/include.zsh

# Use nvm to install so we can have multiple versions
# Installation instructions from the nvm readme

# nvm
if ! doesCommandExist nvm; then
	wget -qO- https://raw.githubusercontent.com/creationix/nvm/v0.25.3/install.sh | zsh
	source ~/.zshenv
fi

# node
if ! node --version | grep "v0.12" > /dev/null; then
	nvm install 0.12
	nvm alias default 0.12
	source ~/.zshenv
fi

# npm configuration
if ! npm whoami > /dev/null; then
	npm set init.author.name "$NAME"
	npm set init.author.email "$EMAIL"
	npm set init.author.url "$SITE"
	npm set save-exact true
	echo "Enter your npm login credentials"
	npm adduser
fi
