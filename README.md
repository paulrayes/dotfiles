# dotfiles

These are installation scripts and configuration files for much of the software I use.

Most programs are in their own folder, along with any configuration they require. This keeps the organization neat. However, some programs that are a single command to install may be in `preinstall.zsh` instead.

This is originally based on bevacqua/dotfiles but has been very heavily modified.

# Install On Ubuntu

Ensure everything is up to date and install git:

```shell
sudo apt-get update
sudo apt-get dist-upgrade
sudo apt-get install -y git
```

Make yourself [a private key for GitHub by following their instructions](https://help.github.com/articles/generating-ssh-keys/), or copy one from another computer.

Clone this repo:

```shell
git clone https://github.com/paulrayes/dotfiles.git ~/.dotfiles
```

Install zsh using the script below. It will ask for your password twice and automatically reboot. Apologies!

````shell
./installzsh
````

After boot, install everything else.

```shell
./install
```

You can re-run `install` as many times as you like.

# Features

- gdebi to install `.deb` files, better than dpkg and faster than the Ubuntu Software Center
- curl and other necessary things
- Google Chrome, GIMP, Inkscape, xchat, FileZilla, gitg
- Package managers: npm, gems, bundler, pip
- Languages: Ruby, Node.js
- Databases: MongoDB, MariaDB, Redis (in `/opt/redis`)
- Database management: Redis Desktop Manager, Robomongo
- Sublime Text 3 with Package Control
- Oh-My-Zsh with a simple theme showing git and nvm status
- zsh aliases: `clc`/`cls` for `clear` and `..` for `cd ..`
- All the Google Fonts

# Customization

- Anything placed in `~/.zshenv.user` will run on every shell instance
- Anything placed in `~/.zshrc.user` will run on every *interactive* shell instance
- Any other configuration files may be overwritten if you run `install` again. This is how I prefer it, if you want to change the configuration you should fork this repo and change it there, so all your computers are automatically in sync.

# Updating

Most software will update normally. To update software and install anything new added here, just do:

```shell
apt-get update
apt-get dist-upgrade
git pull
./install
```

I do not know how to make the following software update automatically, you will have to download new versions from their website:

- [Redis Desktop Manager](https://github.com/uglide/RedisDesktopManager/releases/latest)
- [Robomongo](http://robomongo.org/download.html)

# Useful Sublime Text packages

I do not know how to install some of these automatically. Just installing some would be confusing so I only install Package Control.

- Babel
- Handlebars
- LESS
- Siteleaf Liquid Syntax
- EditorConfig
- VCS Gutter

# License

MIT
