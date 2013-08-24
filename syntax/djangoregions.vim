" Mark illegal characters
syn match djangoError "%}\|}}\|#}"

" Django template constants (always surrounded by double quotes)
syn region djangoArgument contained start=/"/ skip=/\\"/ end=/"/

" Mark illegal characters within tag and variables blocks
syn match djangoTagError contained "#}\|{{\|[^%]}}\|[&#]"
syn match djangoVarError contained "#}\|{%\|%}\|[<>!&#%]"

" Adding support for strings within Django templates
syntax region  djangoStringD start=+"+ skip=+\\\\\|\\$"+  end=+"+ contained containedin=djangoTagBlock,djangoVarBlock keepend
syntax region  djangoStringS start=+'+ skip=+\\\\\|\\$'+  end=+'+ contained containedin=djangoTagBlock,djangoVarBlock keepend

" Django template tag and variable blocks
syn region djangoTagBlock matchgroup=djangoTagBrackets start="{%" end="%}" contains=djangoStatement,djangoFilter,djangoArgument,djangoTagError containedin=ALL
syn region djangoVarBlock matchgroup=djangoVarBrackets start="{{" end="}}" contains=djangoFilter,djangoArgument,djangoVarError containedin=ALL

" Django template 'comment' tag and comment block
syn region djangoComment start="{%\s*comment\s*%}" end="{%\s*endcomment\s*%}" contains=djangoTodo
syn region djangoComBlock start="{#" end="#}" contains=djangoTodo containedin=ALL

command -nargs=+ HiLink hi def link <args>
HiLink djangoComBlock Comment
HiLink djangoComment Comment
HiLink djangoArgument Constant
HiLink djangoError Error
HiLink djangoTagError Error
HiLink djangoVarError Error
HiLink djangoVarBrackets PreProc
HiLink djangoTagBlock PreProc
HiLink djangoVarBlock PreProc
HiLink djangoStringD String
HiLink djangoStringS String
delcommand HiLink

