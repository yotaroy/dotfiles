# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export EDITOR='vim'
export VISUAL='vim'
export PAGER='less'
bindkey -e

# zsh-completions
FPATH=${HOME}/.zsh/zsh-completions/src:${FPATH}

# completions for git
FPATH=${HOME}/.zsh/completion:${FPATH}
zstyle ':completion:*:*:git:*' script ${HOME}/.zsh/completion/git-completion.bash

# zinit
source ${HOME}/.zinit/bin/zinit.zsh

# activate completion
autoload -Uz compinit
compinit

# ------------------------------ zinit plugins ------------------------------
zinit light zsh-users/zsh-autosuggestions
zinit ice wait; zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-syntax-highlighting
zinit ice depth=1; zinit light romkatv/powerlevel10k

zinit ice from"gh-r" as"program"
zinit light junegunn/fzf
# zinit pack for fzf

export LSCOLORS=exfxcxdxbxegedabagacad
# export LSCOLORS=gxfxcxdxbxegedabagacad
export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'

alias ls="ls -GF"
alias gls="gls --color"

zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34'

# history
HISTFILE=${HOME}/.zsh_history
HISTSIZE=10000
SAVEHIST=100000
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt EXTENDED_HISTORY
setopt HIST_NO_STORE
setopt SHARE_HISTORY

# git settings
# autoload -Uz vcs_info
# setopt prompt_subst
# zstyle ':vcs_info:git:*' check-for-changes true
# zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"
# zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"
# zstyle ':vcs_info:*' formats "%F{green}%c%u[%b]%f"
# zstyle ':vcs_info:*' actionformats '[%b|%a]'
# PROMPT='%F{blue}%~%f $ '
# RPROMPT='${vcs_info_msg_0_}'
# precmd(){ vcs_info }


# ------------------------------ fzf settings ------------------------------
function select-history() {
  BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "${LBUFFER}" --prompt="History > ")
  CURSOR=${#BUFFER}
  zle redisplay
}
zle -N select-history
bindkey '^r' select-history

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# use .zshrc.local if you want to write local settings 
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

