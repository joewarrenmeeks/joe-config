set nocompatible
filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tomasr/molokai'
Plugin 'bling/vim-airline'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/syntastic'
Plugin 'xolox/vim-misc'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'airblade/vim-gitgutter'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set backspace=indent,eol,start
set ruler
set showcmd
set incsearch
set hlsearch

set background=dark
colorscheme molokai
set laststatus=2
let g:airline_powerline_fonts=1
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enabled=1
syntax on
set expandtab
set tabstop=4
set shiftwidth=4
