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

function! DropTabCheckWindow(filename)
    if g:dropTabFoundTab < 0 && g:dropTabFoundWindow < 0 && a:filename == expand("%")
        let g:dropTabFoundTab = tabpagenr()
        let g:dropTabFoundWindow = winnr()
    endif
endfunction

function! DropTabFindInCurrent(filename)
    let currentWindow = winnr()

    windo call DropTabCheckWindow(a:filename)

    " Go back to initial window
    exe currentWindow . "wincmd w"
endfunction

" More or less native viml implementation of :tab pick for non-GUI installations
function! DropTab(filename)
    let g:dropTabFoundTab = -1
    let g:dropTabFoundWindow = -1

    let currentTab = tabpagenr()

    tabdo call DropTabFindInCurrent(a:filename)

    " Go back to initial tab
    exe "tabn " . currentTab

    if g:dropTabFoundTab < 0 || g:dropTabFoundTab < 0
        " Open in new tab
        exe "tabedit " . a:filename
    else
        " Select tab & window
        exe "tabn " . g:dropTabFoundTab
        exe g:dropTabFoundWindow . "wincmd w"
    endif
endfunction

command! -nargs=1 DropTab call DropTab(<f-args>)

function! OpenFuzzy()
    if TabIsEmpty() == 1
        call PickFile()
    else
        call PickCommand("git ls-files --cached --exclude-standard --others -- .", "", ":DropTab", 1)
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
        exe "hide buf" curBuf
        " Switch to dest and shuffle source->dest
        exe curNum . "wincmd w"
        " Hide and open so that we aren't prompted and keep history
        exe "hide buf" markedBuf
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
