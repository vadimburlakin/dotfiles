syntax on
set nowrap
set encoding=utf8
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" ### Utility ###
Plugin 'scrooloose/nerdtree' " displays directory tree
Plugin 'BufOnly.vim' " close all buffers (files) but this one
Plugin '907th/vim-auto-save' " auto saves buffers on edit; conflicts with neosnippet in some cases (google it)
Plugin 'tpope/vim-surround' " shortcuts to surround/wrap selected text with something
Plugin 'junegunn/fzf' " fuzzy search for vim
Plugin 'junegunn/fzf.vim' " fuzzy search for vim
Plugin 'wincent/command-t' " a better fuzzy file search (siilar to ctrlp)
Plugin 'AndrewRadev/Switch.vim' " a plugin to switch (invert) words like true/false

" ### Generic Programming Support ###
Plugin 'jiangmiao/auto-pairs' " automatically put a closing char e.g. when type '(' it will add ')'
Plugin 'tomtom/tcomment_vim' " comment stuff in and out

" ### Theme / Interface ###
Plugin 'ryanoasis/vim-devicons' " add icons to plugins
Plugin 'vim-airline/vim-airline' " a cool status bar
Plugin 'vim-airline/vim-airline-themes' " cool status bar's themes
Plugin 'AlessandroYorba/Sierra'

" ### Programming language support ###
Plugin 'Shougo/neosnippet.vim'
Plugin 'ms-jpq/coq_nvim'

" OSX stupid backspace fix
set backspace=indent,eol,start

call vundle#end()
filetype plugin indent on
