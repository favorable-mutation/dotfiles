" use vim-plug to install plugins
call plug#begin('~/.vim/plugged')

" add snow theme plugin
Plug 'nightsense/snow'

" add emmet plugin for HTML expansions
Plug 'mattn/emmet-vim'

" add lightline plugin
Plug 'itchyny/lightline.vim'

" add NERDTree plugin for project structure viewing
Plug 'scrooloose/nerdtree'

" end vim-plug call
call plug#end()

" set colorscheme from snow plugin
colorscheme snow

" set background for snow theme to dark
set background=dark

" remind vim to use the lightline plugin
set laststatus=2

" don't display mode below lightline in original mode display location
set noshowmode

" set the lightline colorscheme
let g:lightline = {
    \ 'colorscheme': 'jellybeans',
    \ }

" map control o to open NERDTree
map <C-o> :NERDTreeToggle<CR>

" use vim as the pager within vim
let $PAGER=''

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

" defaults recommended for Racket - one of these settings makes sure 
" that auto-indented newlines will use spaces, not tabs

" syntax highlighting on
syntax on
filetype on
filetype indent on
filetype plugin on

" make tab key produce 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab
