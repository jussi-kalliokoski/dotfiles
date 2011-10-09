set background=dark
if version > 580
	hi clear
	if (exists("syntax_on"))
		syntax reset
	endif
endif

let g:colors_name="carvedwoodcooler"

hi Normal		guibg=#05181C	guifg=#aa9aa3
hi NonText		guibg=#1C3447	guifg=#382920
hi Folded		guibg=#4A4F4D	guifg=#BBDDCC
hi FoldColumn		guibg=#3A4A5A	guifg=#00CCFF
hi LineNr		guibg=#153040	guifg=#D0C5C0
hi StatusLine		guibg=#D0A59A	guifg=#102015	gui=none
hi StatusLineNC		guibg=#937B7A	guifg=#373334	gui=none

hi Comment				guifg=#2D303D
hi Title				guifg=#60B03D
hi Underlined				guifg=#80AAE0
hi Statement				guifg=#F0CABA
hi Type					guifg=#C09A8A
hi Constant				guifg=#55464A
hi PreProc				guifg=#AA7065	gui=none
hi Identifier				guifg=#D07A70
hi Special				guifg=#556065
hi Todo			guibg=yellow2	guifg=orangered
hi Error		guibg=#e04462

hi Cursor		guibg=#104550	guifg=#6AA09A
hi VertSplit		guibg=#C2BFA5	guifg=grey50	gui=none
hi ModeMsg				guifg=#00AACC
hi MoreMsg				guifg=SeaGreen
hi Question				guifg=#AABBCC
hi Search		guibg=#5A6D7D	guifg=#BAC5D0
hi IncSearch		guibg=#CDDAF0	guifg=#50606D
hi SpecialKey				guifg=#90703B
hi Visual		guibg=#33DFEF	guifg=#008FBF
hi WarningMsg				guifg=salmon
