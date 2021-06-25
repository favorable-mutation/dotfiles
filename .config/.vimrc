"------- Plugins --------

call plug#begin('~/.vim/plugged')

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

" completion (recommended for metals)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" coc managed extensions
Plug 'neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'}
Plug 'pappasam/coc-jedi', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'}
Plug 'neoclide/coc-vetur', {'do': 'yarn install --frozen-lockfile'}

" metals
" Plug 'scalameta/coc-metals', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

" remind vim to use the lightline plugin
set laststatus=2

" don't display mode below lightline in original mode display location
set noshowmode

" show the tabline always
set showtabline=2

" initialize lightline config
let g:lightline = {}

" add in lightline fugitive integration
" 'cocstatus', 'currentfunction',
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

" get rid of folding in markdown files
let g:vim_markdown_folding_disabled = 1

" add shell = sh for code blocks
let g:vim_markdown_fenced_languages = ['shell=sh']

" load all syntax files in `runtimepath`
let g:vim_vue_plugin_load_full_syntax = 1
let g:vim_vue_plugin_use_sass = 1


"------- Visual Settings --------

" set colorscheme from colorschemes plugin
colorscheme dim

" set background for theme to dark
set background=light

" set the lightline colorscheme
let g:lightline.colorscheme = 'one'

" syntax highlighting and auto filetype detection on
syntax on filetype on filetype indent on filetype plugin on

" scan from the top of the file for syntax highlighting to avoid issues with
" large files
syntax sync fromstart

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
autocmd BufNewFile,BufRead *env* set syntax=sh

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

" lead me into space
let mapleader=" "

" map to toggle open/closed NERDTree
nnoremap <Leader>o :NERDTreeToggle<CR>

" make him just a *bit* smaller
let g:NERDTreeWinSize=20

nnoremap <Leader>h ^
nnoremap <Leader>j *
nnoremap <Leader>k #
nnoremap <Leader>l $

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

nnoremap <Leader>wp :winc p<CR>

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

" enter should mean a newline, goddamnit
nnoremap <CR> i<CR><ESC>

" getting real tired of pressing shift
nnoremap ; :
nnoremap : ;


"------- Custom Commands --------

" define a command to allow auto-alphabetizing of CSS properties
command! -bar SortCSS g#\({\n\)\@<=#.,/}/sort


"------- Configuration for coc.nvim

" coc managed extensions
" let g:coc_global_extensions = [
"             \ 'coc-eslint',
"             \ 'coc-jedi',
"             \ 'coc-json',
"             \ 'coc-tsserver',
"             \ 'coc-vetur'
"             \ ]

" highlight comments in jsonc files
autocmd FileType json syntax match Comment +\/\/.\+$+

" Set internal encoding of vim, not needed on neovim, since coc.nvim using some
" unicode characters in the file autoload/float.vim
" set encoding=utf-8

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("nvim-0.5.0") || has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
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
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> ck <Plug>(coc-definition)
nmap <silent> cy <Plug>(coc-type-definition)
nmap <silent> cj <Plug>(coc-implementation)
nmap <silent> cr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>cw <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>fr  <Plug>(coc-format-selected)
nmap <leader>fr  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>ca  <Plug>(coc-codeaction-selected)
nmap <leader>ca  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>fg  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>cl  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>ce  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>cc  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>co  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>cs  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>cn  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>cN  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>cp  :<C-u>CocListResume<CR>

" Help Vim recognize *.sbt and *.sc as Scala files
" au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

" Used to expand decorations in worksheets
" nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" augroup mygroup
"   autocmd!
"   " Setup formatexpr specified filetype(s).
"   autocmd FileType scala setl formatexpr=CocAction('formatSelected')
"   " Update signature help on jump placeholder
"   autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
" augroup end

" Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
" nnoremap <Leader>cn :<C-u>call CocActionAsync('codeLensAction')<CR>

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Toggle panel with Tree Views
" nnoremap <silent> <Leader>mt :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
" nnoremap <silent> <Leader>mp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
" nnoremap <silent> <Leader>mc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
" nnoremap <silent> <Leader>mb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
" nnoremap <silent> <Leader>mf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>

