let b:dont_strip_trailing_spaces=1
set sw=2
set spell
set spelllang+=fr
hi clear SpellBad
hi SpellBad cterm=underline

" TIP: if you write your \label's as \label{fig:something}, then if you
" type in \ref{fig: and press <C-n> you will automatically cycle through
" all the figure labels. Very useful!
set iskeyword+=:

map <F8> :call DisplayImage("~/documents/documentations/cjhebrew/letters.png")<CR>
map <F2> :LLPStartPreview<CR>


nmap ,c :VimtexTocToggle<CR>
nmap ,lc :VimtexClean!<CR>

func! CopyLastElemStep()
    execute "normal! V?eliminationstep<CR>y<C-o>p"
endfunction


