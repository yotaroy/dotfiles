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

zstyle ':completion:*:default' menu select=2

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

# fzf
zinit ice from"gh-r" as"program"
zinit light junegunn/fzf

# enhancd
# zinit ice pick'init.sh'
# zinit light b4b4r07/enhancd
# export ENHANCD_DISABLE_DOT=1
# export ENHANCD_DISABLE_HYPHEN=1
# export ENHANCD_FILTER=fzf

# asdf
zinit light asdf-vm/asdf
. ${ASDF_DIR}/asdf.sh
fpath=(${ASDF_DIR}/completions $fpath)
autoload -Uz compinit && compinit

# exa
zinit ice as"program" from"gh-r" pick"bin/exa"
zinit light ogham/exa

# bat
zinit ice as"program" from"gh-r" mv"bat* -> bat" pick"bat/bat"
zinit light sharkdp/bat

export BAT_THEME="Nord"

# fd
zinit ice as"program" from"gh-r" mv"fd* -> fd" pick"fd/fd"
zinit light sharkdp/fd

# ---------------------------------------------------------------------------

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

# ------------------------------ fzf settings -------------------------------
function select-history() {
  # BUFFER=$(history -n -r 1 | fzf --no-sort +m --query "${LBUFFER}" --prompt="History > ")
  BUFFER=$(history -n -r 1 | fzf --exact --no-sort +m --query "${LBUFFER}" --prompt="History > ")
  CURSOR=${#BUFFER}
  zle redisplay
  # zle accept-line # select and immediately send enter
}
zle -N select-history
bindkey '^r' select-history

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border'

# ---------------------------------------------------------------------------

# ---------------------------------------------------------------------------
if [[ -x `which bat` ]]; then
  alias cat='bat'
fi

if [[ -x `which colordiff` ]]; then
  alias diff='colordiff'
fi

# brew install gnu-sed
if [[ -x `which gsed` ]]; then
  alias sed='gsed'
fi
# ---------------------------------------------------------------------------

# Mac OS
if [ "$(uname)" = 'Darwin' ]; then
    bell() {
      if [ $? -eq 0 ]; then
        afplay /System/Library/Sounds/Glass.aiff
      else
        afplay /System/Library/Sounds/Sosumi.aiff
      fi
    }
fi

# ---------------------------------------------------------------------------

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# use .zshrc.local if you want to write local settings 
[ -f ~/.zshrc.local ] && source ~/.zshrc.local

