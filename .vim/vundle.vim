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
" Plugin 'ervandew/supertab' " tab completion
" Plugin 'SirVer/ultisnips' " snippets

" tabularize stuff, like:
"  let shortVar        = 'a'
"  let veryVeryLongVar = 'b'
" Plugin 'godlygeek/tabular'

" Buffergator is a plugin for listing, navigating between, and selecting buffers to edit
" Plugin 'jeetsukumaran/vim-buffergator'

" Plugin 'gilsondev/searchtasks.vim' " Search TODO, FIXME and XXX in your project
" Plugin 'Shougo/neocomplete.vim' " some auto completion; deprecated, should use Deoplete.nvim. instead
" Plugin 'tpope/vim-dispatch' " kick off builds or tests asynchronously (using tmux, screen, etc)

" ### Generic Programming Support ###
" Plugin 'jakedouglas/exuberant-ctags' " analyze file for tags and jump to definitions; no JS support
" Plugin 'honza/vim-snippets' " snippet files for various programming languages; to be used with ultisnips
" Plugin 'neomake/neomake' " asynchronously run programs; can use it instead of the built-in :make command
" Plugin 'joonty/vdebug' " requires vim to be compiled with python3 support

" ### Markdown / Writting ###
" Plugin 'LanguageTool' " grammar checker

" ### Git Support ###

" ### Theme / Interface ###
" Plugin 'AnsiEsc.vim' " better support for escape sequences; maybe not needed
" Plugin 'sjl/badwolf'
" Plugin 'romainl/Apprentice'
" Plugin 'chriskempson/base16-vim'
" Plugin 'w0ng/vim-hybrid'
" Plugin 'daylerees/colour-schemes'
" Plugin 'effkay/argonaut.vim'
" Plugin 'ajh17/Spacegray.vim'

" ------------------------------ "
" ----------- ENABLED ---------- "
" ------------------------------ "

" ### Utility ###
Plugin 'scrooloose/nerdtree' " displays directory tree
Plugin 'majutsushi/tagbar' " displays file tags e.g. class names, imports, etc.
Plugin 'BufOnly.vim' " close all buffers (files) but this one
Plugin 'wesQ3/vim-windowswap' " swap two split windows
Plugin 'Lokaltog/vim-easymotion'
Plugin 'benmills/vimux' " interact with tmux, like create a pane and run a command there

" fuzzy finder: filter that can be used with any list like files, history, processes, etc.
Plugin 'junegunn/fzf.vim'
Plugin 'junegunn/fzf'

" Plugin 'ctrlpvim/ctrlp.vim' " fuzzy file, buffer, mru, tag, ... finder for Vim
Plugin 'wincent/command-t' " a better fuzzy file search (siilar to ctrlp)

" ### Generic Programming Support ###
Plugin 'Townk/vim-autoclose' " automatically put a closing char e.g. when type '(' it will add ')'
Plugin 'tomtom/tcomment_vim' " comment stuff in and out
Plugin 'janko-m/vim-test' " run tests for the current file
Plugin 'maksimr/vim-jsbeautify' " beautify js, css, html, json
Plugin 'vim-syntastic/syntastic' " Syntax checking hacks for vim
Plugin 'nathanaelkane/vim-indent-guides'

" ### Markdown / Writting ###
Plugin 'reedes/vim-pencil' " utils for writing text, such as fixed width

" ### Git Support ###
Plugin 'tpope/vim-fugitive' " git utils like diff, edit, status, commit, etc.
Plugin 'kablamo/vim-git-log' " browse your git log
Plugin 'gregsexton/gitv' " wrapper around `git log --graph`
Plugin 'airblade/vim-gitgutter' " shows a git diff in the gutter (sign column)

" ### Theme / Interface ###
Plugin 'ryanoasis/vim-devicons' " add icons to plugins
Plugin 'vim-airline/vim-airline' " a cool status bar
Plugin 'vim-airline/vim-airline-themes' " cool status bar's themes
Plugin 'AlessandroYorba/Sierra'

" ### Programming language support ###
Plugin 'pangloss/vim-javascript'

" ------------------------------- "
" ---------- OTHER CFG ---------- "
" ------------------------------- "

" OSX stupid backspace fix
set backspace=indent,eol,start

call vundle#end()
filetype plugin indent on
