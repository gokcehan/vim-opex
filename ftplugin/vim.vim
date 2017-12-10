if exists("b:loaded_opex_vim")
  finish
endif
let b:loaded_opex_vim = 1

nnoremap <buffer> <silent> <plug>(opex-execute)
      \ :<c-u>let b:opex_view = winsaveview()
      \ \| set opfunc=opex#execute_op_vim<cr>g@

vnoremap <buffer> <silent> <plug>(opex-execute)
      \ :<c-u>call opex#execute_op_vim(visualmode(), 1)<cr>

nnoremap <buffer> <silent> <plug>(opex-append)
      \ :<c-u>let b:opex_view = winsaveview()
      \ \|set opfunc=opex#append_op_vim<cr>g@

vnoremap <buffer> <silent> <plug>(opex-append)
      \ :<c-u>call opex#append_op_vim(visualmode(), 1)<cr>

if !hasmapto('<plug>(opex-execute)')
  nmap gx <plug>(opex-execute)
  vmap gx <plug>(opex-execute)
endif

if !hasmapto('<plug>(opex-append)')
  nmap gz <plug>(opex-append)
  vmap gz <plug>(opex-append)
endif
