if ! filereadable(expand('$CONFIG_DIR/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p $CONFIG_DIR/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > $CONFIG_DIR/nvim/autoload/plug.vim
	autocmd VimEnter * "PlugInstall
endif

call plug#begin('$CONFIG_DIR/nvim/plugged')


Plug 'vifm/vifm.vim'

Plug 'tpope/vim-surround'

"Write french accents:
"Plug 'LukeSmithxyz/vimling'

"Plug 'bling/vim-airline'

" gcc to comment:
Plug 'tpope/vim-commentary'

"Colors
"Plug 'rebelot/kanagawa.nvim'
"Plug 'folke/tokyonight.nvim'
" "Plug 'lifepillar/vim-solarized8'
" "Plug 'jnurmine/Zenburn'
" "Plug 'jaredgorski/spacecamp'
" "Plug 'chrisbra/Colorizer'
" "Plug 'jdsimcoe/abstract.vim'
" "Plug 'danilo-augusto/vim-afterglow'

"Utils
"Plug 'gyim/vim-boxdraw'
"Plug 'vimwiki/vimwiki'

"APIs
"Plug 'mattn/webapi-vim'
"Plug 'mattn/vim-gist'

"System
Plug 'voldikss/vim-floaterm'

"Filesystem
"Plug 'Valloric/ListToggle'
"Plug 'liuchengxu/vim-clap'

"Git interface
"Plug 'cohama/agit.vim'
"DOESNT WORK: "Plug 'jreybert/vimagit'
"Plug 'airblade/vim-gitgutter'

"Html
"Plug 'jtratner/vim-flavored-markdown'
"Plug 'suan/vim-instant-markdown'
"Plug 'nelstrom/vim-markdown-preview'

"reStructured Text


"C/Cpp
Plug 'vim-scripts/a.vim', { 'for': ['c', 'cpp']}

"C only
Plug 'vim-scripts/c.vim', { 'for': 'c' }
    let g:C_Ctrl_j = 'off'

"Cpp only
Plug 'bfrg/vim-cpp-modern', { 'for': 'cpp' }

"python syntax checker
Plug 'nvie/vim-flake8', { 'for': 'python' }
Plug 'vim-scripts/indentpython.vim', { 'for': 'python' }
Plug 'lepture/vim-jinja', { 'for': 'python' }

"Python pytest support
"Plug 'alfredodeza/pytest.vim', { 'for': 'python' }

"Auto completion
"C#
"Plug 'idbrii/vim-unityengine', { 'for': 'cs.unity' }
"Plug 'idbrii/vim-unityengine-docs', { 'for': 'cs.unity' }

"Special files syntax
""Plug 'mboughaba/i3config.vim'
""Plug 'PotatoesMaster/i3-vim-syntax'
""Plug 'kovetskiy/sxhkd-vim'

"code folding
Plug 'tmhedberg/SimpylFold'

"Code navigation
Plug 'kshenoy/vim-signature'
"Plug 'gcmt/taboo.vim'
"Plug 'xolox/vim-session'
"Plug 'xolox/vim-misc'
"Plug 'ludovicchabant/vim-gutentags'
Plug 'majutsushi/tagbar'
Plug 'anschnapp/move-less'
"Plug 'ipod825/vim-tabdrop'
""Plug 'xolox/vim-easytags'
""Plug 'coderifous/working-set.vim'

"GITHUB COPILOT !!!!
"Plug 'github/copilot.vim'
"

" Take a look to :
" navigator.lua


if 1
    Plug 'williamboman/mason.nvim'
    Plug 'williamboman/mason-lspconfig.nvim'
:lua << EOF
    require("mason").setup()
    require("mason-lspconfig").setup{
        ensure_installed = { "clangd" }
    }
EOF
endif

if 1
    " This should be called after mason.nvim
    Plug 'neovim/nvim-lspconfig'
:lua << EOF
        local lspconfig = require("lspconfig")

        lspconfig.clangd.setup {
          lsp_on_attach = function(client, bufnr)
          end,
        }
EOF
endif

if 0
    Plug 'universal-ctags/ctags'
    set tags=tags;
endif

if 1
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
endif

if 0
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    " https://raw.githubusercontent.com/neoclide/coc.nvim/master/doc/coc-example-config.vim

    " Some servers have issues with backup files, see #649
    set nobackup
    set nowritebackup

    " Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
    " delays and poor user experience
    set updatetime=300

    " Always show the signcolumn, otherwise it would shift the text each time
    " diagnostics appear/become resolved
    set signcolumn=yes

    " Use tab for trigger completion with characters ahead and navigate
    " NOTE: There's always complete item selected by default, you may want to enable
    " no select by `"suggest.noselect": true` in your configuration file
    " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
    " other plugin before putting this into your config
    inoremap <silent><expr> <TAB>
          \ coc#pum#visible() ? coc#pum#next(1) :
          \ CheckBackspace() ? "\<Tab>" :
          \ coc#refresh()
    " Use s-tab to navigate backward
    inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

    " Make <CR> to accept selected completion item or notify coc.nvim to format
    " <C-g>u breaks current undo, please make your own choice
    inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                                  \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    function! CheckBackspace() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    " Use <c-space> to trigger completion
    if has('nvim')
      inoremap <silent><expr> <c-\> coc#refresh()
    else
      inoremap <silent><expr> <c-@> coc#refresh()
    endif

    " Use `[g` and `]g` to navigate diagnostics
    " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)

    " GoTo code navigation
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    " Use K to show documentation in preview window
    nnoremap <silent> K :call ShowDocumentation()<CR>

    function! ShowDocumentation()
      if CocAction('hasProvider', 'hover')
        call CocActionAsync('doHover')
      else
        call feedkeys('K', 'in')
      endif
    endfunction

    " Highlight the symbol and its references when holding the cursor
    autocmd CursorHold * silent call CocActionAsync('highlight')

    " Symbol renaming
    nmap <leader>rn <Plug>(coc-rename)

    " Formatting selected code
    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      " Setup formatexpr specified filetype(s)
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      " Update signature help on jump placeholder
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    " Applying code actions to the selected code block
    " Example: `<leader>aap` for current paragraph
    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    " Remap keys for applying code actions at the cursor position
    nmap <leader>ac  <Plug>(coc-codeaction-cursor)
    " Remap keys for apply code actions affect whole buffer
    nmap <leader>as  <Plug>(coc-codeaction-source)
    " Apply the most preferred quickfix action to fix diagnostic on the current line
    nmap <leader>qf  <Plug>(coc-fix-current)

    " Remap keys for applying refactor code actions
    nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
    xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
    nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)

    " Run the Code Lens action on the current line
    nmap <leader>cl  <Plug>(coc-codelens-action)

    " Map function and class text objects
    " NOTE: Requires 'textDocument.documentSymbol' support from the language server
    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    " Remap <C-f> and <C-b> to scroll float windows/popups
    if has('nvim-0.4.0') || has('patch-8.2.0750')
      nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
      inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
      inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
      vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif

    " Use CTRL-S for selections ranges
    " Requires 'textDocument/selectionRange' support of language server
    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    " Add `:Format` command to format current buffer
    command! -nargs=0 Format :call CocActionAsync('format')

    " Add `:Fold` command to fold current buffer
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)

    " Add `:OR` command for organize imports of the current buffer
    command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')

    " Add (Neo)Vim's native statusline support
    " NOTE: Please see `:h coc-status` for integrations with external plugins that
    " provide custom statusline: lightline.vim, vim-airline
    set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

    " Mappings for CoCList
    " Show all diagnostics
    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    " Manage extensions
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    " Show commands
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    " Find symbol of current document
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    " Search workspace symbols
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    " Do default action for next item
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    " Do default action for previous item
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    " Resume latest coc list
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

