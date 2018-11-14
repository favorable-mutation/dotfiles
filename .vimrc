" add snow theme plugin and configure
call plug#begin('~/.vim/plugged')
Plug 'nightsense/snow'
call plug#end()

set background=dark
colorscheme snow

" defaults recommended for Racket until line 14 - one of these settings makes sure 
" that auto-indented newlines will use spaces, not tabs

" use vim as the pager within vim
let $PAGER=''

" syntax highlighting on
syntax on
filetype on
filetype indent on
filetype plugin on

" make tab key produce 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" allow yank and delete to use the system clipboard
set clipboard=unnamed

" turn on line numbers
set number

" display a confirmation message when yanking or deleting any number of lines
set report=0

" map enter for easy newline insertion without entering insert mode
nnoremap <Enter> o<ESC>

" map Terminal.app's weird fn + enter keycode for the same purpose above cursor
nnoremap OM  O<ESC>
