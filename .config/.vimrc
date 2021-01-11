"------- Plugins --------

call plug#begin('~/.vim/plugged')

" lint files asynchronously while editing
Plug 'w0rp/ale'

" fuzzy finder
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" autocompletion
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }

" c# lsp
Plug 'OmniSharp/omnisharp-vim'

" read generalized config file across editors
Plug 'editorconfig/editorconfig-vim'

" git integration
Plug 'tpope/vim-fugitive'

" status bar
Plug 'itchyny/lightline.vim'

" ale reporting in status bar
Plug 'maximbaz/lightline-ale'

" tabs for status bar
Plug 'mengelbrecht/lightline-bufferline'

" file structure viewer
Plug 'scrooloose/nerdtree'

" ANSI colorscheme
Plug 'jeffkreeftmeijer/vim-dim'

" general syntax
Plug 'sheerun/vim-polyglot'

" enclose things in parens or HTML tags
Plug 'tpope/vim-surround'

" extended bracket shortcuts
Plug 'tpope/vim-unimpaired'

" gr-ip it and rip it (and replace with contents of register)
Plug 'vim-scripts/ReplaceWithRegister'

call plug#end()

" remind vim to use the lightline plugin
set laststatus=2

" don't display mode below lightline in original mode display location
set noshowmode

" show the tabline always
set showtabline=2

" add in lightline fugitive integration
let g:lightline = {
      \   'tabline': {
      \     'left': [ [ 'buffers' ] ],
      \     },
      \   'active': {
      \     'left': [
      \       [ 'mode', 'paste' ],
      \       [ 'gitbranch', 'readonly', 'filename', 'modified' ],
      \       [ 'linter_checking',
      \         'linter_errors',
      \         'linter_warnings',
      \         'linter_infos',
      \         'linter_ok'
      \       ]
      \     ]
      \   },
      \   'component_function': {
      \     'gitbranch': 'fugitive#head',
      \   },
      \   'component_expand': {
      \     'buffers': 'lightline#bufferline#buffers',
      \     'linter_checking': 'lightline#ale#checking',
      \     'linter_infos': 'lightline#ale#infos',
      \     'linter_warnings': 'lightline#ale#warnings',
      \     'linter_errors': 'lightline#ale#errors',
      \     'linter_ok': 'lightline#ale#ok',
      \   },
      \   'component_type': {
      \     'buffers': 'tabsel',
      \     'linter_checking': 'right',
      \     'linter_infos': 'right',
      \     'linter_warnings': 'warning',
      \     'linter_errors': 'error',
      \     'linter_ok': 'right',
      \   }
      \ }

" add in buffer list with plugin's 'default' config
let g:lightline#bufferline#show_number = 1

let g:lightline#bufferline#shorten_path = 0

let g:lightline#bufferline#filename_modifier = ':t'

let g:lightline#bufferline#unnamed = '[No Name]'

" activate builtin macro for jumping between html open/close tags
runtime macros/matchit.vim

" get rid of folding in markdown files
let g:vim_markdown_folding_disabled = 1

" add shell = sh for code blocks
let g:vim_markdown_fenced_languages = ['shell=sh']

" load all syntax files in `runtimepath`
let g:vim_vue_plugin_load_full_syntax = 1
let g:vim_vue_plugin_use_sass = 1

" define linters
let g:ale_fixers = {
      \   '*': ['remove_trailing_lines', 'trim_whitespace'],
      \   'cs': ['OmniSharp'],
      \   'html': ['prettier', 'eslint'],
      \   'javascript': ['prettier', 'eslint'],
      \   'python': ['black', 'isort'],
      \   'vue': ['prettier', 'eslint'],
      \ }

" lint on save
let g:ale_fix_on_save = 1

" ale autocompletion
let g:ale_completion_enabled = 1
" set omnifunc=ale#completion#OmniFunc
let g:ale_completion_autoimport = 1
" set completeopt=menu,menuone,preview,noselect,noinsert

" that popup is hella distracting, just leave it there
let g:ale_sign_column_always = 1

" fun error symbols
let g:ale_sign_error = '!-'
let g:ale_sign_warning = '?-'

