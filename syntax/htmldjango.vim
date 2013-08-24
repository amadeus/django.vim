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

runtime! syntax/django.vim
unlet b:current_syntax
runtime! syntax/html.vim
unlet b:current_syntax

" Django regions must be sourced AFTER html
runtime! syntax/djangoregions.vim

let b:current_syntax = "htmldjango"
