if exists('b:loaded_opex_lua')
  finish
endif
let b:loaded_opex_lua = 1

if !has('lua')
  finish
endif

let b:opex_cmd = 'lua'
let b:opex_execute_func = 'opex#execute'
let b:opex_append_func = 'opex#append'

call opex#mappings()
call opex#bindings()
