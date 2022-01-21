syntax on
set nowrap
set encoding=utf8
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" ### Utility ###
Plugin 'scrooloose/nerdtree' " displays directory tree
" Plugin 'majutsushi/tagbar' " displays file tags e.g. class names, imports, etc.
" Plugin 'lukaszkorecki/CoffeeTags'
Plugin 'BufOnly.vim' " close all buffers (files) but this one
" Plugin 'benmills/vimux' " interact with tmux, like create a pane and run a command there
Plugin '907th/vim-auto-save' " auto saves buffers on edit; conflicts with neosnippet in some cases (google it)
Plugin 'tpope/vim-surround' " shortcuts to surround/wrap selected text with something
" fuzzy finder: filter that can be used with any list like files, history, processes, etc.
Plugin 'junegunn/fzf.vim' " fuzzy search for vim
" Plugin 'junegunn/fzf' " fzf binary
Plugin 'wincent/command-t' " a better fuzzy file search (siilar to ctrlp)
Plugin 'AndrewRadev/Switch.vim' " a plugin to switch (invert) words like true/false

" ### Generic Programming Support ###
Plugin 'jiangmiao/auto-pairs' " automatically put a closing char e.g. when type '(' it will add ')'
Plugin 'tomtom/tcomment_vim' " comment stuff in and out
" Plugin 'janko-m/vim-test' " run tests for the current file

" ### Markdown / Writting ###

" ### Git Support ###
" Plugin 'tpope/vim-fugitive' " git utils like diff, edit, status, commit, etc.
" Plugin 'airblade/vim-gitgutter' " shows a git diff in the gutter (sign column)

" ### Theme / Interface ###
Plugin 'ryanoasis/vim-devicons' " add icons to plugins
Plugin 'vim-airline/vim-airline' " a cool status bar
Plugin 'vim-airline/vim-airline-themes' " cool status bar's themes
Plugin 'AlessandroYorba/Sierra'

" ### Programming language support ###
" Plugin 'pangloss/vim-javascript'
" Plugin 'kchmck/vim-coffee-script'
" Plugin 'Shougo/deoplete.nvim'
Plugin 'Shougo/neosnippet.vim'
" Plugin 'roxma/nvim-yarp'
" Plugin 'roxma/vim-hug-neovim-rpc'
" Plugin 'leafgarland/typescript-vim'

" OSX stupid backspace fix
set backspace=indent,eol,start

call vundle#end()
filetype plugin indent on
