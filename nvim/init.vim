"============================================================
" NEOVIM INIT.VIM CONFIGURATION FILE
" OWNERSHIP: USER
" PABLO AGUIRRE NÚÑEZ
"============================================================

"------------------------------------------------------------
" BEGINNING OF VIM.INIT CONFIGURATION FILE
"------------------------------------------------------------

"============================================================
" General configuration
"============================================================

"------------------------------------------------------------
" Preparations
"------------------------------------------------------------
" Arch compatibility
"runtime! archlinux.vim

" General configuration
autocmd BufWinEnter *.py nnoremap <F3> :w<CR>:!clear;python3 %:p<CR>
set nocompatible
filetype off
set wildmenu
set wildmode=longest:full,full

" Disable vim startup screen and other useless stuff
set shortmess+=atTWIF

" Set viminfo directory
set viminfo+=n~/.cache/nvim/viminfo
" Let indentations be shown with dots on left
":set list listchars=tab:»-,trail:·,extends:»,precedes:«

" Yank to clipboard as default yank (causes lag issues when delete repetition)
"set clipboard+=unnamedplus

"------------------------------------------------------------
" Vim-Plug
"------------------------------------------------------------
" Source plugins from specified folder.
call plug#begin('/home/pabloagnck/.config/nvim/plugged')

" Include plugins.
"Plug 'ycm-core/YouCompleteMe'
"Plug 'konfekt/fastfold'
"Plug 'peterhoeg/vim-qml'
"Plug 'tpope/vim-fugitive'
Plug 'itchyny/lightline.vim'
Plug 'Yggdroot/indentLine'
Plug 'Vimjas/vim-python-pep8-indent'
Plug 'preservim/nerdcommenter'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/goyo.vim'

" End plugin sourcing.
call plug#end()

"------------------------------------------------------------
" Other configuration
"------------------------------------------------------------
" Automatically source (silently) .Xresources file upon saving
autocmd BufWritePost .Xresources silent! !xrdb ~/.config/Xresources/.Xresources

" Automatically source (silently) init.vim file upon saving
autocmd BufWritePost init.vim silent! :so %

"============================================================
" Lightline configuration
"============================================================
"Needed for correct display of lightline 
set laststatus=2

set foldmethod=manual

" Source theme directory
source ~/.config/nvim/colors/lumierelightline.vim

" Initialize Lightline
let g:lightline = {
      \ 'colorscheme': 'lumierelightline', 
      \ 'mode_map': {
        \ 'n' : 'NO',
        \ 'i' : 'IN',
        \ 'R' : 'RE',
        \ 'v' : 'VI',
        \ 'V' : 'VL',
        \ "\<C-v>": 'VB',
        \ 'c' : 'C',
        \ 's' : 'S',
        \ 'S' : 'SL',
        \ "\<C-s>": 'SB',
        \ 't': 'T',
        \ },
      \ 'active': {
      \   'left': [ ['mode', 'paste' ], 
      \	            [ 'readonly', 'fugitive', 'absolutepath', 'modified' ] ],
      \   'right': [ [ 'lineinfo', 'column' ], [ 'fileformat', 'fileencoding', 'filetype' ] ],
      \ },
      \ 'component': {
      \   'lineinfo': "%{line('.') . '/' . line('$')}",
      \   'icon': '',
      \ },
      \ 'component_function': {
      \   'fugitive': 'LightlineFugitive',
      \ },
      \ }


"============================================================
" Neomutt configuration
"============================================================
" Automatically start new mail on insert mode
autocmd FileType mail call s:mailFormat()

function! s:mailFormat()
  execute "normal /^\\n\<CR>o"
endfunction

"============================================================
" Nerd Commenter Configuration
"============================================================
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

"============================================================
" Fzf configuration 
"============================================================

"------------------------------------------------------------
"Colorscheme (Lets fzf inherit default VIM colorscheme)
"------------------------------------------------------------
let g:fzf_colors =
\ { 'fg':  ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }


"============================================================
" Indent Line Configuration
"============================================================
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

"============================================================
" YouCompleteMe Configurration
"============================================================
let g:ycm_autoclose_preview_window_after_insertion = 1

"============================================================
" PEP8 indentation standards
"============================================================

"------------------------------------------------------------
" Global PEP8 Indentation Standards
"------------------------------------------------------------
" Set indent shift spaces
"set shiftwidth=2

