" character code utf-8
set encoding=utf-8
scriptencoding utf-8
set fileencoding=utf-8

language en_US.UTF-8

" ===================== display ====================
" display column number
set number
set relativenumber
set cursorline

set display=lastline

" ===================== tab, indent ====================
set autoindent
set tabstop=2
set shiftwidth=2
set expandtab

" always display status line
set laststatus=2

" ===================== search ====================
" search
set hlsearch
nmap <Esc><Esc> :nohl<CR>
set ignorecase
set incsearch
set smartcase


syntax on

set background=dark

" comment out color
hi Comment ctermfg=gray

set ruler

set smartindent

" the maximum number of completion items.
set pumheight=10

set showmatch
set matchtime=1

" for python
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python,haskell,rust setl tabstop=8 expandtab shiftwidth=4 softtabstop=4


" ========== leader ==========
let mapleader = "\<space>"
" copy and paste with clipboard
nmap <Leader>y "+y
nmap <Leader>d "+d
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
" ========== leader ==========


set list
set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%
hi NonText    ctermbg=None ctermfg=59 guibg=NONE guifg=None
hi SpecialKey ctermbg=None ctermfg=59 guibg=NONE guifg=None
