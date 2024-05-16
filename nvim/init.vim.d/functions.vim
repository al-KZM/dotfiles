function! PrettyJson()
    execute "%!python -m json.tool"
endfunction

function! s:get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction

function! Strip(input_string)
    return substitute(a:input_string, '^\s*\(.\{-}\)\s*$', '\1', '')
endfunction

function PythonExecLine()
    let selection = s:get_visual_selection()
    let python_cmd = "python -c 'print(" . selection . ")'"
    let bash_output = system(l:python_cmd)
    let [line_start, col_start] = getpos("'<")[1:2]
    let [line_end, col_end] = getpos("'>")[1:2]
    let l:line_start = l:line_start - 1
    let l:col_start = l:col_start - 1
    let l:col_end = l:col_end + 2
    execute "normal! Ax"
    execute "normal! gg" . l:line_start . "j" . l:col_start . "l"
    execute "normal! d" . l:col_end . "|"
    execute "normal! i" . l:bash_output
    execute "normal! kJ"
    execute "normal! $x"
endfunction

function PythonRunfile()
    execute "!python %"
endfunction

function PythonExec()
    execute "normal! $A'I'Ipython -c "
    execute ". !sh"
endfunction

" Remove trailing spaces except if dont_strip_trailing_spaces exists
function! StripTrailingWhitespaces()
    if !exists('b:dont_strip_trailing_spaces')
        %s/\s\+$//e
    endif
endfun

function! SpellCheckCurrent()
  setlocal spell
  normal z=
  setlocal nospell
endfunction

function! DisplayImage(path)
    execute "silent !feh -x " . a:path " &"
endfunction

func! ToggleHebrew()
  if &rl
    set norl
    set keymap=
  else
    set rl
    set keymap=hebrew
  end
endfunc

func! MakeCjhebrew()
    normal! gv"hy
    let l:content=@h

    silent execute "badd cjhebrew_tmp"
    silent execute "buffer cjhebrew_tmp"
    silent execute "normal! i" . @h
    echo l:content
    write
    silent execute "normal ggjdG"
    let l:signs =  execute("!cat % | $CONFIG_DIR/scripts/make_cjhebrew.py")
    execute "bw! cjhebrew_tmp"
    echo l:signs
    execute "normal! i" . l:signs
    let @h=""
endfunc

func! JsonFormat()
    silent execute "%!python -m json.tool"
endfunc


map <F6> :call MakeCjhebrew()<CR>

