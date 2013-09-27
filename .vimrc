"
" .vimrc by jdsn (jdsn.de)
"
syntax on
" tabstop width
set tabstop=4
" sw = shift width
set sw=4
" expand tabs to spaces
set expandtab
" allow backspace
set bs=2

" dark background
set bg=dark

" set color of comment to grey to be able to read it on black terminals
" hi Comment ctermfg=grey cterm=none
hi Comment ctermfg=gray

" For IRB interactive editor
if has("autocmd")
  " Enable filetype detection
  " filetype plugin indent on

  " Restore cursor position
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif
endif

" highlight trailing whitespaces (except when typing) and spaces before before tabs
highlight ExtraWhitespace ctermbg=red guibg=red
"autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
"match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$\| \+\ze\t/
autocmd BufWinLeave * call clearmatches()

:nnoremap X :w<Enter>:!ruby -wc %<Enter>
:nnoremap Y :w<Enter>:!make<Enter>
