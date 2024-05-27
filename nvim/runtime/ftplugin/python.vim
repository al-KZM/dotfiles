""" Functions
function AutoInitArgs()
    execute "normal! ^veyiself.$i = pj"
endfunction

""" Config
" For full syntax highlighting:
let python_highlight_all=1
syntax on
" Use UNIX (\n) line endings.
set fileformat=unix
" Set the default file encoding to UTF-8:
set encoding=utf-8

set tabstop=4 " Number of spaces that a pre-existing tab is equal to.
set shiftwidth=4 "spaces for indents
set expandtab
set softtabstop=4
set textwidth=100 " Wrap text after a certain number of characters

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
match BadWhitespace /^\t\+/

" Make trailing whitespace be flagged as bad.
match BadWhitespace /\s\+$/

" Keep indentation level from previous line:
set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start


"Folding based on indentation:
set foldmethod=indent

""" Shortcuts
" <leader>x = run file
map <leader>X :call PythonRunfile()<CR>
map <leader>x :FloatermNew --autoclose=0 python %<CR>

"Press <leader>b to insert breakpoint below
map <silent> <leader>b oimport ipdb; ipdb.set_trace()<esc>

" Auto init args
map <A-s> :call AutoInitArgs()<CR>

" Press CTRL-M to add a module to ctags
nnoremap <C-m> :!ctags -aR ~/.local/lib/python3.9/site-packages/<cword><cr>

