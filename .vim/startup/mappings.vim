let mapleader = ','

" arrow keys resize windows
nnoremap <Up>    :resize +5<CR>
nnoremap <Down>  :resize -5<CR>
nnoremap <Left>  :vertical resize +5<CR>
nnoremap <Right> :vertical resize -5<CR>

" navigate through windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" navigation in command mode
cnoremap <C-h> <Left>
cnoremap <C-j> <Down>
cnoremap <C-k> <Up>
cnoremap <C-l> <Right>

" upper or lowercase the current word
nmap g^ gUiW
nmap gv guiW

" diff
nmap ]c ]czz
nmap [c [czz

" default to very magic
no / /\v

" auto center
nmap G Gzz
nmap n nzz
nmap N Nzz
nmap } }zz
nmap { {zz

" open tag in new tab
" map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>

map <C-n> :NERDTreeToggle<CR>
map <C-p> :CommandT<CR>

" leader mapping
map <leader>. :TagbarToggle<CR>
nnoremap <Leader>b :CommandTBuffer<CR>
nnoremap <Leader>n :CommandTTag<CR>
nmap <leader>t :TestNearest<CR>
nmap <leader>T :TestFile<CR>
nnoremap <leader>m :CommandTMRU<CR>
nnoremap <leader>a :Ag<space>
nnoremap <leader>f :NERDTreeFind<CR>
nnoremap <leader>g :GitGutterToggle<CR>
nmap <leader>z :SSUBlackHole<CR>
imap ˙ <C-o>b
imap ¬ <C-o>w

" neosnippet key-mappings.
imap <expr><C-j> pumvisible() ? "\<C-n>" :  "\<Down>\<C-o>A"
imap <expr><C-k> pumvisible() ? "\<C-p>" : "\<Up>"
imap <C-h> <Left>
imap <expr><cr> pumvisible() ? (neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : deoplete#mappings#close_popup()) : "\<CR>\<Plug>AutoPairsReturn"
imap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : "\<TAB>"
vmap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : "\<TAB>"
xmap <expr><TAB> neosnippet#expandable() ? "\<Plug>(neosnippet_expand)" : "\<TAB>"
imap <expr><C-l> neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" : "\<C-o>A"
smap <expr><C-l> neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" : "\<C-o>A"
vmap <expr><C-l> neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" : "\<C-o>A"
xmap <expr><C-l> neosnippet#jumpable() ? "\<Plug>(neosnippet_jump)" : "\<C-o>A"

if has('conceal')
  set conceallevel=2 concealcursor=niv
endif
