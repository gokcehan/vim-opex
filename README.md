# vim-opex

Opex is a simple plugin that defines two custom operators to execute motions (`:h motion.txt`) with builtin interpreters.
Execution operator (`opex-execute`) executes the code and displays any output in the message line.
Appending operator (`opex-append`) executes the code and appends any output as a comment below the code.

![demo-screencast](https://media.giphy.com/media/3o6fIQjIwdHzHN0fQY/giphy.gif)

## Languages

Following languages are supported with their corresponding interfaces:

- lua (`:h if_lua.txt`)
- perl (`:h if_perl.txt`)
- python (`:h if_pyth.txt`)
- ruby (`:h if_ruby.txt`)
- scheme (`:h if_mzsch.txt`)
- tcl (`:h if_tcl.txt`)
- sh (`:h system()`)
- vim (`:h execute()`)

Opex is automatically loaded if you have the required feature enabled in vim (e.g. `+lua` for lua files).
If you have installed vim from a repository, you are likely missing most of these features.
Therefore, you may need to compile vim from source with corresponding features enabled at compile time.

## Installation

Drop `autoload/opex.vim` to `~/.vim/autoload` and any of the files under `ftplugin` to `~/.vim/ftplugin`.

If you are using vim8 you can simply clone this repository as such (`:h packages`):

    git clone https://github.com/gokcehan/vim-opex.git ~/.vim/pack/plugins/start/vim-opex

If you are using another plugin manager you should know what to do.

## Configuration

By default execution is mapped to `gx` and appending is mapped to `gz`.
You can configure these mappings in your vimrc as such:

    nmap ge <plug>(opex-execute)
    vmap ge <plug>(opex-execute)

    nmap gE <plug>(opex-append)
    vmap gE <plug>(opex-append)

If you want to disable opex for a specific filetype you can use the following:

    let b:loaded_opex_lua = 1

Appending uses the value of `commentstring` option for comments.
You can change this option to configure the commenting style:

    autocmd Filetype lua setlocal commentstring=--[[%s]]

## Known Issues

- Any limitation on the builtin interpreter also applies to opex (e.g. gui, threading).
- If you accidentally execute an infinite loop, you may need to manually kill the vim process.
- If you crash the interpreter somehow, plugins that use the same interface may stop working until you restart vim.

## License

Public domain.
