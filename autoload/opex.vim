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

function opex#execute_op_ft(type, ...)
  if a:0
    silent exe "normal! gvy"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe "normal! `[v`]y"
  endif
  execute(&filetype . ' ' . @@)
  if exists('b:opex_view')
    call winrestview(b:opex_view)
    unlet b:opex_view
  endif
endfunction

function opex#append_op_ft(type, ...)
  if a:0
    silent exe "normal! gvy"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe "normal! `[v`]y"
  endif
  call s:append(execute(&filetype . ' ' . @@))
  if exists('b:opex_view')
    call winrestview(b:opex_view)
    unlet b:opex_view
  endif
endfunction

function opex#execute_op_pyx(type, ...)
  if a:0
    silent exe "normal! gvy"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe "normal! `[v`]y"
  endif
  execute('pyx ' . @@)
  if exists('b:opex_view')
    call winrestview(b:opex_view)
    unlet b:opex_view
  endif
endfunction

function opex#append_op_pyx(type, ...)
  if a:0
    silent exe "normal! gvy"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe "normal! `[v`]y"
  endif
  call s:append(execute('pyx ' . @@))
  if exists('b:opex_view')
    call winrestview(b:opex_view)
    unlet b:opex_view
  endif
endfunction

function! opex#execute_op_mz(type, ...)
  if a:0
    silent exe "normal! gvy"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe "normal! `[v`]y"
  endif
  execute('mz ' . @@)
  if exists('b:opex_view')
    call winrestview(b:opex_view)
    unlet b:opex_view
  endif
endfunction

function! opex#append_op_mz(type, ...)
  if a:0
    silent exe "normal! gvy"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe "normal! `[v`]y"
  endif
  call s:append(execute('mz ' . @@))
  if exists('b:opex_view')
    call winrestview(b:opex_view)
    unlet b:opex_view
  endif
endfunction

function! opex#execute_op_system(type, ...)
  if a:0
    silent exe "normal! gvy"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe "normal! `[v`]y"
  endif
  call system(@@)
  if exists('b:opex_view')
    call winrestview(b:opex_view)
    unlet b:opex_view
  endif
endfunction

function! opex#append_op_system(type, ...)
  if a:0
    silent exe "normal! gvy"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe "normal! `[v`]y"
  endif
  call s:append(system(@@))
  if exists('b:opex_view')
    call winrestview(b:opex_view)
    unlet b:opex_view
  endif
endfunction

function! opex#execute_op_vim(type, ...)
  if a:0
    silent exe "normal! gvy"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe "normal! `[v`]y"
  endif
  execute(@@)
  if exists('b:opex_view')
    call winrestview(b:opex_view)
    unlet b:opex_view
  endif
endfunction

function! opex#append_op_vim(type, ...)
  if a:0
    silent exe "normal! gvy"
  elseif a:type == 'line'
    silent exe "normal! '[V']y"
  else
    silent exe "normal! `[v`]y"
  endif
  call s:append(execute(@@))
  if exists('b:opex_view')
    call winrestview(b:opex_view)
    unlet b:opex_view
  endif
endfunction
