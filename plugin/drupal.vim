"Drupal settings
set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
let php_htmlInStrings = 1
let php_parent_error_open = 1

if has("autocmd")
 " Drupal *.module, *.install, *.php, *.inc, *.engine, *.profile, *.test files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.php set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.engine set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
  augroup END
endif
syntax on


" Highlight long comments and trailing whitespace.
highlight ExtraWhitespace ctermbg=red guibg=red
let a = matchadd('ExtraWhitespace', '\s\+$')
highlight OverLength ctermbg=red ctermfg=white guibg=red guifg=white
let b = matchadd('OverLength', '\(^\(\s\)\{-}\(*\|//\|/\*\)\{1}\(.\)*\(\%81v\)\)\@<=\(.\)\{1,}$')

" Enable NERDTree at startup.
autocmd VimEnter * NERDTree
" " Move focus to file itself.
autocmd VimEnter * wincmd p
" " Close if the last buffer.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

nnoremap <silent> <C-Right> <c-w>l
nnoremap <silent> <C-Left> <c-w>h
nnoremap <silent> <C-Up> <c-w>k
nnoremap <silent> <C-Down> <c-w>j

" Lookup the API docs for a drupal function under cursor.
nnoremap <Leader>da :execute "!open http://api.drupal.org/".shellescape(expand("<cword>"), 1)<CR>
" " Lookup the API docs for a drush function under cursor.
nnoremap <Leader>dda :execute "!open http://api.drush.ws/api/function/".shellescape(expand("<cword>"), 1)<CR>
" Get the value of the drupal variable under cursor.
nnoremap <Leader>dv :execute "!drush vget ".shellescape(expand("<cword>"), 1)<CR>
