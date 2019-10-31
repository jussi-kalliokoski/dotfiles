" Universal binds, specialized for go
nnoremap gD <Esc>:GoDef<CR>
nnoremap gr <Esc>:GoRename<CR>

" Go specific binds
nnoremap goim <Esc>:GoImports<CR>
nnoremap gorun <Esc>:GoRun %<CR>
nnoremap goref <Esc>:GoReferrers<CR>
nnoremap gotest <Esc>:GoTest<CR>
nnoremap gotefn <Esc>:GoTestFunc<CR>
nnoremap goerr <Esc>:GoIfErr<CR>

" Macros
nnoremap gocom yiwO//<Space><Esc>pA<Space>

nnoremap goiffn "*yiw:let @* = system('gointerfacefunc "'.expand('%:h').'" '.@*)<CR>
