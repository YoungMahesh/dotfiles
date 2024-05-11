set tabstop=2 " tab-character should be 4 spaces wide
set softtabstop=2 " tab-char should be displayed as 4 spaces wide, even if `tabstop` setting is different
set shiftwidth=2  " insert 4 spaces on when <Tab> is clicked
set smarttab    " if(beginning of line) insert tab-char, else insert spaces defined in shiftwidth
set number " numbers on left side
set autoindent " auto-indent new lines based on indentation of previous lines
set mouse=a " enable mouse in all modes
set clipboard+=unnamedplus   " copy to system clipboard 

" nnoremap == mapping only for normal-mode
" xnoremap == mapping only for visual-mode
" noremap == mapping for all modes (normal, visual, select, etc)

" ---------------- mapping for normal mode ---------------
" if commands are not moving as expected, then check if there is whitespace at
"	the end of the command, ending whitespace leads commands to behave
"	differently

" append at the end of line
nnoremap a A

" move to end of the line
noremap 9 $

" move up half of the file
noremap q <C-u>

" move down half of the file
noremap ; <C-d>

" redo 
nnoremap r <C-r>


" ----------------- default mapping i am using ---------------------
"  gd  -> go to defination (opens declared function/variable when executed 'gd' on called function/variable)
"
