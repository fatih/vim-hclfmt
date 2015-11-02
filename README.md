# vim-hclfmt

Vim plugin to format hcl files. It support auto format on save. Under the hood
it uses [hclfmt](https://github.com/fatih/hclfmt)

![hclfmt](http://g.recordit.co/fIQfohsGPI.gif)

## Usage

Save the file or call `:HclFmt`. 

By default vim-hclfmt automatically formats the file. To disable it:

```
g:hcl_fmt_autosave = 0
```

## Install

Vim-hclfmt follows the standard runtime path structure. For Pathogen just clone
the repo. For other plugin managers add the appropriate lines and execute the
plugin's install command.

*  [Pathogen](https://github.com/tpope/vim-pathogen)
  * `git clone https://github.com/fatih/vim-hclfmt.git ~/.vim/bundle/vim-hclfmt`
*  [vim-plug](https://github.com/junegunn/vim-plug)
  * `Plug 'fatih/vim-hclfmt'`
*  [NeoBundle](https://github.com/Shougo/neobundle.vim)
  * `NeoBundle 'fatih/vim-hclfmt'`
*  [Vundle](https://github.com/gmarik/vundle)
  * `Plugin 'fatih/vim-hclfmt'`


