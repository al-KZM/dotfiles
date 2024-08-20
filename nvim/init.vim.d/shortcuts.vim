
nnoremap <A-a> <C-x>

" Source vimrc


map <leader>vR :source ~/.vimrc<CR>
" Shortcutting split navigation, saving a keypress:
	map <C-h> <C-w>h
	map <C-j> <C-w>j
	map <C-k> <C-w>k
	map <C-l> <C-w>l

" Tabs
    nnoremap <silent><Leader><C-]> <C-w><C-]><C-w>T

    nnoremap <C-Left> :tabprevious<CR>
    nnoremap <C-Right> :tabnext<CR>
    nnoremap <silent> <A-Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
    nnoremap <silent> <A-Right> :execute 'silent! tabmove ' . (tabpagenr()+1)<CR>
    nnoremap <C-x> :tabclose<CR>

" S - 'Replace all'.
	nnoremap S :%s//g<Left><Left>

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"Q - execute the line and replace it by the output
noremap Q !!sh<CR>

"Press F8 to toggle TagBar plugin
"nmap <F8> :TagbarOpenAutoClose<CR>

"use space to open folds
nnoremap <space> za


"""""" LEADER SHORTCUTS

" Spell-check set to <leader>o, 'o' for 'orthography':
    nmap <leader>or :setlocal spell! spelllang=en_us<CR>

" Session management
"map <leader>ss :SaveSession<CR>
"map <leader>sS :SaveSession
"map <leader>os :OpenSession

" Tabs management
"map <leader>Tn :TabooOpen
"map <leader>Tr :TabooRename

"Press <leader>p to execute the line as python command and replace it by the output
    map <leader>p :call PythonExec()<CR>
    map <leader>l :call PythonExecLine()<CR>

"Toggle left to right mode
imap <F3> <c-o>:call ToggleHebrew()<cr>
map <F3> :call ToggleHebrew()<cr>

"Python help
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>

" togglelist plugin
let g:lt_location_list_toggle_map = '<F10>'
let g:lt_quickfix_list_toggle_map = '<F11>'


" Comment lines: gcc

" Paste file on termbin.com
nmap ,P :!$CONFIG_DIR/scripts/termbin_file.sh %<CR>

" Git
nmap <leader>ga :Git add %<CR>
