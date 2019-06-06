" BEGIN PLUGIN CONFIG -------------------------------------------

" use vim-plug to install plugins
call plug#begin('~/.vim/plugged')

" add snow theme plugin
Plug 'nightsense/snow'

" add gruvbox theme plugin
Plug 'morhetz/gruvbox'

" add emmet plugin for HTML expansions
Plug 'mattn/emmet-vim'

" add lightline plugin
Plug 'itchyny/lightline.vim'

" add NERDTree plugin for project structure viewing
Plug 'scrooloose/nerdtree'

" add vim.surround plugin for better html tag editing
Plug 'tpope/vim-surround'

" add autoformat plugin
Plug 'Chiel92/vim-autoformat'

" add tabular plugin
Plug 'godlygeek/tabular'

" add vim-markdown plugin
Plug 'plasticboy/vim-markdown'

" add the fugitive git integration plugin
Plug 'tpope/vim-fugitive'

" add lightline buffer list plugin
Plug 'mengelbrecht/lightline-bufferline'

" end vim-plug call
call plug#end()

" set colorscheme from snow plugin
colorscheme gruvbox

" set background for snow theme to dark
set background=dark

" remind vim to use the lightline plugin
set laststatus=2

" don't display mode below lightline in original mode display location
set noshowmode

" show the tabline always
set showtabline=2

" initialize lightline config
let g:lightline = {}

" set the lightline colorscheme
let g:lightline.colorscheme = 'seoul256'

" add in lightline fugitive integration
let g:lightline.active = {
            \ 'left': [ [ 'mode', 'paste' ],
            \           [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
            \ }

let g:lightline.component_function = {
            \ 'gitbranch': 'fugitive#head',
            \ }

" add in buffer list with plugin's 'default' config

let g:lightline#bufferline#show_number = 1

let g:lightline#bufferline#shorten_path = 0

let g:lightline#bufferline#filename_modifier = ':t'

let g:lightline#bufferline#unnamed = '[No Name]'

let g:lightline.tabline = {
            \ 'left': [ [ 'buffers' ] ],
            \ 'right': [ [ 'close' ] ],
            \ }

let g:lightline.component_expand = {
            \ 'buffers': 'lightline#bufferline#buffers',
            \ }

let g:lightline.component_type = {
            \ 'buffers': 'tabsel',
            \ }

" activate builtin macro for jumping between html open/close tags
runtime macros/matchit.vim

" verbose autoformat mode
let g:autoformat_verbosemode=1

" END PLUGIN CONFIG ---------------------------------------------

" BEGIN RACKET DEFAULTS -----------------------------------------

" syntax highlighting and auto filetype detection on
syntax on filetype on filetype indent on filetype plugin on

" make tab key produce 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" END RACKET DEFAULTS -------------------------------------------

" if file changes (aside from deletion) outside of vim and no local changes
" exist in the buffer, auto-reload it
set autoread

" get rid of folding
let g:vim_markdown_folding_disabled = 1

" add shell = sh for code blocks
let g:vim_markdown_fenced_languages = ['shell=sh']

" this is from the kitty FAQ to avoid weird background color issues
let &t_ut=''

" fun gui options for macvim
if has('gui_running')

    " macvim font shenanigans
    set guifont=Hack:h16

    " get rid of those gui tabs (macvim)
    set guioptions-=e

    " macvim color shenanigans
    let g:terminal_ansi_colors = [
                \ '#282828','#CC241D','#50971A','#D79921','#458588','#B16286',
                \ '#689D6A','#A89984','#928374','#FB4934','#B8BB26','#FABD2F',
                \ '#83A598', '#D3869B','#8EC07C','#EBDBB2'
                \ ]

endif


" no case sensitivity
set ignorecase

" no search highlighting, plz
set nohlsearch

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

" hide redundant filename on open
set shortmess=F

" map control o to toggle open/closed NERDTree
nnoremap <C-o> :NERDTreeToggle<CR>

" map enter for easy newline insertion without entering insert mode
" nnoremap <Enter> o<ESC>

" who needs tag stacks anyway? let's make it a terminal window
nnoremap <C-t> :terminal<CR>

" getting real tired of pressing shift
nnoremap ; :
nnoremap : ;
inoremap 1 !
inoremap ! 1
inoremap 2 @
inoremap @ 2
inoremap 3 #
inoremap # 3
inoremap 4 $
inoremap $ 4
inoremap 5 %
inoremap % 5
inoremap 6 ^
inoremap ^ 6
inoremap 7 &
inoremap & 7
inoremap 8 *
inoremap * 8
inoremap 9 (
inoremap ( 9
inoremap 0 )
inoremap ) 0

" make z a leader key for vim wm commands
"nnoremap z <C-w>

" map Terminal.app's weird fn + enter keycode for the same purpose above cursor
" nnoremap OM  O<ESC>

" nnoremap <C-i> :Autoformat<CR>

" pls get me tf out of this built-in terminal
tnoremap <ESC> <C-\><C-n>

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
