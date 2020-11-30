"------- Plugins --------

call plug#begin('~/.vim/plugged')

" lint files asynchronously while editing
" Plug 'w0rp/ale'

" read generalized config file across editors
" Plug 'editorconfig/editorconfig-vim'

" git integration
Plug 'tpope/vim-fugitive'

" status bar
Plug 'itchyny/lightline.vim'

" tabs for status bar
Plug 'mengelbrecht/lightline-bufferline'

" file structure viewer
Plug 'scrooloose/nerdtree'

" documentation browser
" Plug 'rhysd/devdocs.vim'

" ANSI colorscheme
Plug 'jeffkreeftmeijer/vim-dim'

" autoexpand HTML boilerplate
" Plug 'mattn/emmet-vim'

" syntax for Fountain
" Plug 'vim-scripts/fountain.vim'

" general syntax
Plug 'sheerun/vim-polyglot'

" enclose things in parens or HTML tags
Plug 'tpope/vim-surround'

" extended bracket shortcuts
Plug 'tpope/vim-unimpaired'

" gr-ip it and rip it (and replace with contents of register)
Plug 'vim-scripts/ReplaceWithRegister'

" completion (recommended for metals)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" metals
Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

" remind vim to use the lightline plugin
set laststatus=2

" don't display mode below lightline in original mode display location
set noshowmode

" show the tabline always
set showtabline=2

" show coc status in lightline
" function! CocCurrentFunction()
"     return get(b:, 'coc_current_function', '')
" endfunction

" initialize lightline config
let g:lightline = {}

" add in lightline fugitive integration
" 'cocstatus', 'currentfunction',
let g:lightline.active = {
            \ 'left': [ [ 'mode', 'paste' ],
            \           [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
            \ }

" \ 'cocstatus': 'coc#status',
" \ 'currentfunction': 'CocCurrentFunction'
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
" let g:ale_fixers = {
"             \ 'html': ['prettier', 'eslint'],
"             \ 'javascript': ['prettier', 'eslint'],
"             \ 'python': ['black', 'isort'],
"             \ 'vue': ['prettier', 'eslint'],
"             \ }

" 'vue': ['vls'],

" eslint for Vue files
" let g:ale_linter_aliases = {
"             \ 'vue': ['javascript', 'vue']
"             \ }

" eslint can see Vue files now!
" let g:ale_javascript_eslint_options = '--ext .js,.vue'

" lint on save
" let g:ale_fix_on_save = 1

" that popup is hella distracting, just leave it there
" let g:ale_sign_column_always = 1

" fun error symbols
" let g:ale_sign_error = "!-"
" let g:ale_sign_warning = "?-"

" search devdocs when in filetypes where `man`/vim docs are useless
" let ignored = ['bash', 'c', 'perl', 'sh', 'vim', 'zsh']
" augroup plugin-devdocs
"     if index(ignored, &filetype) < 0
"         autocmd!
"         autocmd FileType nmap <buffer>K <Plug>(devdocs-under-cursor)
"     endif
" augroup END

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

" ale highlight colors (need to be after colorscheme loads, incl. after
" 'syntax on')
" highlight SpellBad ctermbg=DarkGrey
" highlight SpellCap ctermbg=DarkGrey

" fun gui options for macvim
" if has('gui_running')

    " macvim font shenanigans
"     set guifont=Hack:h16

    " get rid of those gui tabs (macvim)
"     set guioptions-=e

    " macvim color shenanigans
"     let g:terminal_ansi_colors = [
"                 \ "#2b2b2b",
"                 \ "#da4939",
"                 \ "#a5c261",
"                 \ "#ffc66d",
"                 \ "#6d9cbe",
"                 \ "#b6b3eb",
"                 \ "#519f50",
"                 \ "#e6e1dc",
"                 \ "#5a647e",
"                 \ "#da4939",
"                 \ "#a5c261",
"                 \ "#ffc66d",
"                 \ "#6d9cbe",
"                 \ "#b6b3eb",
"                 \ "#519f50",
"                 \ "#f9f7f3"
"                 \ ]

" endif

" no search highlighting, plz
set nohlsearch

" turn on line numbers
set number

" display a confirmation message when yanking or deleting any number of lines
set report=0

" set maximum line length to 80 characters
" set textwidth=80

" this is from the kitty FAQ to avoid weird background color issues
let &t_ut=''

" hide redundant filename on open
set shortmess+=F

" .env* files should generally have sh syntax
" autocmd BufNewFile,BufRead *env* set syntax=sh

" sometimes, _ separates words
autocmd BufNewFile,BufRead *.py setlocal iskeyword-=_


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
set fo+=t


"------- Keybinds --------

" useful devdocs
" nmap K <Plug>(devdocs-under-cursor)

" lead me into space
let mapleader=" "

" map to toggle open/closed NERDTree
nnoremap <Leader>o :NERDTreeToggle<CR>

" make him just a *bit* smaller
let g:NERDTreeWinSize=20

" terminal window
" nnoremap <Leader>t :terminal<CR>

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
" nnoremap <Leader>af :ALEFix<CR>
" nnoremap <Leader>at :ALEToggle<CR>
" nnoremap <Leader>ag :ALEGoToDefinition<CR>
" nnoremap <Leader>an :ALENext<CR>
" nnoremap <Leader>ap :ALEPrevious<CR>

" enter should mean a newline, goddamnit
nnoremap <CR> i<CR><ESC>

" getting real tired of pressing shift
nnoremap ; :
nnoremap : ;

" pls get me tf out of this built-in terminal
" nnoremap <C-e> a
" tnoremap <C-e> <C-\><C-n>


"------- Custom Commands --------

" define a command to allow auto-alphabetizing of CSS properties
command! -bar SortCSS g#\({\n\)\@<=#.,/}/sort

"------------------ Configuration for coc.nvim

" highlight comments in jsonc files
autocmd FileType json syntax match Comment +\/\/.\+$+

" If hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files
set nobackup
set nowritebackup

" You will have a bad experience with diagnostic messages with the default 4000.
set updatetime=300

" Don't give |ins-completion-menu| messages.
set shortmess+=c

" Always show signcolumns
set signcolumn=yes

" Help Vim recognize *.sbt and *.sc as Scala files
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Used in the tab autocompletion for coc
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> <Leader>ck <Plug>(coc-definition)
nmap <silent> <Leader>cy <Plug>(coc-type-definition)
nmap <silent> <Leader>ci <Plug>(coc-implementation)
nmap <silent> <Leader>cr <Plug>(coc-references)

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <Leader>cw <Plug>(coc-rename)

" Remap for format selected region
xmap <Leader>fr  <Plug>(coc-format-selected)
nmap <Leader>fr  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType scala setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of current line
xmap <Leader>ca  <Plug>(coc-codeaction-line)
nmap <Leader>ca  <Plug>(coc-codeaction-line)

" Fix autofix problem of current line
nmap <Leader>fg  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
nnoremap <Leader>cn :<C-u>call CocActionAsync('codeLensAction')<CR>

" Show all diagnostics
nnoremap <silent> <Leader>cl  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <Leader>ce  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <Leader>cc  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <Leader>co  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <Leader>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <Leader>cn  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <Leader>cN  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <Leader>cp  :<C-u>CocListResume<CR>

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Toggle panel with Tree Views
nnoremap <silent> <Leader>mt :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <Leader>mp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <Leader>mc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <Leader>mb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <Leader>mf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>
