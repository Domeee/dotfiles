##
# ENVIRONMENT
##
export EDITOR=nano
export VISUAL=code
export NVM_DIR="$HOME/.nvm"

##
# ZSH
##
# Path to your oh-my-zsh installation.
export ZSH=/home/dome/.oh-my-zsh

##
# THEME
##
ZSH_THEME="powerlevel9k/powerlevel9k"

##
# THEME POWERLEVEL9K
##
DEFAULT_USER=dome
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)

##
# HISTORY
##
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

##
# COMPLETION
##
zstyle :compinstall filename '/home/dome/.zshrc'
autoload -Uz compinit
compinit
# Fix slow Git completion
__git_files () {
	_wanted files expl 'local files' _files }

##
# KEYBINDINGS
##
bindkey -e		# emacs keybindings

##
# OH-MY-ZSH
##
source $ZSH/oh-my-zsh.sh

##
# OH-MY-ZSH PLUGINS
##
plugins=()

##
# ALIASES
##
# enable sudo for aliases
alias sudo='sudo '
alias ls='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
# Git
alias ga='git add --all'
alias gc='git commit -m'
alias gs='git status'

##
# FUNCTIONS
##
# browser-sync
browser-sync-server() {
  browser-sync start --server --files "$1" --no-notify
}

browser-sync-proxy() {
  browser-sync start --proxy "$1" --files "$2" --no-notify
}

load-nvm() {
export NVM_DIR="$HOME/.nvm"
export NVM_SOURCE="/usr/share/nvm"
[ -s "$NVM_SOURCE/nvm.sh" ] && . "$NVM_SOURCE/nvm.sh"
}
