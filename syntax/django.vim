" Vim syntax file
" Language:	Django template
" Maintainer:	Dave Hodder <dmh@dmh.org.uk>
" Last Change:	2010 May 19

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syntax case match

" Django template built-in tags and parameters
" 'comment' doesn't appear here because it gets special treatment
syn keyword djangoStatement contained autoescape csrf_token empty
" FIXME ==, !=, <, >, <=, and >= should be djangoStatements:
" syn keyword djangoStatement contained == != < > <= >=
syn keyword djangoStatement contained and as block end endblock by cycle debug else elif
syn keyword djangoStatement contained extends filter endfilter firstof for
syn keyword djangoStatement contained endfor if endif ifchanged endifchanged
syn keyword djangoStatement contained ifequal endifequal ifnotequal
syn keyword djangoStatement contained endifnotequal in include load not now or
syn keyword djangoStatement contained parsed regroup reversed spaceless
syn keyword djangoStatement contained endspaceless ssi templatetag openblock
syn keyword djangoStatement contained closeblock openvariable closevariable
syn keyword djangoStatement contained openbrace closebrace opencomment
syn keyword djangoStatement contained closecomment widthratio url with endwith
syn keyword djangoStatement contained get_current_language trans noop blocktrans
syn keyword djangoStatement contained endblocktrans get_available_languages
syn keyword djangoStatement contained get_current_language_bidi plural

" Django templete built-in filters
syn keyword djangoFilter contained add addslashes capfirst center cut date
syn keyword djangoFilter contained default default_if_none dictsort
syn keyword djangoFilter contained dictsortreversed divisibleby escape escapejs
syn keyword djangoFilter contained filesizeformat first fix_ampersands
syn keyword djangoFilter contained floatformat get_digit join last length length_is
syn keyword djangoFilter contained linebreaks linebreaksbr linenumbers ljust
syn keyword djangoFilter contained lower make_list phone2numeric pluralize
syn keyword djangoFilter contained pprint random removetags rjust slice slugify
syn keyword djangoFilter contained safe safeseq stringformat striptags
syn keyword djangoFilter contained time timesince timeuntil title truncatechars
syn keyword djangoFilter contained truncatewords truncatewords_html unordered_list upper urlencode
syn keyword djangoFilter contained urlize urlizetrunc wordcount wordwrap yesno

" Keywords to highlight within comments
syn keyword djangoTodo contained TODO FIXME XXX

" If in an html file, regions will be sourced after html.vim
if !exists("main_syntax")
  runtime! syntax/djangoregions.vim
endif

" Define the default highlighting.
command -nargs=+ HiLink hi def link <args>
HiLink djangoStatement Statement
HiLink djangoFilter Identifier
HiLink djangoTodo Todo
delcommand HiLink

let b:current_syntax = "django"
