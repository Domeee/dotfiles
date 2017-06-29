# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias sudo='sudo '
alias ls='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias wifi='sudo wifi-menu -o'

PS1='[\u@\h \W]\$ '

# Node version manager
source /usr/share/nvm/init-nvm.sh