" Set tab spaces
"set tabstop=2

" Set soft tab spaces
"set softtabstop=2

"------------------------------------------------------------
" PEP8 Indentation Standards for .py and .js files.
"------------------------------------------------------------
:au BufNewFile,BufRead *.py,*.js
	\ set tabstop=4 |
	\ set softtabstop=4 |
	\ set shiftwidth=4 |
	\ set textwidth=79 |
	\ set expandtab |
	\ set autoindent |
	\ set fileformat=unix 

"------------------------------------------------------------
" Python PEP8 indent pluggin settings
"------------------------------------------------------------
let g:python_pep8_indent_hang_closing = 1
let g:python_pep8_indent_multiline_string = 1

"------------------------------------------------------------
" PEP8 Indentation Standards for .c files
"------------------------------------------------------------
:au BufNewFile,BufRead *.c,*.C
	\ set autoindent |
	\ set cindent |
	\ set shiftwidth=2 |
	\ set expandtab

"------------------------------------------------------------
" Highlighting standards for conf files
"------------------------------------------------------------
autocmd BufRead,BufNewFile logging.conf setf dosini
setf dosini

"============================================================
" LaTex Configuration
"============================================================
autocmd Filetype tex setl updatetime=1
let g:livepreview_previewer = 'okular'
let g:livepreview_engine = 'xelatex'
filetype plugin off

"============================================================
" Other sections
"============================================================
" Set esc key timeout
set timeoutlen=1000 ttimeoutlen=0

" Have Vim jump to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Load indentation rules and plugins according to the detected filetype.
filetype plugin indent on

" Activate syntax coloring
" NOTE: Config = ! as comment, Conf = # as comment
syntax enable

"------------------------------------------------------------
" Nvim colorscheme
"------------------------------------------------------------
" Include the lines below to override ctermbackground with st transparent background
" Function forces colorscheme to remain when goyo exits (goyo reloads deefault
" colorscheme on exit
function! s:patch_colors()
  hi Normal guibg=NONE ctermbg=NONE
endfunction

autocmd! ColorScheme lumierevim call s:patch_colors()

hi Normal guibg=NONE ctermbg=NONE

"Set vim colorscheme
colorscheme lumierevim

"Split screens more naturally (always below, and always to the right.
set splitbelow
set splitright

"Set encoding
set encoding=utf-8

"------------------------------------------------------------
" Section for current line cursor style
"------------------------------------------------------------
"Enables cursor line position tracking:
"set cursorline

"Removes the underline causes by enabling cursorline:
highlight clear CursorLine

"Sets the line numbering to red background:
highlight CursorLineNR term=bold ctermfg=1 

"------------------------------------------------------------
" Additional set options
"------------------------------------------------------------
" Autoindent when next line of code.
set autoindent				

" Show matching brackets.
set showmatch				

" Do case insensitive matching.
set ignorecase				

" Do smart case matching.
set smartcase				

" Incremental search.
set incsearch				

" Hide buffers when they are abandoned.
"set hidden				

" Enable mouse usage (all modes).
set mouse=a				

" Display column number as hybrid.
set number relativenumber
set nu rnu

" Enable ruler.
set ruler

" Enable all text matching the current search to be highlighted using the Search highlight group
set hlsearch

" Python highlighting
"Set Python highlighting.
"let python_highlight_all = 1		

"============================================================
" Keybindings
"============================================================
" Set map leader for shortcuts.
let mapleader= "," 			

" Set map local leader.
let maplocalleader = " "		

"------------------------------------------------------------
" Multiple cursors configuration
"------------------------------------------------------------
"let g:multi_cursor_use_default_mapping=0
"
"let g:multi_cursor_start_word_key      = '<leader>m'
"let g:multi_cursor_select_all_word_key = '<A-n>'
"let g:multi_cursor_start_key           = 'g<leader>m'
"let g:multi_cursor_select_all_key      = 'g<A-n>'
"let g:multi_cursor_next_key            = '<leader>m'
"let g:multi_cursor_prev_key            = '<C-p>'
"let g:multi_cursor_skip_key            = '<leader>x'
"let g:multi_cursor_quit_key            = '<Esc>'

" Remap nerd toggle comment to Space + c
"map <localleader>c <plug>NERDCommenterInvert
map <localleader>cc <plug>NERDCommenterComment
map <localleader>cu <plug>NERDCommenterUncomment