endif

"""""""""""""""""""""""""""""""""""""""FZF""""""""""""""""""""""""""""""""""""
Plug 'junegunn/fzf.vim'
nnoremap <leader>f :Ag<CR>
nnoremap <leader>F :Files<CR>


""""""""""""""""""""""""""""""""""""VIM-FLUTTER"""""""""""""""""""""""""""""""""
if 0
    Plug 'thosakwe/vim-flutter'
    let g:hot_reload_on_save=0
endif


""""""""""""""""""""""""""""""""""""COLORIZER"""""""""""""""""""""""""""""""""
if 0
    Plug 'lilydjwg/colorizer'
    let g:colorizer_auto_color = 1
endif

""""""""""""""""""""""""""""""""""""NERD TREE"""""""""""""""""""""""""""""""""
Plug 'scrooloose/nerdtree'
autocmd VimEnter * NERDTree     " Open NERDTree automatically
autocmd VimEnter * wincmd p     " Focus on main window
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
let NERDTreeIgnore=['\.pyc$', '\~$', '\.lo$', '\.o$'] "ignore files in NERDTree
let g:NERDTreeMouseMode=3       " Single click open folder
let NERDTreeShowBookmarks=1             " NERDTree bookmarks


"""""""""""""""""""""""""""""""""""""""""""""""""""FUGITIVE"""""""""""""""""""""""""""""""""
if 0
    Plug 'tpope/vim-fugitive'
    nnoremap <leader>gd :Gvdiff<CR>
    nnoremap gdh :diffget //2<CR>
    nnoremap gdl :diffget //3<CR>
