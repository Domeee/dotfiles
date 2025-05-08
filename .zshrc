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
export ANDROID_HOME=$HOME/Android/Sdk
export KEYTIMEOUT=1
export BROWSER=firefox-developer-edition
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$HOME/.local/bin
export _Z_DATA=$HOME/.config/z/.z
export ENERJOY_CONFIG_HOME=/home/dome/code/enerjoy
export RIPGREP_CONFIG_PATH=$HOME/.config/ripgrep/ripgrep.conf
export QT_STYLE_OVERRIDE=adwaita-dark

# ASDF-VM
export ASDF_DIR=$HOME/.config/asdf
export ASDF_DATA_DIR=$HOME/.config/asdf
export PATH=$PATH:$ASDF_DATA_DIR/shims

# Ranger
export FZF_MARKS_FILE=$HOME/.config/ranger/plugins/fzf-marks/.fzf-marks

# Do not treat _ - / as part of a word
# Use single quote to circumvent unwanted expansions (https://superuser.com/a/847842)
export WORDCHARS='*?.[]~=&;!#$%^(){}<>'

# Explicitly set XDG base directories to avoid conflicts with other applications
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"

export CLAUDE_CONFIG_DIR="${XDG_CONFIG_HOME:-$HOME/.config}/claude"

##
# ALIAS
##
alias v="nvim"
alias vs="nvim --listen ${XDG_RUNTIME_DIR:-/tmp}/nvim.pipe"
alias sudo="sudo "
alias ga="git add --all"
alias gc="git commit -m"
alias gl="git log --oneline --no-merges"
alias gs="git status"
alias ls='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias open="xdg-open"
alias sshk="kitty +kitten ssh"
alias ai="sgpt"
alias aider="aider --config $HOME/.config/aider/.aider.conf.yml --env $HOME/.config/aider/.env"

# remove when 0.13 is released
alias lnav="/opt/lnav-0.13.0-rc2/lnav"

##
# FUNCTIONS
##
function to {
  touch $1
  /usr/bin/xdg-open $1
}

function enerjoy {
  ./bin/enerjoy.sh $@
}

function darkheit {
  ./darkheit.sh $@
}

function swayconfig {
  config_whitelist=(
    "default"
    "gaming"
    "4k"
  )

  if [[ ! " ${config_whitelist[@]} " =~ " $1 " ]]; then
    echo "Invalid config name. Available configs: ${config_whitelist[@]}"
    return 1
  fi

  /home/dome/bin/swayconfig.${1}.sh
}

##
# KEYBINDINGS
##
bindkey -v # zsh vim mode
bindkey '^W' backward-delete-word
bindkey '^ ' autosuggest-accept # <CTRL><SPACE> to accept
bindkey -M viins '^l' vi-cmd-mode # exit insert mode with <CTRL>l
bindkey '^R' history-incremental-search-backward 

##
# MISC
##
source /usr/share/z/z.sh
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Set up fzf key bindings and fuzzy completion
source <(fzf --zsh)


##
# ZSH
##
setopt autocd extendedglob nomatch notify
unsetopt beep
zstyle :compinstall filename '/home/dome/.zshrc'
zstyle ':completion:*' completer _complete _ignored _approximate
fpath=(${ASDF_DATA_DIR}/completions $fpath)
autoload -Uz compinit promptinit vcs_info zcalc
compinit
promptinit
