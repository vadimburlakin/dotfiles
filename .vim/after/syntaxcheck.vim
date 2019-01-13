" JavasScript awesomeness
" Disabled for now, was getting buggy
" You'll need my jslint/jslint_wrapper and js-support files/dirs
"sign define linterr text=* texthl=Error linehl=Error
"
"fun! CheckJSSyntax()
"  let test = system("jslint ". expand('%')." -clean")
"  let clean = substitute(test, "\n", "\\n", "gis")
"  let listarg = substitute(clean, "^{\\([0-9 ]\\+\\)}\.\\+", "\\1", "gis")
"
"  if (test != "No errors.\n")
"    for line in split(listarg, " ")
"      exec ":sign place " . line . " line=" . line . " name=linterr file=" . expand("%:p")
"    endfor
"    echon "". substitute(test, "^{\\([0-9 ]\\+\\)}", "", "gis")
"  else
"    sign unplace *
"  endif
"endfun
"
"if !exists("js_autocmd_loaded")
"  let js_autocmd_loaded = 1
"  autocmd FileType javascript autocmd BufWritePost <buffer> :call CheckJSSyntax()
"  autocmd FileType javascript noremap J :call CheckJSSyntax() 
"endif
