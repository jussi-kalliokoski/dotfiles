" To see what these things do, use :help, for instance :help nocompatible

" Load plugins
source ~/.dotfiles/vim-plugins.vim

" Cool VIM stuff, probably on already
set nocompatible
" This is nice, and also probably on already.
set showcmd

" 3rd party stuff might break without this
set shell=/bin/bash

set grepprg=grep\ -nH\ $*

let mapleader = ";"
let maplocalleader = ";"

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
nmap <Leader>t <Esc>:call ToggleTabs()<CR>
" Close preview window
nmap ` <Esc>:pc<CR>

" use j/k for line navigation even with softwrap
noremap j gj
noremap k gk
vnoremap j gj
vnoremap k gk

" Ctrl-T to open a file
nnoremap <C-T> <Esc>:call OpenFuzzy()<CR>
nnoremap <Leader><C-T> <Esc>:call OpenRelative()<CR>

" colors
syntax on
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

" https://stackoverflow.com/a/5026456
function! TabIsEmpty()
    " Remember which window we're in at the moment
    let initial_win_num = winnr()

    let win_count = 0
    " Add the length of the file name on to count:
    " this will be 0 if there is no file name
    windo let win_count += len(expand('%'))

    " Go back to the initial window
    exe initial_win_num . "wincmd w"

    " Check count
    if win_count == 0
        " Tab page is empty
        return 1
    else
        return 0
    endif
endfunction

function! OpenFuzzy()
    if TabIsEmpty() == 1
        call PickFile()
    else
        call PickFileTab()
    endif
endfunction

function! OpenRelative()
    call feedkeys("\<Esc>:tabnew ")
    call feedkeys(expand("%"))
endfunction

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

" Set color scheme
colorscheme desert

" Provide some context to scrolling
set scrolloff=5

" Folds blow
au BufRead * set nofoldenable

autocmd FileType javascript :call SetIndent(2)
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

" Make sure quickfix window closes along with the window it's associated with
aug QFClose
    au!
    au WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&buftype") == "quickfix"|q|endif
aug END

if executable('typescript-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'typescript-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
        \ 'whitelist': ['typescript'],
    \ })
endif

if executable('flow-language-server')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'flow-language-server',
        \ 'cmd': {server_info->[&shell, &shellcmdflag, 'flow-language-server --stdio']},
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), '.flowconfig'))},
        \ 'whitelist': ['javascript'],
    \ })
endif

if executable('go-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
    \ })
endif

let g:lsp_log_verbose = 1
let g:lsp_log_file = expand('~/vim-lsp.log')

" for asyncomplete.vim log
let g:asyncomplete_log_file = expand('~/asyncomplete.log')

let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_flow = 1
