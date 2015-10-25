" fmt.vim: Vim command to format HCL files with hclfmt.

if !exists('g:hcl_fmt_fail_silently')
    let g:hcl_fmt_fail_silently = 0
endif

if !exists('g:hcl_fmt_options')
    let g:hcl_fmt_options = ''
endif

" Below function is copied from vim-go's fmt.vim file.
function! fmt#Format()
    if !executable("hclfmt")
        echo "hclfmt: could not find hclfmt. Please install it from github.com/fatih/hclfmt"
        return ""
    endif

    " save cursor position and many other things
    let l:curw=winsaveview()

    " Write current unsaved buffer to a temp file
    let l:tmpname = tempname()
    call writefile(getline(1, '$'), l:tmpname)

    let fmt_command = "hclfmt"

    " populate the final command with user based fmt options
    let command = fmt_command . ' -w ' . g:hcl_fmt_options

    " execute our command...
    let out = system(command . " " . l:tmpname)

    "if there is no error on the temp file replace the output with the current
    "file (if this fails, we can always check the outputs first line with:
    "splitted =~ 'package \w\+')
    if v:shell_error == 0
        " remove undo point caused via BufWritePre
        try | silent undojoin | catch | endtry

        " Replace current file with temp file, then reload buffer
        call rename(l:tmpname, expand('%'))
        silent edit!
        let &syntax = &syntax
    elseif g:hcl_fmt_fail_silently == 0
        echo out
        " We didn't use the temp file, so clean up
        call delete(l:tmpname)
    endif

    " restore our cursor/windows positions
    call winrestview(l:curw)
endfunction


" vim:ts=4:sw=4:et
