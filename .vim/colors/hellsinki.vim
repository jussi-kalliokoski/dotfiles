" Maintainer:	Jussi Kalliokoski <jussi.kalliokoski@gmail.com>
" URL:		https://github.com/jussi-kalliokoski/dessert.vim

set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif
let g:colors_name="hellsinki"

hi SpecialKey	ctermfg=235
hi NonText	    ctermfg=235
hi Search	    cterm=NONE ctermfg=DarkBlue ctermbg=Black
hi LineNr	    ctermfg=238
hi Pmenu	    ctermfg=DarkGrey ctermbg=Black
hi PmenuSel	    ctermfg=DarkCyan ctermbg=Black
hi StatusLine	cterm=NONE
hi StatusLineNC	cterm=NONE
hi VertSplit	ctermfg=DarkGrey ctermbg=NONE
hi Directory	ctermfg=DarkCyan
hi ErrorMsg	    cterm=bold ctermfg=White ctermbg=Red
hi IncSearch	cterm=NONE ctermfg=Blue ctermbg=White
hi MoreMsg	    ctermfg=DarkGreen
hi ModeMsg	    cterm=NONE ctermfg=DarkYellow
hi Question	    ctermfg=Green
hi Title	    ctermfg=DarkMagenta
hi Visual	    ctermfg=White ctermbg=Blue
hi VisualNOS	cterm=bold,underline
hi WarningMsg	ctermfg=DarkBlue
hi WildMenu	    ctermfg=Black ctermbg=DarkCyan
hi Folded	    ctermfg=DarkGrey ctermbg=NONE
hi FoldColumn	ctermfg=DarkGrey ctermbg=NONE
hi DiffAdd	    ctermbg=DarkRed
hi DiffChange	ctermbg=DarkMagenta
hi DiffDelete	cterm=bold ctermfg=DarkRed ctermbg=DarkYellow
hi DiffText	    cterm=bold ctermbg=DarkBlue
hi SignColumn   ctermbg=NONE

hi Define	    ctermfg=DarkGrey
hi Comment	    ctermfg=DarkCyan
hi Constant	    ctermfg=Blue
hi Special	    ctermfg=darkmagenta
hi Identifier	cterm=NONE
hi Operator     ctermfg=DarkYellow
hi Keyword      ctermfg=DarkGrey
hi Label        ctermfg=Yellow
hi Statement    ctermfg=Yellow
hi Conditional  ctermfg=DarkGrey
hi Repeat       ctermfg=DarkGrey
hi String       ctermfg=Green
hi PreProc	    ctermfg=DarkRed
hi Type		    ctermfg=DarkGrey
hi Underlined	cterm=underline ctermfg=DarkMagenta
hi Ignore	    cterm=bold ctermfg=NONE
hi Ignore	    ctermfg=DarkGrey
hi Error	    cterm=bold ctermfg=White ctermbg=Red

hi ALEError    cterm=underline ctermfg=DarkRed
hi ALEErrorSign    cterm=NONE ctermfg=DarkRed
