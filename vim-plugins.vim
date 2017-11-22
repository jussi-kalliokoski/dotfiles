if !filereadable(expand("~/.vim/bundle/vim-plug/plug.vim"))
    echo "Installing vim-plug..."
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/junegunn/vim-plug.git ~/.vim/bundle/vim-plug
endif

source ~/.vim/bundle/vim-plug/plug.vim

call plug#begin('~/.vim/bundle')

Plug 'morhetz/gruvbox'
Plug 'ervandew/supertab'
Plug 'tpope/vim-surround'
Plug 'kana/vim-textobj-user'
Plug 'calleerlandsson/pick.vim'
Plug 'w0rp/ale'
Plug 'junegunn/fzf'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-flow.vim'
Plug 'prabirshrestha/asyncomplete-gocode.vim'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'pangloss/vim-javascript'

call plug#end()
