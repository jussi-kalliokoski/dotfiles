if !filereadable(expand("~/.vim/bundle/vim-plug/plug.vim"))
    echo "Installing vim-plug..."
    silent !mkdir -p ~/.vim/bundle
    silent !git clone https://github.com/junegunn/vim-plug.git ~/.vim/bundle/vim-plug
endif

source ~/.vim/bundle/vim-plug/plug.vim

call plug#begin('~/.vim/bundle')

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'kana/vim-textobj-user'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'wellle/targets.vim'
Plug 'ervandew/supertab'

Plug 'k0kubun/vim-open-github'
Plug 'calleerlandsson/pick.vim'
Plug 'w0rp/ale'
Plug 'Shougo/neosnippet.vim'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete-flow.vim'
Plug 'prabirshrestha/asyncomplete-gocode.vim'
Plug 'prabirshrestha/asyncomplete-buffer.vim'
Plug 'prabirshrestha/asyncomplete-neosnippet.vim'
Plug 'fatih/vim-go'
Plug 'buoto/gotests-vim'
Plug 'rust-lang/rust.vim'

call plug#end()
