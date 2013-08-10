" Vim syntax file
" Language:	Django HTML template
" Maintainer:	Amadeus Demarzi
" Notes: Based on the runtime htmldjango.vim by Dave Hodder

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'html'
endif

if version < 600
  so <sfile>:p:h/django.vim
  so <sfile>:p:h/html.vim
else
  runtime! syntax/django.vim
  runtime! syntax/html.vim
  unlet b:current_syntax
endif

" The django plugin loads the necessary syntax for htmldjango.
" This simply prevents the runtime htmldjango.vim file from
" clobbering the syntax

" Adding support for strings within Django templates
syntax region  djangoStringD start=+"+ skip=+\\\\\|\\$"+  end=+"+ contained containedin=djangoTagBlock,djangoVarBlock keepend
syntax region  djangoStringS start=+'+ skip=+\\\\\|\\$'+  end=+'+ contained containedin=djangoTagBlock,djangoVarBlock keepend

command -nargs=+ HiLink hi def link <args>
HiLink djangoStringD String
HiLink djangoStringS String
delcommand HiLink

let b:current_syntax = "htmldjango"