" Allow for insterting a new line without going into insert mode
nnoremap <localleader>o O<Esc>
nnoremap <localleader>O o<Esc>

" Map expand and contract indent folds
" Expand and contract all levels of selected fold
nnoremap <localleader>f zA

" Remap tilde for mark jumping.
nnoremap ' `
nnoremap ` '

" Go to next lowercase bookmark.
nnoremap <localleader>n ]'

" Rename every ocurrence (foo is origin, bar is destination).
" No confirmation, exact match.
nnoremap <localleader>r :%s/\<foo\>/bar/g 

" Allow saving of files as sudo when I forgot to start vim using sudo.
" Enters write mode and enters command.
cmap W w !sudo tee > /dev/null %<CR>

" Allow launching LLPLivePreview (Latex) with shortcut
cmap ltx LLPStartPreview<CR>

" Remap yank and paste to clipboard (works on any mode)
map <localleader>y "+y
map <localleader>p "+p

" Remap shortcuts for split screen switching 
nnoremap <c-j> <c-w><c-j>
nnoremap <c-k> <c-w><c-k>
nnoremap <c-l> <c-w><c-l>
nnoremap <c-h> <c-w><c-h>

" Remap shortcuts for new tab 
map <silent> <c-t> :tabnew<CR>

" Remap shortcuts for next tab
nmap <silent> <Tab> :tabNext<CR>

" Remap shortcuts for close tab
nmap <silent> <c-w>t :tabclose<CR>

" Navigate four times faster
nmap <c-j> 4j
nmap <c-k> 4k
nmap <c-h> 4h
nmap <c-l> 4l

" Execute current file on terminal
" Note: File needs to have shebang to point to interpreter
" Note: File needs to be executable by chmod +x filename
nnoremap <localleader>e :!clear && %:p<CR>
"
"------------------------------------------------------------
" Jupyter Keybindings
"------------------------------------------------------------
" Cancel out default keybindings
"let g:jupyter_mapkeys = 0
"nnoremap <buffer> <silent> <localleader>r :JupyterRunFile<CR>
"nnoremap <buffer> <silent> <localleader>c :JupyterConnect<CR>
"nnoremap <buffer> <silent> <localleader>s :JupyterSendRange<CR>

"------------------------------------------------------------
" FZF Keybindings
"------------------------------------------------------------
" Open conventional FZF
nnoremap <buffer> <silent> <C-f> :Files<CR>

" Customize fzf :Files command
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

" Remap escape for exiting previous search
" When backsace pressed in normal mode, :noh is executed, then carriage is
" pressed, esc is pressed, and :backspace is executed in order to clear
" command prompt.
nnoremap <backspace> :noh<cr><esc>:<backspace>

" Source a global configuration file if available
if filereadable("/etc/vim/vimrc.local")
  source /etc/vim/vimrc.local
endif

" To get rid of the file name displayed in the command line bar
set noshowmode
set cmdheight=1

"------------------------------------------------------------
" Goyo eybindings
"------------------------------------------------------------
nnoremap <silent> <localleader>g :Goyo<CR>

"------------------------------------------------------------
" Insert header template
"------------------------------------------------------------
function! Header()
    r~/.config/nvim/formats/userheader.txt
endfunction

nmap <localleader>ih :call Header()<CR>

"------------------------------------------------------------
" Insert beginning of file template
"------------------------------------------------------------
function! Begin()
    r~/.config/nvim/formats/userbegin.txt
endfunction

nmap <localleader>ib :call Begin()<CR>

"------------------------------------------------------------
" Insert end of file template
"------------------------------------------------------------
function! End()
    r~/.config/nvim/formats/userend.txt
endfunction

nmap <localleader>ie :call End()<CR>

"------------------------------------------------------------
" Insert comment 1 template
"------------------------------------------------------------
function! Comment1()
    r~/.config/nvim/formats/comment1.txt
endfunction

nmap <localleader>ic :call Comment1()<CR>

"------------------------------------------------------------
" Insert comment 2 template
"------------------------------------------------------------
function! Comment2()
    r~/.config/nvim/formats/comment2.txt
endfunction

nmap <localleader>iv :call Comment2()<CR>

" Set vim filetype
" vim: set ft=vim:

"------------------------------------------------------------
" END OF INIT.VIM CONFIGURATION FILE
"------------------------------------------------------------
