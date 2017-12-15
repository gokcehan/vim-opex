if exists('b:loaded_opex_scheme')
  finish
endif
let b:loaded_opex_scheme = 1

if !has('mzscheme')
  finish
endif

let b:opex_cmd = 'mzscheme'
let b:opex_execute_func = 'opex#execute'
let b:opex_append_func = 'opex#append'

call opex#mappings()
call opex#bindings()
