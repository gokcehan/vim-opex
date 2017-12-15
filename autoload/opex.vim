" helper function to comment an output line
function! s:comment(key, val) abort
  let l:cms = &commentstring
  let l:cms = substitute(l:cms, '\S\zs%s', ' %s', '')
  let l:cms = substitute(l:cms, '%s\ze\S', '%s ', '')
  return substitute(l:cms, "%s", a:val, "")
endfunction

" append given text as comment under text object
function! s:append(text) abort
  let l:lns = split(a:text, '\n')
  let l:out = map(l:lns, function('s:comment'))
  call append(line("']"), l:out)
endfunction

" select the proper text object
function! s:select(count, type)
  if a:count " visual mode
    silent exe "normal! gvy"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe "normal! `[v`]y"
  endif
endfunction

" restore previous window view
function! s:restore()
  if exists('b:opex_view')
    call winrestview(b:opex_view)
    unlet b:opex_view
  endif
endfunction

function! opex#execute(type, ...)
  call s:select(a:0, a:type)
  execute(b:opex_cmd . ' ' . @@)
  call s:restore()
endfunction

function! opex#execute_system(type, ...)
  call s:select(a:0, a:type)
  call system(@@)
  call s:restore()
endfunction

function! opex#execute_vim(type, ...)
  call s:select(a:0, a:type)
  execute(@@)
  call s:restore()
endfunction

function! opex#append(type, ...)
  call s:select(a:0, a:type)
  call s:append(execute(b:opex_cmd . ' ' . @@))
  call s:restore()
endfunction

function! opex#append_system(type, ...)
  call s:select(a:0, a:type)
  call s:append(system(@@))
  call s:restore()
endfunction

function! opex#append_vim(type, ...)
  call s:select(a:0, a:type)
  call s:append(execute(@@))
  call s:restore()
endfunction

function! opex#mappings()
  nnoremap <buffer> <silent> <plug>(opex-execute)
        \ :<c-u>let b:opex_view = winsaveview()
        \ \| let &opfunc=b:opex_execute_func<cr>g@
  vnoremap <buffer> <silent> <plug>(opex-execute)
        \ :<c-u>call function(b:opex_execute_func)(visualmode(), 1)<cr>
  nnoremap <buffer> <silent> <plug>(opex-execute-line)
        \ :<c-u>let b:opex_view = winsaveview()
        \ \| let &opfunc=b:opex_execute_func
        \ \| exe 'normal! 'v:count1.'g@_'<cr>
  nnoremap <buffer> <silent> <plug>(opex-append)
        \ :<c-u>let b:opex_view = winsaveview()
        \ \| let &opfunc=b:opex_append_func<cr>g@
  vnoremap <buffer> <silent> <plug>(opex-append)
        \ :<c-u>call function(b:opex_append_func)(visualmode(), 1)<cr>
  nnoremap <buffer> <silent> <plug>(opex-append-line)
        \ :<c-u>let b:opex_view = winsaveview()
        \ \| let &opfunc=b:opex_append_func
        \ \| exe 'normal! 'v:count1.'g@_'<cr>
endfunction

function! opex#bindings()
  if !hasmapto('<plug>(opex-execute)')
    nmap gx <plug>(opex-execute)
    vmap gx <plug>(opex-execute)
  endif
  if !hasmapto('<plug>(opex-execute-line)')
    nmap gxx <plug>(opex-execute-line)
  endif
  if !hasmapto('<plug>(opex-append)')
    nmap gz <plug>(opex-append)
    vmap gz <plug>(opex-append)
  endif
  if !hasmapto('<plug>(opex-append-line)')
    nmap gzz <plug>(opex-append-line)
  endif
endfunction
