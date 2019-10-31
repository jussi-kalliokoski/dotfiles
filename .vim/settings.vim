" Include shared settings between different vim forks
source ~/.dotfiles/.vim/settings-common.vim

" Cool VIM stuff, probably on already
set nocompatible
" This is nice, and also probably on already.
set showcmd

" colors
syntax on
colorscheme hellsinki

" Also, what to do with the colours if there's no syntax hilighting
filetype plugin on
" filetype plugin indent on
filetype on
syntax enable

" Mouse is not so nice when you're on a laptop (oops my sleeve touched the
" touchpad), set to 'a' when you need it.
set mouse=

" Disable default key mappings for go-vim
let g:go_def_mapping_enabled = 0

" Make sure quickfix window closes along with the window it's associated with
aug QFClose
    au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

" Supertab stuff
let g:SuperTabDefaultCompletionType = "<c-n>"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" Configure neosnippet
let g:neosnippet#snippets_directory='~/.vim/snippets'
