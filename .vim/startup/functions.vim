fun! Format_WhiteSpace_RemoveTrailing()
	:%s/\v\s*$//g
endfun

fun! Format_Inflection_ToCamelCase()
	:s/\v([a-z])_([a-z])/\1\u\2/g
endfun

fun! Format_Inflection_ToUnderscored()
	:s/\v([a-z])([A-Z])/\L\1_\2/g
endfun

fun! CheckTabs()
	if search("\t") != 0
		echohl ErrorMsg | ec "                                 !WARNING!                              "
					\ |              ec "There are tabs in the file, do you want to convert them to spaces? [Y/n]" | echohl None
		let choice = nr2char(getchar())
		if choice == 'y' || choice == "\<CR>"
			retab 2
		endif
	else
		return
	endif
endfun

function! EnsureDirExists ()
	let required_dir = expand("%:h")
	if !isdirectory(required_dir)
		call mkdir(required_dir, 'p')
	endif
endfunction

fun! s:Sinit(filen)
	echo expand(a:filen)
	exec "ScreenShell cd " . expand(a:filen) . "; \\clear"
endfun

function! ToggleFocusMode()
	if (&foldcolumn != 12)
		set laststatus=0
		set numberwidth=10
		set foldcolumn=12
		set noruler
		hi FoldColumn ctermbg=none
		hi LineNr ctermfg=0 ctermbg=none
		hi NonText ctermfg=0
        set nonu norelativenumber
        GitGutterDisable
	else
		set laststatus=2
		set numberwidth=4
		set foldcolumn=0
		set ruler
        set nu relativenumber
        GitGutterEnable
		colorscheme skittles_berry "re-call your colorscheme
	endif
endfunc
nnoremap <F1> :call ToggleFocusMode()<cr>

" Highlight all instances of word under cursor, when idle.
" Useful when studying strange source code.
" Type z/ to toggle highlighting on/off.
nnoremap z/ :if AutoHighlightToggle()<Bar>set hls<Bar>endif<CR>
function! AutoHighlightToggle()
    let @/ = ''
    if exists('#auto_highlight')
        au! auto_highlight
        augroup! auto_highlight
        setl updatetime=4000
        echo 'Highlight current word: off'
        return 0
    else
        augroup auto_highlight
            au!
            au CursorHold * let @/ = '\V\<'.escape(expand('<cword>'), '\').'\>'
        augroup end
        setl updatetime=500
        echo 'Highlight current word: ON'
        return 1
    endif
endfunction
