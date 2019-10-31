" Include shared keybinds for all vim forks
source ~/.dotfiles/.vim/keybinds-common.vim

" Ctrl-T to open a file
nnoremap <C-T> <Esc>:call OpenFuzzy()<CR>
nnoremap <Leader><C-T> <Esc>:call OpenRelative()<CR>
" <Leader>Ctrl-R to rename a file
nnoremap <Leader><C-R> <Esc>:call RenameCurrentFile()<CR>

" neosnippet config
imap <C-K>     <Plug>(neosnippet_expand_or_jump)
smap <C-K>     <Plug>(neosnippet_expand_or_jump)
xmap <C-K>     <Plug>(neosnippet_expand_target)
imap <C-K>     <Plug>(neosnippet_expand_or_jump)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
