set dict=/usr/share/dict/words
set cursorline
set showcmd
set ruler
set incsearch
set wildmenu
syntax enable
set synmaxcol=0
if !has('nvim')
  set ttymouse=xterm2
  set term=screen-256color
endif
set display=uhex
set shortmess=aAIsT
set nowrap
if &diff
  set wrap
endif
set diffopt+=iwhite
let &scrolloff=999-&scrolloff
set ignorecase
set smartcase
set relativenumber
set nowritebackup
set completeopt=menu
set mousemodel=popup
set backspace=2
set number
set nocompatible
set enc=utf-8
set fillchars=vert:¦
set tabstop=2 softtabstop=0 expandtab shiftwidth=2 smarttab
" this will disable automatic folding in files like yaml:
set nofoldenable
" this settings are applied if folding is enabled:
" set foldcolumn=1
" set foldlevel=20
set cc=+1,+2
set linespace=0
set history=1000
set list listchars=tab:› ,trail:-,extends:>,precedes:<,eol:¬
set laststatus=2
set ffs=unix,dos
set mouse=a
set vb
set tags=tags;/
set updatetime=500
set splitright
set conceallevel=0
set clipboard=unnamedplus
set encoding=utf-8

runtime macros/matchit.vim

if version > 720
	set undofile
	set undodir=~/vimundo/
endif

if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

" NERDTree
let NERDTreeMinimalUI = 0
let NERDTreeDirArrows = 0
let NERDTreeQuitOnOpen = 1

" command! -bang -nargs=* Ag
"       \ call fzf#vim#ag(<q-args>,
"       \                 <bang>0 ? fzf#vim#with_preview('up:60%')
"       \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
"       \                 <bang>0)

if exists("g:loaded_nerdtree_grep_menuitem")
    finish
endif
let g:loaded_nerdtree_grep_menuitem = 1

" Vim-Airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_powerline_fonts = 1
let g:airline_theme='hybrid'
let g:hybrid_custom_term_colors = 1
let g:hybrid_reduced_contrast = 1

" gitgutter
let g:gitgutter_sign_modified = '≈ '
let g:gitgutter_sign_removed = '⌐ '

" Vim-Test
let test#strategy = "vimux"

" neosnippet
let g:neosnippet#snippets_directory='~/.vim/snippets'
let g:neosnippet#disable_runtime_snippets = {
		\   '_' : 1,
		\ }

" deoplete
" autocmd VimEnter * call deoplete#custom#option('ignore_sources', {'_': ['dictionary']})
" let g:deoplete#auto_complete_start_length = 1 
" let g:deoplete#enable_at_startup = 1 
" let g:deoplete#enable_smart_case = 1 

" auto save
let g:auto_save = 1
let g:neosnippet#enable_auto_clear_markers = 0
let g:auto_save_events = ["InsertLeave", "TextChanged"]

" auto pairs
au FileType * let b:autopairs_enabled = 0
let g:AutoPairsMapBS = 0
let g:AutoPairsMapCR = 0 
let g:AutoPairsMultilineClose = 0

" Switch
let g:switch_mapping = "-"

" this is for neovim to properly recognize path to my ruby binary
" where necessary gems are installed:
let g:ruby_host_prog = '~/.rbenv/versions/2.7.2/bin/neovim-ruby-host'

" fuzzy search
let g:fzf_layout = { 'window': 'enew' }

" coffeetags
let g:CoffeeAutoTagDisabled=0     " Disables autotaging on save (Default: 0 [false])
let g:CoffeeAutoTagFile='./tags'       " Name of the generated tag file (Default: ./tags)
let g:CoffeeAutoTagIncludeVars=0  " Includes variables (Default: 0 [false])
let g:CoffeeAutoTagTagRelative=1  " Sets file names to the relative path from the tag file location to the tag file location (Default: 1 [true])
