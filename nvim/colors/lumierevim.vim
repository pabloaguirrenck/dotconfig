"============================================================
" LUMIEREVIM COLORSCHEME FILE
" OWNERSHIP: USER
" PABLO AGUIRRE NÚÑEZ
"============================================================

"------------------------------------------------------------
" BEGINNING OF LUMIEREVIM COLORSCHEME FILE
"------------------------------------------------------------

"============================================================
" Preparations
"============================================================

"------------------------------------------------------------
" Bootstrap
"------------------------------------------------------------
hi clear
if exists('syntax_on') | syntax reset | endif
set background=dark
let g:colors_name = 'lumierevim'

"------------------------------------------------------------
" Helper Function
"------------------------------------------------------------
" Execute the 'highlight' command with a List of arguments.
function! s:Highlight(args)
  exec 'highlight ' . join(a:args, ' ')
endfunction

function! s:AddGroundValues(accumulator, ground, color)
  let new_list = a:accumulator
  for [where, value] in items(a:color)
    call add(new_list, where . a:ground . '=' . value)
  endfor

  return new_list
endfunction

function! s:Col(group, fg_name, ...)
  " ... = optional bg_name

  let pieces = [a:group]

  if a:fg_name !=# ''
    let pieces = s:AddGroundValues(pieces, 'fg', s:colors[a:fg_name])
  endif

  if a:0 > 0 && a:1 !=# ''
    let pieces = s:AddGroundValues(pieces, 'bg', s:colors[a:1])
  endif

  call s:Clear(a:group)
  call s:Highlight(pieces)
endfunction

function! s:Attr(group, attr)
  let l:attrs = [a:group, 'term=' . a:attr, 'cterm=' . a:attr, 'gui=' . a:attr]
  call s:Highlight(l:attrs)
endfunction

function! s:Clear(group)
  exec 'highlight clear ' . a:group
endfunction

"============================================================
" Colorscheme
"============================================================

"------------------------------------------------------------
" Colors definition
"------------------------------------------------------------
" Store all the colors in a dictionary.
let s:colors = {}

" Define base colors.
let s:colors.base0 = { 'gui': '#484848', 'cterm': 0  }
let s:colors.base1 = { 'gui': '#ff0038', 'cterm': 8  }
let s:colors.base2 = { 'gui': '#26a98b', 'cterm': 10 }
let s:colors.base3 = { 'gui': '#ff3b5a', 'cterm': 12 }
let s:colors.base4 = { 'gui': '#265562', 'cterm': 11 }
let s:colors.base5 = { 'gui': '#4e5465', 'cterm': 14 }
let s:colors.base6 = { 'gui': '#33859d', 'cterm': 7  }
let s:colors.base7 = { 'gui': '#000000', 'cterm': 4 }

" Define other colors.
let s:colors.red     = { 'gui': '#ff0038', 'cterm': 1  }
let s:colors.orange  = { 'gui': '#d26937', 'cterm': 9  }
let s:colors.yellow  = { 'gui': '#ff0038', 'cterm': 3  }
let s:colors.magenta = { 'gui': '#888ca6', 'cterm': 13 }
let s:colors.violet  = { 'gui': '#4e5166', 'cterm': 5  }
let s:colors.blue    = { 'gui': '#195466', 'cterm': 4  }
let s:colors.cyan    = { 'gui': '#33859E', 'cterm': 6  }
let s:colors.green   = { 'gui': '#00ffbe', 'cterm': 2  }

"------------------------------------------------------------
" General colors assigning
"------------------------------------------------------------
" Define background & linenr background
let s:background = 'base0'
let s:linenr_background = 'base0'

" Define foreground
call s:Col('Normal', 'base6', s:background)

" Define line, cursor, & cursor column.
call s:Col('Cursor', 'base1', 'base6')
call s:Col('CursorLine', 'base0', '')
call s:Col('CursorColumn', '', 'base1')

" Define sign column & line numbers.
call s:Col('LineNr', 'base1', '')
call s:Col('CursorLineNr', 'red', '')
call s:Col('SignColumn', '', s:linenr_background)
call s:Col('ColorColumn', '', s:linenr_background)

" Define visual selection.
call s:Col('Visual', 'base0', 'base3')

" Define other attributes
call s:Col('Comment', 'base7')
call s:Attr('Comment', 'italic')
call s:Col('String', 'green')
call s:Col('Number', 'orange')
call s:Col('Statement', 'base5')
call s:Col('Special', 'orange')
call s:Col('Identifier', 'base5')

" Define constants & Ruby symbols.
call s:Col('Constant', 'magenta')

" Define HTML tags (<title>, some <h*>s)
call s:Col('Title', 'orange')

" Define <a> tags.
call s:Col('Underlined', 'yellow')
call s:Attr('Underlined', 'underline')

" Define types, HTML attributes, Ruby constants (and class names).
call s:Col('Type', 'orange')

" Define stuff like 'require' in Ruby.
call s:Col('PreProc', 'red')

" Define tildes on the bottom of the page.
call s:Col('NonText', 'base3')

