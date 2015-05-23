# Zsh config for all terminals, both interactive and not

# customize path
export PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/binbin:$PATH

# set default editor
export EDITOR="subl -w"

# node version manager
[ -s $HOME/.nvm/nvm.sh ] && . $HOME/.nvm/nvm.sh

# machine-specific configuration
source ~/.zshenv.user
