" Include shared functions
source ~/.dotfiles/.vim/functions-common.vim

function! OpenFuzzy()
    if TabIsEmpty() == 1
        call PickFile()
    else
        call PickCommand("git ls-files --cached --exclude-standard --others -- .", "", ":DropTab", 1)
    endif
endfunction

function! OpenRelative()
    call feedkeys("\<Esc>:TabCreate ")
    call feedkeys(expand("%"))
endfunction

function! RenameCurrentFile()
    call feedkeys("\<Esc>:Rename " . expand("%"))
endfunction
