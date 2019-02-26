syntax on
set nowrap
set encoding=utf8
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" ------------------------------ "
" ---------- DISABLED ---------- "
" ------------------------------ "

" ### Utility ###

" Plugin 'Lokaltog/vim-easymotion'
" Plugin 'wesQ3/vim-windowswap' " swap two split windows
" tabularize stuff, like:
"  let shortVar        = 'a'
"  let veryVeryLongVar = 'b'
" Plugin 'godlygeek/tabular'
" Plugin 'ervandew/supertab' " tab completion; not needed as deoplete does the job
" Buffergator is a plugin for listing, navigating between, and selecting buffers to edit
" Plugin 'jeetsukumaran/vim-buffergator'
" Plugin 'gilsondev/searchtasks.vim' " Search TODO, FIXME and XXX in your project
" Plugin 'Shougo/neocomplete.vim' " some auto completion; deprecated, should use Deoplete.nvim. instead
" Plugin 'tpope/vim-dispatch' " kick off builds or tests asynchronously (using tmux, screen, etc)

" ### Generic Programming Support ###
" Plugin 'jakedouglas/exuberant-ctags' " analyze file for tags and jump to definitions; no JS support
" Plugin 'neomake/neomake' " asynchronously run programs; can use it instead of the built-in :make command
" Plugin 'joonty/vdebug' " requires vim to be compiled with python3 support
" Plugin 'maksimr/vim-jsbeautify' " beautify js, css, html, json
" Plugin 'vim-syntastic/syntastic' " Syntax checking hacks for vim
" Plugin 'nathanaelkane/vim-indent-guides'

" ### Markdown / Writting ###
" Plugin 'LanguageTool' " grammar checker
" Plugin 'reedes/vim-pencil' " utils for writing text, such as fixed width

" ### Git Support ###
" Plugin 'kablamo/vim-git-log' " browse your git log
" Plugin 'gregsexton/gitv' " wrapper around `git log --graph`

" ### Theme / Interface ###
" Plugin 'AnsiEsc.vim' " better support for escape sequences; maybe not needed
" Plugin 'sjl/badwolf'
" Plugin 'romainl/Apprentice'
" Plugin 'chriskempson/base16-vim'
" Plugin 'w0ng/vim-hybrid'
" Plugin 'daylerees/colour-schemes'
" Plugin 'effkay/argonaut.vim'
" Plugin 'ajh17/Spacegray.vim'
" Plugin 'Shougo/neosnippet-snippets'

" ------------------------------ "
" ----------- ENABLED ---------- "
" ------------------------------ "

" ### Utility ###
Plugin 'scrooloose/nerdtree' " displays directory tree
Plugin 'majutsushi/tagbar' " displays file tags e.g. class names, imports, etc.
Plugin 'BufOnly.vim' " close all buffers (files) but this one
Plugin 'benmills/vimux' " interact with tmux, like create a pane and run a command there
Plugin '907th/vim-auto-save'
Plugin 'tpope/vim-surround'
" fuzzy finder: filter that can be used with any list like files, history, processes, etc.
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'
Plugin 'wincent/command-t' " a better fuzzy file search (siilar to ctrlp)

" ### Generic Programming Support ###
Plugin 'jiangmiao/auto-pairs' " automatically put a closing char e.g. when type '(' it will add ')'
Plugin 'tomtom/tcomment_vim' " comment stuff in and out
Plugin 'janko-m/vim-test' " run tests for the current file

" ### Markdown / Writting ###

" ### Git Support ###
Plugin 'tpope/vim-fugitive' " git utils like diff, edit, status, commit, etc.
Plugin 'airblade/vim-gitgutter' " shows a git diff in the gutter (sign column)

" ### Theme / Interface ###
Plugin 'ryanoasis/vim-devicons' " add icons to plugins
Plugin 'vim-airline/vim-airline' " a cool status bar
Plugin 'vim-airline/vim-airline-themes' " cool status bar's themes
Plugin 'AlessandroYorba/Sierra'

" ### Programming language support ###
" Plugin 'pangloss/vim-javascript'
Plugin 'kchmck/vim-coffee-script'
Plugin 'Shougo/deoplete.nvim'
Plugin 'Shougo/neosnippet.vim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

" ------------------------------- "
" ---------- OTHER CFG ---------- "
" ------------------------------- "

" OSX stupid backspace fix
set backspace=indent,eol,start

call vundle#end()
filetype plugin indent on
