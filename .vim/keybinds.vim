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

" <Leader>gg To git grep for word under cursor
nnoremap <Leader>gg "zyiw:exe "!git grep ".@z""<CR>
