"============================================================
" LUMIERE LIGHTLINE COLORSCHEME FILE
" OWNERSHIP: USER
" PABLO AGUIRRE NÚÑEZ
"============================================================

"------------------------------------------------------------
" BEGINNING OF LUMIERE LIGHTLINE COLORSCHEME FILE
"------------------------------------------------------------

"============================================================
" General color configuration
"============================================================

"------------------------------------------------------------
" Define colorscheme codes (#hex, xterm inherit) & structure
"------------------------------------------------------------
"let s:lumiere1 = ["#default", xresources inherited]
"let s:lumiere1 = ["#hex", xresources inherited]

"Black
let s:lumiere1 = ["#ffffff", 0]
"Green
let s:lumiere2 = ["#ffffff", 8]
"Bright green
let s:lumiere3 = ["#ffffff", 0]
"Lighter turquoise
let s:lumiere4 = ["#ffffff", 5]
"White
let s:lumiere5 = ["#ffffff", 7]
"White - sepia
let s:lumiere6 = ["#ffffff", 15]
"Turquoise
let s:lumiere7 = ["#ffffff", 14]
"Salmon
let s:lumiere8 = ["#ffffff", 6]
"Olive green
let s:lumiere9 = ["#ffffff", 4]
"Olive green darker
let s:lumiere10 = ["#ffffff", 12]
"Salmon brighter
let s:lumiere11 = ["#ffffff", 1]
"Light turquoise
let s:lumiere12 = ["#ffffff", 11]
"Red
let s:lumiere13 = ["#ffffff", 3]

" Define lightline structure
let s:p = {'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {}}

"------------------------------------------------------------
" Define mode colorschemes
"------------------------------------------------------------
" Define normal mode colorscheme
let s:p.normal.left = [ [ s:lumiere1, s:lumiere8 ], [ s:lumiere5, s:lumiere1 ] ]
let s:p.normal.middle = [ [ s:lumiere1, s:lumiere2 ] ]
let s:p.normal.right = [ [ s:lumiere8, s:lumiere1 ], [ s:lumiere8, s:lumiere1 ] ]
let s:p.normal.warning = [ [ s:lumiere8, s:lumiere1 ] ]
let s:p.normal.error = [ [ s:lumiere8, s:lumiere1 ] ]

" Define inactive mode colorscheme
let s:p.inactive.left = [ [ s:lumiere1, s:lumiere8 ], [ s:lumiere5, s:lumiere1 ] ]
let s:p.inactive.middle = [ [ s:lumiere1, s:lumiere2 ] ]
let s:p.inactive.right = [ [ s:lumiere8, s:lumiere1 ], [ s:lumiere5, s:lumiere1 ] ]

" Define insert mode colorscheme
let s:p.insert.left = [ [ s:lumiere1, s:lumiere10 ], [ s:lumiere10, s:lumiere1 ] ]
let s:p.insert.middle = [ [ s:lumiere8, s:lumiere1 ] ]
let s:p.insert.right = [ [ s:lumiere1, s:lumiere10 ], [ s:lumiere1, s:lumiere10 ] ]

"Define replace mode colorscheme
let s:p.replace.left = [ [ s:lumiere1, s:lumiere2 ], [ s:lumiere2, s:lumiere1 ] ]
let s:p.replace.middle = [ [ s:lumiere2, s:lumiere1 ] ]
let s:p.replace.right = [ [ s:lumiere1, s:lumiere2 ], [ s:lumiere1, s:lumiere2 ] ]

"Define visual mode colorscheme
let s:p.visual.left = [ [ s:lumiere1, s:lumiere7 ], [ s:lumiere7, s:lumiere1 ] ]
let s:p.visual.middle = [ [ s:lumiere7, s:lumiere1 ] ]
let s:p.visual.right = [ [ s:lumiere1, s:lumiere7 ], [ s:lumiere1, s:lumiere7 ] ]

"Define tabline colorscheme"
let s:p.tabline.left = [ [ s:lumiere5, s:lumiere2 ] ]
let s:p.tabline.middle = [ [ s:lumiere1, s:lumiere2 ] ]
let s:p.tabline.right = [ [ s:lumiere1, s:lumiere2 ] ]
let s:p.tabline.tabsel = [ [ s:lumiere1, s:lumiere8 ] ]

" Call on colorscheme & cleanup
let g:lightline#colorscheme#lumierelightline#palette = lightline#colorscheme#flatten(s:p)

" Set vim filetype
" vim: set ft=vim:

"------------------------------------------------------------
" END OF LUMIERE LIGHTLINE COLORSCHEME FILE
"------------------------------------------------------------
