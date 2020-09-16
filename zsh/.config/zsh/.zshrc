# source some plugins
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# shell history
# where to save history file
HISTFILE="$ZDOTDIR/.zhistory"
# add timestamp for each history
setopt EXTENDED_HISTORY
# commands the shell should remember in the session
SAVEHIST=5000
# commands the shell should remember in the history file
HISTSIZE=2000
# share history across multiple zsh sessions
setopt SHARE_HISTORY
# append to history
setopt APPEND_HISTORY
# adds commands as they are typed, not at shell exit
setopt INC_APPEND_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST
# do not store duplications
setopt HIST_IGNORE_DUPS
#ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# removes blank lines from history
setopt HIST_REDUCE_BLANKS

autoload -U colors && colors

autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

# spaceship prompt
fpath=( "$XDG_CONFIG_HOME/zsh/.zfunctions" $fpath )
autoload -U promptinit; promptinit
prompt spaceship

SPACESHIP_PROMPT_ORDER=(
  dir           # Current directory section
  git           # Git section (git_branch + git_status)
  venv          # virtualenv section
  pyenv         # Pyenv section
  line_sep      # Line break
  char          # Prompt character
)

# options
# http://zsh.sourceforge.net/Doc/Release/Options.html#Options
setopt AUTO_CD
setopt COMPLETE_ALIASES

# set zle to vi mode (default)
bindkey -v

# autosuggestion
bindkey '^f' autosuggest-accept
# first try to find a suggestion from your history
# if it can't find a match, will find a suggestion from the completion engine
ZSH_AUTOSUGGEST_STRATEGY=(history completion)
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
ZSH_AUTOSUGGEST_USE_ASYNC=true

# work with fzf and ripgrep
source /usr/share/fzf/shell/key-bindings.zsh
# find file
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
# enter into searched folder
export FZF_ALT_C_COMMAND='rg --sort-files --files --null 2> /dev/null | xargs -0 dirname | uniq'
# default color scheme (gruvbox)
export FZF_DEFAULT_OPTS='
  --color=bg+:#32302f,bg:#282828,spinner:#fe8019,hl:#928374
  --color=fg:#d5c4a1,header:#fb4934,info:#d65d0e,pointer:#d3869b
  --color=marker:#719e07,fg+:#fbf1c7,prompt:#83a598,hl+:#fabd2f
'

# nvm zsh plugin
[ ! -d "$XDG_CONFIG_HOME/my-nvm-dir" ] && mkdir -p "$XDG_CONFIG_HOME/my-nvm-dir"
export NVM_DIR="$XDG_CONFIG_HOME/my-nvm-dir"
export NVM_LAZY_LOAD=true
source "$HOME/workspace/bluehat/zsh-nvm/zsh-nvm.plugin.zsh"

# less history file
export LESSHISTFILE="$XDG_CACHE_HOME/lesshst"

# alias
alias ls='lsd'
alias ll='ls -alh'
alias m='mock -r ${OS:-default} --quiet --chroot --unpriv --cwd=`pwd`'
alias ms='mock -r ${OS:-default} --quiet --shell --unpriv -- bash -l'
alias wget="wget --hsts-file $XDG_CACHE_HOME/wget/wget-hsts"
alias xkb='setxkbmap -layout us,cn -option "caps:ctrl_modifier"'
