if get(g:, "hcl_fmt_autosave", 1)
    autocmd BufWritePre *.hcl call fmt#Format()
endif

if get(g:, "tf_fmt_autosave", 1)
    autocmd BufWritePre *.tf call fmt#Format()
endif

if get(g:, "nomad_fmt_autosave", 1)
    autocmd BufWritePre *.nomad call fmt#Format()
endif

command! -nargs=0 HclFmt call fmt#Format()


" vim:ts=4:sw=4:et