" Define concealed stuff.
call s:Col('Conceal', 'cyan', s:background)

" Define TODO and similar tags.
call s:Col('Todo', 'magenta', s:background)

" Define the column separating vertical splits.
call s:Col('VertSplit', 'blue', s:linenr_background)
call s:Col('StatusLineNC', 'blue', 'base2')

" Define matching parenthesis.
call s:Col('MatchParen', 'base0', 'orange')

" Define special keys, e.g. some of the chars in 'listchars'. See ':h listchars'.
call s:Col('SpecialKey', 'base3')

" Define folds.
call s:Col('Folded', 'base6', 'blue')
call s:Col('FoldColumn', 'base5', 'base3')

" Define searching.
call s:Col('Search', 'base0', 'red')
call s:Attr('Search', 'italic')

call s:Attr('IncSearch', 'reverse')

" Define popup menu.
call s:Col('Pmenu', 'base2', 'base0')
call s:Col('PmenuSel', 'base6', 'blue')
call s:Col('PmenuSbar', '', 'base2')
call s:Col('PmenuThumb', '', 'blue')

" Define command line attributes.
call s:Col('ErrorMsg', 'red', 'base0')
call s:Col('Error', 'red', 'base0')
call s:Col('ModeMsg', 'blue')
call s:Col('WarningMsg', 'red')

" Define Wild menu.
" Note: StatusLine determines the color of the non-active entries in the wild menu.
call s:Col('StatusLine', 'base0', 'red')
call s:Col('WildMenu', 'red', 'base0')
call s:Attr('Wildmenu','bold')

" Define the 'Hit ENTER to continue prompt'.
call s:Col('Question', 'green')

" Define tab line.
" Define the selected tab.
call s:Col('TabLineSel', 'base6', 'blue')  

" Ddefine the non-selected tabs.
call s:Col('TabLine', 'base0', 'base2')     

" Define the rest of the tab line.
call s:Col('TabLineFill', 'base1', 'base1') 

" Define spelling.
call s:Col('SpellBad', 'base0', 'red')
call s:Col('SpellCap', 'base0', 'blue')
call s:Col('SpellLocal', 'red')
call s:Col('SpellRare', 'base0', 'red')

" Define diffing.
call s:Col('DiffAdd', 'base6', 'green')
call s:Col('DiffChange', 'base6', 'blue')
call s:Col('DiffDelete', 'base6', 'red')
call s:Col('DiffText', 'base6', 'cyan')
call s:Col('DiffAdded', 'green')
call s:Col('DiffChanged', 'blue')
call s:Col('DiffRemoved', 'red')
call s:Col('DiffSubname', 'blue')

" Define directories (e.g. netrw).
call s:Col('Directory', 'cyan')

"------------------------------------------------------------
" Programming languages colors assigning
"------------------------------------------------------------
" Define Ruby.
call s:Col('rubyDefine', 'base3')
call s:Col('rubyStringDelimiter', 'green')

" Define HTML (and often Markdown).
call s:Col('htmlArg', 'blue')
call s:Col('htmlItalic', 'magenta')
call s:Col('htmlBold', 'cyan', '')

" Define Python.
call s:Col('pythonStatement', 'base3')

"------------------------------------------------------------
" Plugin colors assigning
"------------------------------------------------------------
" Define GitGutter.
call s:Col('GitGutterAdd', 'green', s:linenr_background)
call s:Col('GitGutterChange', 'cyan', s:linenr_background)
call s:Col('GitGutterDelete', 'orange', s:linenr_background)
call s:Col('GitGutterChangeDelete', 'magenta', s:linenr_background)

" Define CtrlP.
" Define no entries.
call s:Col('CtrlPNoEntries', 'base6', 'orange') 

" Define matching part.
call s:Col('CtrlPMatch', 'green')               

" Define '>>>' prompt.
call s:Col('CtrlPPrtBase', 'blue')             

" Define text in the prompt.
call s:Col('CtrlPPrtText', 'cyan')              

" Define cursor in the prompt.
call s:Col('CtrlPPtrCursor', 'base6')           

" Define unite.vim
call s:Col('UniteGrep', 'base6', 'green')
let g:unite_source_grep_search_word_highlight = 'UniteGrep'

" Define ale 
" https://github.com/w0rp/ale
call s:Col('ALEWarningSign', 'yellow', s:linenr_background)
call s:Col('ALEErrorSign', 'red', s:linenr_background)

" Define neomake 
" https://github.com/neomake/neomake
call s:Col('NeomakeWarningSign', 'yellow', s:linenr_background)
call s:Col('NeomakeErrorSign', 'red', s:linenr_background)
call s:Col('NeomakeWarning', 'yellow')
call s:Col('NeomakeError', 'red')

"============================================================
" Cleanup
"============================================================
unlet s:colors
unlet s:background
unlet s:linenr_background

" Set vim filetype
" vim: set ft=vim:

"------------------------------------------------------------
" END OF LUMIEREVIM COLORSCHEME FILE
"------------------------------------------------------------
