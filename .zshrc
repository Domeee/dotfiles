##
# ENVIRONMENT
##
export TERMINAL=kitty
export EDITOR=nano
export VISUAL=code
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk/
export ANDROID_SDK_ROOT=/opt/android-sdk
export PATH=$PATH:$ANDROID_SDK_ROOT/tools
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export PATH=$PATH:$HOME/.dotnet/tools

# Allow user-wide installation of packages
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

# Ruby
export GEM_HOME=$HOME/.gem
# allow RubyGems to be executed
export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

##
# ZSH
##
zstyle :compinstall filename '/home/dome/.zshrc'
autoload -Uz compinit promptinit vcs_info
compinit
promptinit

##
# HISTORY
##
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

##
# COMPLETION
##
# Fix slow Git completion
__git_files () {
	_wanted files expl 'local files' _files }
kitty + complete setup zsh | source /dev/stdin

##
# PROMPT
##
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%b'

##
# KEYBINDINGS
##
bindkey -v		

##
# ALIASES
##
# enable sudo for aliases
alias sudo='sudo '
alias ls='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias cat='pygmentize -g'
# Git
alias ga='git add --all'
alias gc='git commit -m'
alias gs='git status'

##
# FUNCTIONS
##
browser-sync-server() {
  browser-sync start --server --files "$1" --no-notify --index index.html --no-open --no-ui
}

browser-sync-server-ssl() {
  browser-sync start --server --files "$1" --no-notify --index index.html --no-open --no-ui --https
}

browser-sync-proxy() {
  browser-sync start --proxy "$1" --files "$2" --no-notify --index index.html --no-open --no-ui
}

##
# ASDF
##
. /opt/asdf-vm/asdf.sh
. /opt/asdf-vm/completions/asdf.bash

