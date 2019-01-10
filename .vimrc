" BEGIN PLUGIN CONFIG -------------------------------------------

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

" add vim.surround plugin for better html tag editing
Plug 'tpope/vim-surround'

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
let g:lightline = {'colorscheme': 'jellybeans'}

" activate builtin macro for jumping between html open/close tags
runtime macros/matchit.vim

" END PLUGIN CONFIG ---------------------------------------------

" BEGIN RACKET DEFAULTS -----------------------------------------

" syntax highlighting and auto filetype detection on
syntax on filetype on filetype indent on filetype plugin on

" make tab key produce 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" END RACKET DEFAULTS -------------------------------------------

" use vim as the pager within vim
let $PAGER=''

" allow yank and delete to use the system clipboard
set clipboard=unnamed

" turn on line numbers
set number

" display a confirmation message when yanking or deleting any number of lines
set report=0

" set maximum line length to 80 characters
set textwidth=80

" add t to formatoptions
set fo+=t

" map control o to toggle open/closed NERDTree
nnoremap <C-o> :NERDTreeToggle<CR>

" map enter for easy newline insertion without entering insert mode
nnoremap <Enter> o<ESC>

" map Terminal.app's weird fn + enter keycode for the same purpose above cursor
nnoremap OM  O<ESC>

" define a command for putting every HTML tag on its own line
command! -bar TagLine %s/<[^>]*>/\r&\r/g | g/^\s*$/d
" [0-9A-Za-z_]\@<!<\/[^>]*>

" define a command to auto-indent the entire file
command! -bar ReIndent exe "norm gg=G''"

" define a command for enforcing line lengths by first appending a series of
" characters to each line, then removing that series of characters
" note: if adding another command after the last one here, use <bar> instead of
" regular | or everything breaks
command! -bar ForceLen g/\%>79v/execute "norm A\~\#\*" | %s/\~\#\*/

" define a command to put every line in the file on the same line
command! -bar JoinAll g/$/join

" define a command to put everything in the document on one line and then force
" the length to the max character limit
command! -bar Justify JoinAll | ForceLen

" define a command to run several formatting commands on an HTML file
command! -bar FormatHTML TagLine | ReIndent | ForceLen

" define a command to allow auto-alphabetizing of CSS properties
command! -bar SortCSS g#\({\n\)\@<=#.,/}/sort
