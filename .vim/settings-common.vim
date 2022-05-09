" This file includes settings shared between oni, neovim and vim

set encoding=utf-8
scriptencoding utf-8

" 3rd party stuff might break without this
set shell=/bin/bash

set grepprg=grep\ -nH\ $*

" Line numbering
set number
set relativenumber

" Highlight all search results
set hlsearch

" Default to system clipboard
set clipboard=unnamed

" No info message when starting
set shortmess+=I

" Provide some context to scrolling
set scrolloff=5

" Default to 4 space tabs
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" Display tabs and trailing spaces
set list listchars=tab:→\ ,trail:·

" Set markers for ALE
let g:ale_sign_error = "·"
let g:ale_sign_warning = "→"

set smartindent
set ruler
set backspace=2

" Folds blow
au BufRead * set nofoldenable

" Disable automatic comments
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Open splits in the right place
set splitbelow
set splitright

" Don't hide symbols
set conceallevel=0

" Remove all trailing space on save
autocmd BufWritePre * %s/\s\+$//e

" Allow more tab pages (nice for opening with -p)
set tabpagemax=100
