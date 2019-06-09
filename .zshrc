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

# Allow user-wide installation of packages
PATH="$HOME/.node_modules/bin:$PATH"
export npm_config_prefix=~/.node_modules

# Ruby
export GEM_HOME=$HOME/.gem
# allow RubyGems to be executed
export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

##
# THEME
##
source /usr/share/zsh-theme-powerlevel9k/powerlevel9k.zsh-theme
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
browser-sync-server() {
  browser-sync start --server --files "$1" --no-notify --index index.html --no-open --no-ui
}

browser-sync-server-ssl() {
  browser-sync start --server --files "$1" --no-notify --index index.html --no-open --no-ui --https
}

browser-sync-proxy() {
  browser-sync start --proxy "$1" --files "$2" --no-notify --index index.html --no-open --no-ui
}
