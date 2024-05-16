if ! filereadable(expand('$CONFIG_DIR/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p $CONFIG_DIR/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $CONFIG_DIR/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

call plug#begin('$CONFIG_DIR/nvim/plugged')

Plug 'neoclide/coc.nvim', {'branch':'release'}

Plug 'vifm/vifm.vim'

Plug 'tpope/vim-surround'

"Write french accents:
Plug 'LukeSmithxyz/vimling'

Plug 'bling/vim-airline'
"
" gcc to comment:
Plug 'tpope/vim-commentary'

"Colors
Plug 'rebelot/kanagawa.nvim'
Plug 'folke/tokyonight.nvim'

" Plug 'lifepillar/vim-solarized8'
" Plug 'jnurmine/Zenburn'
" Plug 'jaredgorski/spacecamp'
" Plug 'chrisbra/Colorizer'
" Plug 'jdsimcoe/abstract.vim'
" Plug 'danilo-augusto/vim-afterglow'

"Utils
Plug 'gyim/vim-boxdraw'
Plug 'vimwiki/vimwiki'

"APIs
Plug 'mattn/webapi-vim'
Plug 'mattn/vim-gist'

"System
Plug 'voldikss/vim-floaterm'

"Filesystem
Plug 'Valloric/ListToggle'
Plug 'liuchengxu/vim-clap'
Plug 'ctrlpvim/ctrlp.vim'

"CTRLP extensions
Plug 'tacahiroy/ctrlp-funky'

"Git interface
Plug 'cohama/agit.vim'
"DOESNT WORK: Plug 'jreybert/vimagit'
Plug 'airblade/vim-gitgutter'

"Html
Plug 'jtratner/vim-flavored-markdown'
Plug 'suan/vim-instant-markdown'
Plug 'nelstrom/vim-markdown-preview'

"reStructured Text

"Syntax
Plug 'vim-syntastic/syntastic'

"C
Plug 'vim-scripts/c.vim', { 'for': 'c' }

"Cpp Syntax highlighting
Plug 'bfrg/vim-cpp-modern', { 'for': 'cpp' }

"python syntax checker
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'lepture/vim-jinja', { 'for': 'python' }

"Python pytest support
Plug 'alfredodeza/pytest.vim', { 'for': 'python' }

"Auto completion
"C#
Plug 'idbrii/vim-unityengine', { 'for': 'cs.unity' }
Plug 'idbrii/vim-unityengine-docs', { 'for': 'cs.unity' }

"Dart
Plug 'dart-lang/dart-vim-plugin', { 'for': 'dart' }

"Flutter

"Java
Plug 'artur-shaik/vim-javacomplete2', { 'for': 'java' }
Plug 'starcraftman/vim-eclim', { 'for': 'java' }

"Go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries', 'for': 'go' }



"Files syntax
"Plug 'mboughaba/i3config.vim'
"Plug 'PotatoesMaster/i3-vim-syntax'
"Plug 'kovetskiy/sxhkd-vim'

"code folding
Plug 'tmhedberg/SimpylFold'

"Code navigation
Plug 'junegunn/fzf.vim'
Plug 'kshenoy/vim-signature'
Plug 'gcmt/taboo.vim'
Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'
Plug 'majutsushi/tagbar'
Plug 'anschnapp/move-less'
Plug 'ipod825/vim-tabdrop'
"Plug 'xolox/vim-easytags'
"Plug 'coderifous/working-set.vim'

"C navigation
Plug 'vim-scripts/cscope.vim', { 'for': ['cpp', 'c'] }

"GITHUB COPILOT !!!!
Plug 'github/copilot.vim'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""CONFIG"""""""""""""""""""""""""""""""""
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""CTAGS"""""""""""""""""""""""""""""""""
set tags=tags;

""""""""""""""""""""""""""""""""""""VIM-LSC"""""""""""""""""""""""""""""""""
let g:lsc_auto_map = v:true

"""""""""""""""""""""COC"""""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
          \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif
" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocActionAsync('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocActionAsync('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocActionAsync('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

"""""""""""""""""""""""""""""""""""""""FZF""""""""""""""""""""""""""""""""""""
nnoremap <leader>f :Ag<CR>
nnoremap <leader>F :Files<CR>


""""""""""""""""""""""""""""""""""""OMNISHARP"""""""""""""""""""""""""""""""""
Plug 'OmniSharp/omnisharp-vim'
let g:OmniSharp_server_use_mono = 1

inoremap <expr> <Tab> pumvisible() ? '<C-n>' :
\ getline('.')[col('.')-2] =~# '[[:alnum:].-_#$]' ? '<C-x><C-o>' : '<Tab>'

nnoremap <C-o><C-u> :OmniSharpFindUsages<CR>
nnoremap <C-o><C-d> :OmniSharpGotoDefinition<CR>
nnoremap <C-o><C-d><C-p> :OmniSharpPreviewDefinition<CR>
nnoremap <C-o><C-r> :!dotnet run

""""""""""""""""""""""""""""""""""""VIM-FLUTTER"""""""""""""""""""""""""""""""""
Plug 'thosakwe/vim-flutter'
let g:hot_reload_on_save=0

""""""""""""""""""""""""""""""""""""EASY SHARP"""""""""""""""""""""""""""""""""
let g:easytags_cmd = '/usr/bin/ctags'
let g:easytags_file = '$CONFIG_DIR/nvim/tags'

""""""""""""""""""""""""""""""""""""COLORIZER"""""""""""""""""""""""""""""""""
let g:colorizer_auto_color = 1

""""""""""""""""""""""""""""""""""""NERD TREE"""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc$', '\~$'] "ignore files in NERDTree

"""""""""""""""""""""""""""""""""""""""""""""""""""FUGITIVE"""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive'
nnoremap <leader>gd :Gvdiff<CR>
nnoremap gdh :diffget //2<CR>
nnoremap gdl :diffget //3<CR>

"""""""""""""""""""""""""""""""""""VIMTEX"""""""""""""""""""""""""""""""""
Plug 'lervag/vimtex', { 'for': 'tex' }
let g:livepreview_previewer = $READER
let g:tex_flavor = "tex"

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0

"""""""""""""""""""""""""""""""""""VIM-LATEX-LIVE-PREVIEW"""""""""""""""""""""""""""""""""
Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

let g:livepreview_previewer = 'zathura'
let g:updatetime = 1000

"""""""""""""""""""""""""""""""""""ULTISNIPS"""""""""""""""""""""""""""""""""
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

""""""""""""""""""""""""TEX-CONCEAL""""""""""""""""'
Plug 'KeitaNakamura/tex-conceal.vim', { 'for': 'tex' }

set conceallevel=2
let g:tex_conceal="abdgms"

call plug#end()

""""""""""""""""""""""""CTRL-P""""""""""""""""'
"Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']


""""""""""""""""""""""SYNTASTIC"""""""""""""""""''
" let g:syntastic_java_checkers = ['checkstyle']
" let g:syntastic_java_checkstyle_classpath = '$HOME/documents/clones/checkstyle/checkstyle-8.39-all.jar'
" let g:syntastic_java_checkstyle_conf_file = '$HOME/documents/clones/checkstyle/checkstyle.xml'
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0



