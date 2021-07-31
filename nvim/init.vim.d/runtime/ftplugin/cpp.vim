
"""TODO:
"Install CScope

""" Editor options
set noexpandtab
set colorcolumn=110
highlight ColorColumn ctermbg=darkgray
"Vim has a gf command (and related, <C-W><C-F> to open in new tab) which open file whose name is under or after the cursor. This feature is extremely useful for browsing header files.
let &path.="src/include,/usr/include/AL,"

""" Compiler options
function Cout()
	execute "normal!
endfunction