" enable deoplete
" let g:deoplete#enable_at_startup = 1

" use ale as a completion source for deoplete
" call deoplete#custom#option('sources', {
"             \ '_': ['ale']
"             \})

" use stdio lsp for omnisharp
let g:OmniSharp_server_stdio = 1

" assumes .NET framework is installed on the Windows host
let g:OmniSharp_translate_cygwin_wsl = 1


"------- Visual Settings --------

" set colorscheme from colorschemes plugin
colorscheme dim

" set background for theme to dark
set background=dark

" set the lightline colorscheme
let g:lightline.colorscheme = 'jellybeans'

" syntax highlighting and auto filetype detection on
syntax on filetype on filetype indent on filetype plugin on

" ale highlight colors (need to be after colorscheme loads, incl. after
" 'syntax on')
highlight SpellBad ctermbg=DarkGrey
highlight SpellCap ctermbg=DarkGrey

" no search highlighting, plz
set nohlsearch

" turn on line numbers
set number

" display a confirmation message when yanking or deleting any number of lines
set report=0

" this is from the kitty FAQ to avoid weird background color issues
let &t_ut=''

" hide redundant filename on open
set shortmess+=F

" .env* files should generally have sh syntax
augroup env_syntax
  autocmd BufNewFile,BufRead *env* set syntax=sh
augroup END

" sometimes, _ separates words
augroup py_keyword
  autocmd BufNewFile,BufRead *.py setlocal iskeyword-=_
augroup END

" highlight comments in jsonc files
augroup json_comments
  autocmd FileType json syntax match Comment +\/\/.\+$+
augroup END

" Help Vim recognize *.sbt and *.sc as Scala files
augroup scala_build_syntax
  au BufRead,BufNewFile *.sbt,*.sc set filetype=scala
augroup END

"------- Editor Behavior --------

" make tab key produce 4 spaces
set tabstop=8 softtabstop=0 expandtab shiftwidth=4 smarttab

" if file changes (aside from deletion) outside of vim and no local changes
" exist in the buffer, auto-reload it
set autoread

" no case sensitivity
set ignorecase
set smartcase

" allow yank and delete to use the system clipboard
set clipboard=unnamedplus

" auto-wrap based on text width
set formatoptions+=t


"------- Keybinds --------

" lead me into space
let mapleader=' '

" map to toggle open/closed NERDTree
nnoremap <Leader>o :NERDTreeToggle<CR>

" make him just a *bit* smaller
let g:NERDTreeWinSize=20

" window management should be easier
nnoremap <Leader>wh :winc h<CR>
nnoremap <Leader>wj :winc j<CR>
nnoremap <Leader>wk :winc k<CR>
nnoremap <Leader>wl :winc l<CR>

nnoremap <Leader>wH :winc H<CR>
nnoremap <Leader>wJ :winc J<CR>
nnoremap <Leader>wK :winc K<CR>
nnoremap <Leader>wL :winc L<CR>

nnoremap <Leader>ws :winc s<CR>
nnoremap <Leader>wv :winc v<CR>

nnoremap <Leader>w- :winc -<CR>
nnoremap <Leader>w_ :winc _<CR>
nnoremap <Leader>w= :winc =<CR>
nnoremap <Leader>w+ :winc +<CR>
nnoremap <Leader>w\| :winc \|<CR>

" on the lam w/ fugitive
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gc :Gcommit<CR>
nnoremap <Leader>gp :Gpush<CR>

" it's been a long day; I could use a good ALE
nnoremap <Leader>af :ALEFix<CR>
nnoremap <Leader>at :ALEToggle<CR>
nnoremap <Leader>ag :ALEGoToDefinition<CR>
nnoremap <Leader>an :ALENext<CR>
nnoremap <Leader>ap :ALEPrevious<CR>

" enter should mean a newline, goddamnit
nnoremap <CR> i<CR><ESC>

" getting real tired of pressing shift
nnoremap ; :
nnoremap : ;


"------- Custom Commands --------

" define a command to allow auto-alphabetizing of CSS properties
command! -bar SortCSS g#\({\n\)\@<=#.,/}/sort
