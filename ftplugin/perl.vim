if exists('b:loaded_opex_perl')
  finish
endif
let b:loaded_opex_perl = 1

if !has('perl')
  finish
endif

let b:opex_cmd = 'perl'
let b:opex_execute_func = 'opex#execute'
let b:opex_append_func = 'opex#append'

call opex#mappings()
call opex#bindings()
