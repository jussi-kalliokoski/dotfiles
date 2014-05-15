" To see what these things do, use :help, for instance :help nocompatible

" Cool VIM stuff, probably on already
set nocompatible
" This is nice, and also probably on already.
set showcmd

" 3rd party stuff might break without this
set shell=/bin/bash

set grepprg=grep\ -nH\ $*

" Ctrl h and l for scrolling tabs \o/
nmap <C-L> <Esc>:tabnext<CR>
nmap <C-H> <Esc>:tabprevious<CR>
" Space motion
nmap <Space> <C-d>
nmap <s-Space> <C-u>
" Clipboard
nmap <C-P> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <C-Y> <Esc>:.w !pbcopy<CR><CR>
xmap <C-Y> <Esc>:'<,'>:w !pbcopy<CR>
" Control-t for toggling between tab modes
nmap <C-T> <Esc>:call ToggleTabs()<CR>
" Automatically complete comments, brackets and function definitions
imap <C-p> /**<CR>*/<Esc>O * 
" Context-aware variable rename for JS and see docs.
nmap R <Esc>:TernRename<CR>
nmap D <Esc>:TernDoc<CR>
" Close preview window
nmap ` <Esc>:pc<CR>
" Ctrl-] for toggling the mouse.
nmap <C-]> <Esc>:call ToggleMouse()<CR>
nmap <C-w>m <Esc>:call SwapWindow()<CR>
nmap d<space> <Esc>:%s/\s\+$//<CR>

" Also, what to do with the colours if there's no syntax hilighting
filetype plugin on
" filetype plugin indent on
filetype on
syntax enable

" Line numbering
set number

" Highlight all search results
set hlsearch

" Mouse is not so nice when you're on a laptop (oops my sleeve touched the
" touchpad), set to 'a' when you need it.
set mouse=

" A utility for swapping places of buffers.
function! SwapWindow()
	if exists("g:markedWinNum")
		" Mark destination
		let curNum = winnr()
		let curBuf = bufnr( "%" )
		exe g:markedWinNum . "wincmd w"
		" Switch to source and shuffle dest->source
		let markedBuf = bufnr( "%" )
		" Hide and open so that we aren't prompted and keep history
		exe 'hide buf' curBuf
		" Switch to dest and shuffle source->dest
		exe curNum . "wincmd w"
		" Hide and open so that we aren't prompted and keep history
		exe 'hide buf' markedBuf
		" Unmark
		unlet g:markedWinNum
		echo "Swapped buffers!"
	else
		" Mark source
		let g:markedWinNum = winnr()
		echo "Marked buffer for swapping."
	endif
endfunction

" It can be nice for scrolling though.
function! ToggleMouse()
	if &mouse == "nicr"
		set mouse=
		echo "Mouse disabled"
	else
		set mouse=nicr
		echo "Mouse enabled"
	endif
endfunction

function! SetIndent(num_spaces)
	if a:num_spaces == 8
		setlocal tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab
	elseif a:num_spaces == 4
		setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab
	else
		setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab
	endif

endfunction

function! ToggleTabs()
	if &tabstop == 8
		call SetIndent(4)
		echo "Toggled to soft tabs with 4 spaces per column."
	elseif &tabstop == 4
		call SetIndent(2)
		echo "Toggled to soft tabs with 2 spaces per column."
	else
		call SetIndent(8)
		echo "Toggled to hard tabs with 8 spaces per column."
	endif
endfunction

" Disable automatic comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Use templates

autocmd! BufNewFile * silent! 0r ~/.vim/skel/tmpl.%:e

" Vundle

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

let g:user_emmet_leader_key = '<C-e>'

" Extra bundles
Bundle 'groenewege/vim-less'
Bundle 'closetag.vim'
Bundle 'plasticboy/vim-markdown'
Bundle 'programble/ooc.vim'
Bundle 'hail2u/vim-css3-syntax'
Bundle 'groenewege/vim-less'
Bundle 'kchmck/vim-coffee-script'
Bundle 'fish.vim'
Bundle 'marijnh/tern_for_vim'
Bundle 'Shougo/neocomplcache'
Bundle 'mozfr/mozilla.vim'
Bundle 'helino/vim-json'
Bundle 'jussi-kalliokoski/harmony.vim'
Bundle 'peterhoeg/vim-qml'
Bundle 'walm/jshint.vim'
Bundle 'jussi-kalliokoski/dessert.vim'
Bundle 'wavded/vim-stylus'
Bundle 'sbl/scvim'
Bundle 'mattn/emmet-vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'mxw/vim-jsx'

colorscheme dessert

" enable ooc syntax highlighting
au BufNewFile,BufRead *.ooc set filetype=ooc

" enable markdown syntax highlighting
au BufNewFile,BufRead *.{md,mdown,mkd,mkdn,markdown,mdwn} set filetype=mkd

" enable less syntax highlighting
au BufNewFile,BufRead *.{less,css} set filetype=less

" enable coffeescript syntax highlighting
au BufNewFile,BufRead *.{coffee,cson} set filetype=coffee

" enable handlebars syntax highlighting
au BufNewFile,BufRead *.handlebars set filetype=html

" enable fish syntax highlighting
au BufNewFile,BufRead *.fish set filetype=fish

" enable json syntax highlighting
au BufNewFile,BufRead *.{json,jshintrc} set filetype=json

" enable qml syntax highlighting
au BufNewFile,BufRead *.qml set filetype=qml

" enable qml syntax highlighting
au BufNewFile,BufRead *.styl set filetype=stylus

" Folds blow
au BufRead * set nofoldenable

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd BufWritePost,FileWritePost *.js JSHint

autocmd FileType coffee :call SetIndent(2)
autocmd FileType json :call SetIndent(2)

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

set list listchars=tab:→\ ,trail:·

set smartindent
set ruler
set backspace=2

" Enable JS syntax extras
let g:javascript_warning_all = 1
let g:javascript_enable_camelcase_classes = 1
let g:javascript_enable_caps_constants = 1

" Enable automatic completion
let g:neocomplcache_enable_at_startup = 1
" Disable case ignoring
let g:neocomplcache_enable_ig_case = 0
" Tab completion for neocomplcache
imap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Make sure quickfix window closes along with the window it's associated with
aug QFClose
	au!
	au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END
