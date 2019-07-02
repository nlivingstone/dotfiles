filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-vinegar'
Plugin 'scrooloose/nerdtree'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'msanders/snipmate.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'arnaud-lb/vim-php-namespace'
Plugin 'Nopik/vim-nerdtree-direnter'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'stephpy/vim-php-cs-fixer'
Plugin 'tobyS/vmustache'
Plugin 'tobyS/pdv'
Plugin 'SirVer/ultisnips'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'cohama/lexima.vim'
Plugin 'scrooloose/nerdcommenter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

