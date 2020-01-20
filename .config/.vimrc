"------- Plugins --------

call plug#begin('~/.vim/plugged')


"------- Meta --------

" lint files asynchronously while editing
Plug 'w0rp/ale'

" read generalized config file across editors
Plug 'editorconfig/editorconfig-vim'

" git integration
Plug 'tpope/vim-fugitive'

" status bar
Plug 'itchyny/lightline.vim'

" tabs for status bar
Plug 'mengelbrecht/lightline-bufferline'

" file structure viewer
Plug 'scrooloose/nerdtree'

" documentation browser
Plug 'rhysd/devdocs.vim'


"------- Theming --------

" ANSI colorscheme
Plug 'jeffkreeftmeijer/vim-dim'

"------- Language Support --------

" syntax & indentation for CoffeeScript
Plug 'kchmck/vim-coffee-script'

" autoexpand HTML boilerplate
Plug 'mattn/emmet-vim'

" syntax for Fountain
Plug 'vim-scripts/fountain.vim'

" syntax & indentation for Markdown
Plug 'plasticboy/vim-markdown'

" syntax & indentation for Vue
Plug 'leafOfTree/vim-vue-plugin'


"------- Navigation --------

" enclose things in parens or HTML tags
Plug 'tpope/vim-surround'

" extended bracket shortcuts
Plug 'tpope/vim-unimpaired'

"------- Not Configured -------

" Plug 'junegunn/fzf.vim'
" Plug 'godlygeek/tabular'
" Plug 'Chiel92/vim-autoformat'
" Plug 'janko-m/vim-test'
" Plug 'embear/vim-localvimrc'


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
" let g:formatters_python = ['black']

" turn off autoformat's use of vim's default formatting; black takes care of
" all that anyway
" let g:autoformat_autoindent = 0
" let g:autoformat_retab = 0
" let g:autoformat_remove_trailing_spaces = 0

" format code with black and isort automatically when writing a .py file
" augroup autoformat_settings
"     autocmd BufWritePre *.py Autoformat
" augroup END

" get rid of folding in markdown files
let g:vim_markdown_folding_disabled = 1

" add shell = sh for code blocks
let g:vim_markdown_fenced_languages = ['shell=sh']

" load all syntax files in `runtimepath`
let g:vim_vue_plugin_load_full_syntax = 1
let g:vim_vue_plugin_use_sass = 1

" define linters
let g:ale_fixers = {
            \ 'python': ['black', 'isort'],
            \ 'javascript': ['eslint'],
            \ }

" 'vue': ['vls'],

" eslint for Vue files
" let g:ale_linter_aliases = {
"             \ 'vue': ['javascript', 'vue']
"             \ }

" eslint can see Vue files now!
" let g:ale_javascript_eslint_options = '--ext .js,.vue'

" lint on save
let g:ale_fix_on_save = 1

" that popup is hella distracting, just leave it there
let g:ale_sign_column_always = 1

" fun error symbols
let g:ale_sign_error = "!-"
let g:ale_sign_warning = "?-"

" search devdocs when in filetypes where `man`/vim docs are useless
let ignored = ['bash', 'c', 'perl', 'sh', 'vim', 'zsh']
augroup plugin-devdocs
    if index(ignored, &filetype) < 0
        autocmd!
        autocmd FileType nmap <buffer>K <Plug>(devdocs-under-cursor)
    endif
augroup END

" specify documentation specific to filetype
"let g:devdocs_filetype_map = {
"            \ 'python':
"}

"------- Visual Settings --------

" set colorscheme from colorschemes plugin
colorscheme dim

" set background for theme to dark
set background=dark

" set the lightline colorscheme
let g:lightline.colorscheme = 'jellybeans'

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

" set maximum line length to 80 characters
set textwidth=80

" this is from the kitty FAQ to avoid weird background color issues
let &t_ut=''

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

" no case sensitivity
set ignorecase

" allow yank and delete to use the system clipboard
set clipboard=unnamed

" auto-wrap based on text width
set fo+=t


"------- Keybinds --------

" lead me into space
let mapleader=" "

" map to toggle open/closed NERDTree
nnoremap <Leader>o :NERDTreeToggle<CR>

" terminal window
nnoremap <Leader>t :terminal<CR>

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

" on the lam w/ fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gp :Gpush<CR>

" it's been a long day; I could use a good ALE
nnoremap <Leader>af :ALEFix<CR>
nnoremap <Leader>ag :ALEGoToDefinition<CR>
nnoremap <Leader>a_ :ALE_<CR>
nnoremap <Leader>a_ :ALE_<CR>
nnoremap <Leader>a_ :ALE_<CR>

" enter should mean a newline, goddamnit
nnoremap <CR> i<CR><ESC>

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
