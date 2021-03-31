export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'

autoload -U compinit
compinit

# zsh autosuggestions
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

export LSCOLORS=exfxcxdxbxegedabagacad
# export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -GF"
alias gls="gls --color"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# history
HISTFILE=$HOME/.zsh_history
HISTSIZE=1000
SAVEHIST=100000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY
setopt HIST_NO_STORE

# git settings
autoload -Uz vcs_info
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
zstyle ':vcs_info:*' actionformats '[%b|%a]'
# PROMPT='%c '\$vcs_info_msg_0_' %# '
# PROMPT='%~'\$vcs_info_msg_0_' $ '
PROMPT='%F{blue}%~%f $ '
RPROMPT=$RPROMPT'${vcs_info_msg_0_}'
precmd(){ vcs_info }

# use .zshrc.local if you want to write local settings 
[ -f ~/.zshrc.local ] && source ~/.zshrc.local
