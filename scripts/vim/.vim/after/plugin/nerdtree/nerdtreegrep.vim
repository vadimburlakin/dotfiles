call NERDTreeAddMenuItem({
            \ 'text': '(g)rep directory',
            \ 'shortcut': 'g',
            \ 'callback': 'NERDTreeGrep' })

function! NERDTreeGrep()
    let dirnode = g:NERDTreeDirNode.GetSelected()

    let pattern = input("Enter the search pattern: ")
    if pattern == ''
        echo 'Aborted'
        return
    endif

    call g:NERDTree.Close()
    let command = fzf#shellescape(pattern) . ' ' .  dirnode.path.str()
    call fzf#vim#ag_raw(command)
endfunction
