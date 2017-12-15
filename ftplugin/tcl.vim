if exists('b:loaded_opex_tcl')
  finish
endif
let b:loaded_opex_tcl = 1

if !has('tcl')
  finish
endif

let b:opex_cmd = 'tcl'
let b:opex_execute_func = 'opex#execute'
let b:opex_append_func = 'opex#append'

call opex#mappings()
call opex#bindings()
