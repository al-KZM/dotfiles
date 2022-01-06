
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

" Replace all is aliased to S.
	nnoremap S :%s//g<Left><Left>

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

"Press Q to execute the line and replace it by the output
noremap Q !!sh<CR>

"Press F8 to toggle TagBar plugin
nmap <F8> :TagbarOpenAutoClose<CR>

"use space to open folds
nnoremap <space> za


"""""" LEADER SHORTCUTS

" Spell-check set to <leader>o, 'o' for 'orthography':
nmap <leader>or :setlocal spell! spelllang=en_us<CR>
nmap <leader>t :FloatermToggle<CR>
nmap <leader>n :NERDTreeToggle<CR>
nmap <leader>N :NERDTree %<CR>

" Session management
map <leader>ss :SaveSession<CR>
map <leader>sS :SaveSession
map <leader>os :OpenSession

" Tabs management
map <leader>Tn :TabooOpen
map <leader>Tr :TabooRename


" vimling:
nm <leader><leader>d :call ToggleDeadKeys()<CR>
imap <leader><leader>d <esc>:call ToggleDeadKeys()<CR>a

" Navigating with guides
inoremap <leader><leader> <Esc>/<++><Enter>"_c4l
vnoremap <leader><leader> <Esc>/<++><Enter>"_c4l
map <leader><leader> <Esc>/<++><Enter>"_c4l

"Press <leader>p to execute the line as python command and replace it by the output
map <leader>p :call PythonExec()<CR>
map <leader>l :call PythonExecLine()<CR>

" Press <leader>h to switch to header file (or from header file to cpp file)
nnoremap <leader>h :FSHere<CR>

" Clap shortcuts
map <F4> :Clap colors<CR>
map <F5> :Clap files<CR>
nnoremap <leader>y :Clap yanks<CR>


"Spell check under cursor
nnoremap Z :call SpellCheckCurrent()<CR>

"Automatic spell replacement in insert mode
imap <c-l> <c-g>u<Esc>mt[s1z=`]`tmtla<c-g>u

" Refresh/Reload UltiSnip snippets
nmap <leader>uR :call UltiSnips#RefreshSnippets()<CR>

"Toggle left to right mode
imap <F3> <c-o>:call ToggleHebrew()<cr>
map <F3> :call ToggleHebrew()<cr>

"Python help
nnoremap <buffer> H :<C-u>execute "!pydoc3 " . expand("<cword>")<CR>

" togglelist plugin
let g:lt_location_list_toggle_map = '<F10>'
let g:lt_quickfix_list_toggle_map = '<F11>'

" Ctrl-p funky extension
nnoremap <Leader>pu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>uu :execute 'CtrlPFunky ' . expand('<cword>')<Cr>


"Syntastic syntax check
nmap <leader>C :SyntasticCheck<CR>

" Comment lines: gcc

" Paste file on termbin.com
nmap ,P :!$HOME/.config/scripts/termbin_file.sh %<CR>

