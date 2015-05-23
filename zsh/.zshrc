# Zsh config for interactive terminals only

# get the dotfiles repo directory
ZSHFILES=$HOME/.dotfiles/zsh

# configure oh-my-zsh
ZSH=$HOME/.oh-my-zsh
ZSH_THEME="simple"
DISABLE_AUTO_UPDATE="true"
DISABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"

plugins=(extract)

# load oh-my-zsh
source $ZSH/oh-my-zsh.sh

source ~/.zshenv

source $ZSHFILES/completion
source $ZSHFILES/aliases

# These helper functions are the result of mashing together several posts on StackOverflow

function gitdirty() {
	[[ $(git diff --shortstat 2> /dev/null | tail -n1) != "" ]] && echo "*"
}

function gitbranch() {
	echo $(git symbolic-ref --short --quiet HEAD || "")
}

function getrprompt() {
	if [ -d .git ]; then
		echo $(gitbranch)$(gitdirty) $(nvm current)
	fi
}

PROMPT='%{$fg[green]%}%~%{$reset_color%} '
RPROMPT='$(getrprompt)'

# machine-specific configuration
source ~/.zshrc.user
