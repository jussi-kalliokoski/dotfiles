let mapleader = ";"
let maplocalleader = ";"

" Ctrl h and l for scrolling tabs \o/
nmap <C-L> <Esc>:tabnext<CR>
nmap <C-H> <Esc>:tabprevious<CR>
" Space motion
nmap <Space> <C-d>
nmap <s-Space> <C-u>
" <Leader>t for toggling between tab modes
nmap <Leader>t <Esc>:call ToggleTabs()<CR>
" Close preview window
nmap ` <Esc>:pc<CR>

" use j/k for line navigation even with softwrap
noremap j gj
noremap k gk
vnoremap j gj
vnoremap k gk

" Indentation helpers
vnoremap > >gv
vnoremap < <gv
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv
vnoremap <C-Tab> <gv
vnoremap <C-N> >gv
vnoremap <C-P> <gv

" <Leader>gg To git grep for word under cursor
nnoremap <Leader>gg "zyiw:exe "!git grep ".@z""<CR>
