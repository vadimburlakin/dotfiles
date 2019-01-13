let mapleader = ','

" Unmap the arrow keys
nnoremap <Up>    :resize +5<CR>
nnoremap <Down>  :resize -5<CR>
nnoremap <Left>  :vertical resize +5<CR>
nnoremap <Right> :vertical resize -5<CR>

"============== Custom Mappings ===============
" navigate through windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"custom comma motion mapping
" nmap di, f,dT,
" nmap ci, f,cT,
" nmap da, f,ld2F,i,<ESC>l "delete argument
" nmap ca, f,ld2F,i,<ESC>a "delete arg and insert

" delete surrounding characters
" noremap ds{ F{xf}x
" noremap cs{ F{xf}xi
" noremap ds" F"x,x
" noremap cs" F"x,xi
" noremap ds' F'x,x
" noremap cs' F'x,xi
" noremap ds( F(xf)x
" noremap cs( F(xf)xi
" noremap ds) F(xf)x
" noremap cs) F(xf)xi

" nmap cu ct_
" nmap cU cf_

" upper or lowercase the current word
nmap g^ gUiW
nmap gv guiW

" diff
" nmap ]c ]czz
" nmap [c [czz

" default to very magic
no / /\v

" I really hate that things don't auto-center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

" open tag in new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

" quick pairs
" imap <leader>' ''<ESC>i
" imap <leader>" ""<ESC>i
" imap <leader>( ()<ESC>i
" imap <leader>[ []<ESC>i
"
" replace string contents with recently copied text
" nmap <Leader>r" "_di"P
" nmap <Leader>c" "_di"Pa
" nmap <Leader>r' '_di'P
" nmap <Leader>c' '_di'Pa

map <leader>. :TagbarToggle<CR>
nmap ]h <Plug>GitGutterNextHunk
nmap [h <Plug>GitGutterPrevHunk
map <C-n> :NERDTreeToggle<CR>
map <C-p> :CommandT<CR>
nnoremap <Leader>b :CommandTBuffer<CR>
nmap <leader>t :TestNearest<CR>
nmap <leader>T :TestFile<CR>
noremap <leader>l :Align
nnoremap <leader>m :CommandTMRU<CR>
nnoremap <leader>a :Ag<space>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>g :GitGutterToggle<CR>
