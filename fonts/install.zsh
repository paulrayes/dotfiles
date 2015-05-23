#!/bin/zsh

# google web fonts
if ! [ -d ~/.fonts/gwf ]; then
	mkdir -p ~/.fonts
	git clone --depth 1 https://github.com/google/fonts/ ~/.fonts/gwf
	fc-cache -vf ~/.fonts
fi