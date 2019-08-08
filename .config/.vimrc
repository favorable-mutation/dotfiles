"------- Install Plugins --------

" use vim-plug to install plugins
call plug#begin('~/.vim/plugged')

" add colorschemes plugin
Plug 'flazz/vim-colorschemes'

" add emmet plugin for HTML expansions
Plug 'mattn/emmet-vim'

" add lightline plugin
Plug 'itchyny/lightline.vim'

" add NERDTree plugin for project structure viewing
Plug 'scrooloose/nerdtree'

" add vim.surround plugin for better html tag editing
Plug 'tpope/vim-surround'

" add autoformatting plugin
Plug 'Chiel92/vim-autoformat'

" add tabular plugin
Plug 'godlygeek/tabular'

" add vim-markdown plugin
Plug 'plasticboy/vim-markdown'

" add the fugitive git integration plugin
Plug 'tpope/vim-fugitive'

" add lightline buffer list plugin
Plug 'mengelbrecht/lightline-bufferline'

" script editing with fountain
Plug 'vim-scripts/fountain.vim'

" coffeescript support
Plug 'kchmck/vim-coffee-script'

" fuzzy search, uses Tags
Plug 'junegunn/fzf.vim'

" async lint
Plug 'w0rp/ale'

" run unit tests
Plug 'janko-m/vim-test'

" per directory vimrc
Plug 'embear/vim-localvimrc'

" end vim-plug call
call plug#end()


"------- Configure Plugins --------

" remind vim to use the lightline plugin
set laststatus=2

" don't display mode below lightline in original mode display location
set noshowmode

" show the tabline always
set showtabline=2

" initialize lightline config
let g:lightline = {}

" set the lightline colorscheme
let g:lightline.colorscheme = 'one'

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

" we don't like yapf or autopep8 :(
let g:formatters_python = ['black']

" turn off autoformat's use of vim's default formatting; black takes care of
" all that anyway
let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" format code with black automatically when writing a .py file
augroup autoformat_settings
    autocmd BufWritePre *.py Autoformat
augroup END


"------- Visual Settings --------

" set colorscheme from colorschemes plugin
colorscheme base16-railscasts

" set background for snow theme to dark
set background=dark

" syntax highlighting and auto filetype detection on
syntax on filetype on filetype indent on filetype plugin on

" fun gui options for macvim
if has('gui_running')

    " macvim font shenanigans
    set guifont=Hack:h16

    " get rid of those gui tabs (macvim)
    set guioptions-=e

    " macvim color shenanigans
    let g:terminal_ansi_colors = [
                \ "#2b2b2b",
                \ "#da4939",
                \ "#a5c261",
                \ "#ffc66d",
                \ "#6d9cbe",
                \ "#b6b3eb",
                \ "#519f50",
                \ "#e6e1dc",
                \ "#5a647e",
                \ "#da4939",
                \ "#a5c261",
                \ "#ffc66d",
                \ "#6d9cbe",
                \ "#b6b3eb",
                \ "#519f50",
                \ "#f9f7f3"
                \ ]

endif

" no search highlighting, plz
set nohlsearch

" turn on line numbers
set number

" display a confirmation message when yanking or deleting any number of lines
set report=0

" set maximum line length to 99 characters
set textwidth=99

" this is from the kitty FAQ to avoid weird background color issues
let &t_ut=''

" differentiate cw and cW for variable names in python with underscores
set iskeyword-=_

" hide redundant filename on open
set shortmess=F

" .env* files should generally have sh syntax
autocmd BufNewFile,BufRead *env* set syntax=sh


"------- Editor Behavior --------

" make tab key produce 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" if file changes (aside from deletion) outside of vim and no local changes
" exist in the buffer, auto-reload it
set autoread

" get rid of folding in markdown files
let g:vim_markdown_folding_disabled = 1

" add shell = sh for code blocks
let g:vim_markdown_fenced_languages = ['shell=sh']

" no case sensitivity
set ignorecase

" allow yank and delete to use the system clipboard
set clipboard=unnamed

" auto-wrap based on text width
set fo+=t


"------- Keybinds --------

" map control o to toggle open/closed NERDTree
nnoremap <C-o> :NERDTreeToggle<CR>

" who needs tag stacks anyway? let's make it a terminal window
nnoremap <C-t> :terminal<CR>

" lead me into space
let mapleader=" "

" window management should be easier

nnoremap <Leader>h :winc h<CR>
nnoremap <Leader>j :winc j<CR>
nnoremap <Leader>k :winc k<CR>
nnoremap <Leader>l :winc l<CR>

nnoremap <Leader>H :winc H<CR>
nnoremap <Leader>J :winc J<CR>
nnoremap <Leader>K :winc K<CR>
nnoremap <Leader>L :winc L<CR>

nnoremap <Leader>s :winc s<CR>
nnoremap <Leader>v :winc v<CR>

nnoremap <Leader>- :winc -<CR>
nnoremap <Leader>_ :winc _<CR>
nnoremap <Leader>= :winc =<CR>
nnoremap <Leader>+ :winc +<CR>
nnoremap <Leader>\| :winc \|<CR>

" getting real tired of pressing shift

nnoremap ; :
inoremap 1 !
inoremap 2 @
inoremap 3 #
inoremap 4 $
inoremap 5 %
inoremap 6 ^
inoremap 7 &
inoremap 8 *
inoremap 9 (
inoremap 0 )

nnoremap : ;
inoremap ! 1
inoremap @ 2
inoremap # 3
inoremap $ 4
inoremap % 5
inoremap ^ 6
inoremap & 7
inoremap * 8
inoremap ( 9
inoremap ) 0

" pls get me tf out of this built-in terminal
nnoremap <C-e> a
tnoremap <C-e> <C-\><C-n>


"------- Custom Commands --------

" define a command to allow auto-alphabetizing of CSS properties
command! -bar SortCSS g#\({\n\)\@<=#.,/}/sort
