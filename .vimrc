language en_US.UTF-8

" character code utf-8
set fenc=utf-8

" display column number
set number

" comment out color
hi Comment ctermfg=gray

set tabstop=2
set shiftwidth=2
set expandtab

set autoindent

" search
set hlsearch
nmap <Esc><Esc> :nohl<CR>
set ignorecase
set incsearch
set smartcase

set laststatus=2

syntax on

set background=dark

set ruler

" for python
autocmd FileType python setl autoindent
autocmd FileType python setl smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
autocmd FileType python setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

" for haskell
autocmd FileType haskell setl tabstop=8 expandtab shiftwidth=4 softtabstop=4

" leader
let mapleader = "\<space>"
" copy and paste with clipboard
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P
