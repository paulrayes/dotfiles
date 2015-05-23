#!/bin/zsh

sudo cp $PWD/zsh/.zshrc ~/.zshrc
sudo cp $PWD/zsh/.zshenv ~/.zshenv

if ! [ -f ~/.zshrc.user ]; then
	echo "# insert machine-specific configuration here, this file will be sourced in interactive shells" > ~/.zshrc.user
fi

if ! [ -f ~/.zshenv.user ]; then
	echo "# insert machine-specific configuration here, this file will be sourced in both interactive and non-interactive shells" > ~/.zshenv.user
fi
