if exists('b:loaded_opex_python')
  finish
endif
let b:loaded_opex_python = 1

if !has('python') && !has('python3')
  finish
endif

let b:opex_cmd = 'python'
if has('pythonx')
  let b:opex_cmd = 'pythonx'
endif

let b:opex_execute_func = 'opex#execute'
let b:opex_append_func = 'opex#append'

call opex#mappings()
call opex#bindings()
