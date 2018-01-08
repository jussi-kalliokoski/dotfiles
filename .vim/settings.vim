" Cool VIM stuff, probably on already
set nocompatible
" This is nice, and also probably on already.
set showcmd

" 3rd party stuff might break without this
set shell=/bin/bash

set grepprg=grep\ -nH\ $*

" colors
syntax on
" Default to desert when plugins aren't installed
colorscheme desert
colorscheme gruvbox

" Also, what to do with the colours if there's no syntax hilighting
filetype plugin on
" filetype plugin indent on
filetype on
syntax enable

" Line numbering
set number
set relativenumber

" Highlight all search results
set hlsearch

" Default to system clipboard
set clipboard=unnamed

" Remove all trailing space on save
autocmd BufWritePre * %s/\s\+$//e

" No info message when starting
set shortmess+=I

" Mouse is not so nice when you're on a laptop (oops my sleeve touched the
" touchpad), set to 'a' when you need it.
set mouse=

" Provide some context to scrolling
set scrolloff=5

" Default to 4 space tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Display tabs and trailing spaces
set list listchars=tab:→\ ,trail:·

set smartindent
set ruler
set backspace=2

" Folds blow
au BufRead * set nofoldenable

" Disable automatic comments
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Make sure quickfix window closes along with the window it's associated with
aug QFClose
    au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" Open splits in the right place
set splitbelow
set splitright
