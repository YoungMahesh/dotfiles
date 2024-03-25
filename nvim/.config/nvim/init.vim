set tabstop=4 " tab-character should be 4 spaces wide
set softtabstop=4 " tab-char should be displayed as 4 spaces wide, even if `tabstop` setting is different
set shiftwidth=4  " insert 4 spaces on when <Tab> is clicked
set smarttab    " if(beginning of line) insert tab-char, else insert spaces defined in shiftwidth
set number " numbers on left side
set autoindent " auto-indent new lines based on indentation of previous lines
set mouse=a " enable mouse in all modes

" ------------- mapping for normal mode -----------
" append at the end of line
nnoremap a A

" move to end of the line
nnoremap 9 $

" redo 
nnoremap r <C-r>

" move up half of the file
nnoremap q <C-u>

" move down half of the file
nnoremap ; <C-d>

" -------------- mapping for visual mode ----------
xnoremap 9 $ 
xnoremap q <C-u>
xnoremap ; <C-d>
