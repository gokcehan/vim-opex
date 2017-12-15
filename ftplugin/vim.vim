if exists('b:loaded_opex_vim')
  finish
endif
let b:loaded_opex_vim = 1

let b:opex_execute_func = 'opex#execute_vim'
let b:opex_append_func = 'opex#append_vim'

call opex#mappings()
call opex#bindings()
