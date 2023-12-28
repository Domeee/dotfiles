##
# HISTORY
##
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000

##
# PROMPT
##

# perform parameter expansion/command substitution in prompt
setopt PROMPT_SUBST

# load git branch
precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
RPROMPT=\$vcs_info_msg_0_
zstyle ':vcs_info:git:*' formats '%b'

# load zsh vim mode
vim_ins_mode="INSERT"
vim_cmd_mode="NORMAL"
vim_mode=$vim_ins_mode

function zle-keymap-select {
  vim_mode="${${KEYMAP/vicmd/${vim_cmd_mode}}/(main|viins)/${vim_ins_mode}}"
  zle reset-prompt
}
zle -N zle-keymap-select

function zle-line-finish {
  vim_mode=$vim_ins_mode
}
zle -N zle-line-finish

PROMPT='%B%F{blue}[%f%b%~%B%F{blue}]%f%b%  '
RPROMPT='%F{8}[${vim_mode}] [$vcs_info_msg_0_]%f'

##
# ENVIRONMENT
##
export EDITOR=nvim
export TERMINAL=kitty
export ANDROID_HOME=$HOME/Android/Sdk
export KEYTIMEOUT=1
export BROWSER=firefox-developer-edition
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/.local/bin
export PRETTIERD_DEFAULT_CONFIG=$HOME/.config/prettier/.prettierrc
export _Z_DATA=$HOME/.config/z/.z
export ENERJOY_CONFIG_HOME=/home/dome/code/enerjoy
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/ripgrep.conf
export QT_STYLE_OVERRIDE=adwaita-dark
export GLAMOUR_STYLE=/home/dome/.config/glow/mosel.json

##
# ALIAS
##
alias v="nvim"
alias vs="nvim --listen /tmp/nvim.pipe"
alias sudo="sudo "
alias ga="git add --all"
alias gc="git commit -m"
alias gl="git log --oneline --no-merges"
alias gs="git status"
alias ls='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias open="xdg-open"
alias hexdocs="mix hex.docs online"
# https://docs.unity3d.com/Manual/CommandLineArguments.html
# -projectPath <pathname>
UNITYVERSION="2021.3.2f1"
alias unity="GDK_SCALE=2 GDK_DPI_SCALE=0.5 prime-run /home/dome/Unity/Hub/Editor/$UNITYVERSION/Editor/Unity -projectPath"
alias sshk="kitty +kitten ssh"

##
# FUNCTIONS
##
function to {
  touch $1
  /usr/bin/xdg-open $1
}

function ex-watch {
  fswatch -r -m poll_monitor lib/ test/ | MIX_ENV=test mix test --stale --listen-on-stdin
}

function enerjoy {
  ./bin/enerjoy.sh $@
}

function ai {
  sgpt $@ | glow
}

##
# KEYBINDINGS
##
bindkey -v # zsh vim mode
bindkey '^ ' autosuggest-accept # <CTRL><SPACE> to accept
bindkey -M viins '^l' vi-cmd-mode # exit insert mode with <CTRL>l

##
# MISC
##
source /usr/share/z/z.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source /opt/asdf-vm/asdf.sh

##
# ZSH
##
setopt autocd extendedglob nomatch notify
unsetopt beep
zstyle :compinstall filename '/home/dome/.zshrc'
zstyle ':completion:*' completer _complete _ignored _approximate
autoload -Uz compinit promptinit vcs_info zcalc
compinit
promptinit
