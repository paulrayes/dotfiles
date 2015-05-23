#!/bin/zsh
. `pwd`/include.zsh

ensurePackageInstalled ruby-full

if ! doesCommandExist bundle; then
	sudo gem install bundler
fi

# We are not installing jekyll itself, you should have a Gemfile to do that for you for the
# same reason you use a package.json instead of installing npm modules individually
