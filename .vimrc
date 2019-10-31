if exists("g:gui_oni")
    source ~/.oni/plugins.vim
    source ~/.oni/functions.vim
    source ~/.oni/settings.vim
    source ~/.oni/languages.vim
    source ~/.oni/keybinds.vim
else
    source ~/.dotfiles/.vim/plugins.vim
    source ~/.dotfiles/.vim/functions.vim
    source ~/.dotfiles/.vim/settings.vim
    source ~/.dotfiles/.vim/languages.vim
    source ~/.dotfiles/.vim/keybinds.vim
    source ~/.dotfiles/.vim/macros.vim
endif