endif

"""""""""""""""""""""""""""""""""""VIMTEX"""""""""""""""""""""""""""""""""
if 0
    Plug 'lervag/vimtex', { 'for': 'tex' }
    let g:livepreview_previewer = $READER
    let g:tex_flavor = "tex"

    let g:tex_flavor='latex'
    let g:vimtex_view_method='zathura'
    let g:vimtex_quickfix_mode=0
endif

"""""""""""""""""""""""""""""""""""VIM-LATEX-LIVE-PREVIEW"""""""""""""""""""""""""""""""""
if 0
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex' }

    let g:livepreview_previewer = 'zathura'
    let g:updatetime = 1000
endif

"""""""""""""""""""""""""""""""""""ULTISNIPS"""""""""""""""""""""""""""""""""
if 0
    Plug 'SirVer/ultisnips'
    let g:UltiSnipsExpandTrigger = '<tab>'
    let g:UltiSnipsJumpForwardTrigger = '<tab>'
    let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

    " Refresh/Reload UltiSnip snippets
    nmap <leader>uR :call UltiSnips#RefreshSnippets()<CR>
endif

""""""""""""""""""""""""TEX-CONCEAL""""""""""""""""'
if 0
    Plug 'KeitaNakamura/tex-conceal.vim', { 'for': 'tex' }
    set conceallevel=2
    let g:tex_conceal="abdgms"
endif


""""""""""""""""""""""""CTRL-P""""""""""""""""'
"Ignore files in .gitignore
if 0
    Plug 'ctrlpvim/ctrlp.vim'
    Plug 'tacahiroy/ctrlp-funky'
    let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

    " Ctrl-p funky extension
    nnoremap <Leader>pu :CtrlPFunky<Cr>

    " narrow the list down with a word under cursor
    nnoremap <Leader>uu :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
endif


""""""""""""""""""""""SYNTASTIC"""""""""""""""""''
if 0
    Plug 'vim-syntastic/syntastic'
    " let g:syntastic_java_checkers = ['checkstyle']
    " let g:syntastic_java_checkstyle_classpath = '$HOME/documents/clones/checkstyle/checkstyle-8.39-all.jar'
    " let g:syntastic_java_checkstyle_conf_file = '$HOME/documents/clones/checkstyle/checkstyle.xml'
    "set statusline+=%#warningmsg#
    "set statusline+=%{SyntasticStatuslineFlag()}
    set statusline+=%*
    let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }

    let g:syntastic_always_populate_loc_list = 1
    let g:syntastic_auto_loc_list = 1
    let g:syntastic_check_on_open = 0
    let g:syntastic_check_on_wq = 0

    "Syntastic syntax check
    nmap <leader>C :SyntasticCheck<CR>
endif

call plug#end()


