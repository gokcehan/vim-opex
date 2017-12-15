if exists('b:loaded_opex_ruby')
  finish
endif
let b:loaded_opex_ruby = 1

if !has('ruby')
  finish
endif

let b:opex_cmd = 'ruby'
let b:opex_execute_func = 'opex#execute'
let b:opex_append_func = 'opex#append'

call opex#mappings()
call opex#bindings()
