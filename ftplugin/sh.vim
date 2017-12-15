if exists('b:loaded_opex_sh')
  finish
endif
let b:loaded_opex_sh = 1

let b:opex_execute_func = 'opex#execute_system'
let b:opex_append_func = 'opex#append_system'

call opex#mappings()
call opex#bindings()
