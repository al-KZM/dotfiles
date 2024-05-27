" Define all the filetypes

" Jinja
au BufNewFile,BufRead *.html,*.htm,*.jin,*.jinja2 set ft=jinja

" Unity
au BufRead,BufNewFile *.cs  set filetype=cs.unity

" Python
au BufNewFile,BufRead *.py set ft=python

" Dart
au BufNewFile,BufRead *.dart set ft=dart

au BufRead,BufNewFile *.xml set ft=xml

au BufRead,BufNewFile *.c,*.h set ft=c
au BufRead,BufNewFile *.cpp,*.h set ft=cpp

au BufRead,BufNewFile *.tex set ft=tex

let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
autocmd BufRead,BufNewFile /tmp/calcurse*,~/.calcurse/notes/* set filetype=markdown
autocmd BufRead,BufNewFile *.ms,*.me,*.mom,*.man set filetype=groff

"Java
au BufNewFile,BufRead *.java set ft=java
