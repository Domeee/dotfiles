##
# ZSH
##
# Path to your oh-my-zsh installation.
export ZSH=/home/dome/.oh-my-zsh
# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

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

##
# Node Version Manager
##
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
