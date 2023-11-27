" We take care to preserve the user's fileencodings and fileformats,
" because those settings are global (not buffer local), yet we want
" to override them for loading Lox files, which should be UTF-8.
let s:current_fileformats = ''
let s:current_fileencodings = ''

" define fileencodings to open as utf-8 encoding even if it's ascii.
function! s:loxfiletype_pre()
  let s:current_fileformats = &g:fileformats
  let s:current_fileencodings = &g:fileencodings
  set fileencodings=utf-8 fileformats=unix
  setlocal filetype=lox tabstop=2 shiftwidth=2 expandtab
endfunction

" restore fileencodings as others
function! s:loxfiletype_post()
  let &g:fileformats = s:current_fileformats
  let &g:fileencodings = s:current_fileencodings
endfunction

au BufNewFile *.lox setlocal filetype=lox fileencoding=utf-8 fileformat=unix tabstop=2 shiftwidth=2 expandtab
au BufRead *.lox call s:loxfiletype_pre()
au BufReadPost *.lox call s:loxfiletype_post()
