# source some plugins
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

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
  node          # Node.js section
  ruby          # Ruby section
  golang        # Go section
  rust          # Rust section
  haskell       # Haskell Stack section
  venv          # virtualenv section
  pyenv         # Pyenv section
  line_sep      # Line break
  char          # Prompt character
)

# options
# http://zsh.sourceforge.net/Doc/Release/Options.html#Options
setopt SHARE_HISTORY
setopt HIST_IGNORE_ALL_DUPS
setopt AUTO_CD
setopt COMPLETE_ALIASES

# set zle to vi mode (default)
bindkey -v

# autosuggestion
bindkey '^f' autosuggest-accept
# first try to find a suggestion from your history
# if it can't find a match, will find a suggestion from the completion engine
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

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

# alias
alias ls='lsd'
alias ll='ls -alh'
