" vim: fdm=marker ft=vim

" {{{ SETTINGS
set noequalalways
set hidden
set laststatus=2
set listchars=eol:¬,tab:>>,trail:~,extends:>,precedes:<,space:·
set number
set showcmd
set noshowmode
set showtabline=2
set nowrap

" natural splitting
set splitbelow
set splitright

" soft not hard tabs
set expandtab
set shiftwidth=2
set softtabstop=2

" use system clipboard
set clipboard+=unnamedplus
" }}}

" {{{ KEY BINDINGS
" leader
let mapleader = " "

" edit vimrc
nnoremap <leader>ve :edit $MYVIMRC<cr>
" source vimrc
nnoremap <silent> <leader>r :source $MYVIMRC<bar>echo "reloaded vimrc"<cr>

" edit/new
nnoremap <leader>e :edit<space>
nnoremap <leader>E :edit<space>%:h/

" save
nnoremap <leader>s :write<cr>

" keep window buffer delete
nmap <leader>a <plug>(kwbd)

" close window
nnoremap <leader>w :close<cr>

" safely quit
nnoremap <leader>q :confirm quitall<cr>

" toggle fold
nnoremap <leader><space> za

" toggle line numbers and whitespace characters
nnoremap <leader>N :set number! number?<cr>
nnoremap <leader>C :set list! list?<cr>

" turn search highlight off
nnoremap <silent> <leader>h :nohlsearch<cr>

" indentation
vnoremap <tab> >
nnoremap <tab> >>
inoremap <tab> <c-t>
vnoremap <s-tab> <
nnoremap <s-tab> <<
inoremap <s-tab> <c-d>

" `jk` to get out of insert mode/popup menu
inoremap <silent><expr> jk pumvisible() ? "\<c-e>\<esc>" : "\<esc>"
inoremap <silent><expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr> <s-tab> pumvisible() ? "\<c-p>" : "\<c-d>"
inoremap <silent><expr> <cr> pumvisible() ? "\<c-y>" : "\<cr>"
inoremap <silent><expr> <bs> pumvisible() ? "\<c-e>\<bs>" : "\<bs>"

" resize
nmap <silent> <c-space>h <plug>(tsize_h)<c-space>
nmap <silent> <c-space>j <plug>(tsize_j)<c-space>
nmap <silent> <c-space>k <plug>(tsize_k)<c-space>
nmap <silent> <c-space>l <plug>(tsize_l)<c-space>

" splits
nnoremap <silent> <c-space>- :new<bar>set nobuflisted<cr>
nnoremap <silent> <c-space>/ :vnew<bar>set nobuflisted<cr>
nnoremap <leader>th :call TermHSplit('')<left><left>
nnoremap <leader>tv :call TermVSplit('')<left><left>

" window navigation
noremap <c-h> <c-w>h
noremap <c-j> <c-w>j
noremap <c-k> <c-w>k
noremap <c-l> <c-w>l
" }}}

" {{{ TERMINAL
if exists(':terminal') && has('nvim')
  " `;;` to get out of terminal mode
  tnoremap ;; <c-\><c-n>

  " resize
  tmap <silent> <c-space>h <c-\><c-n><plug>(tsize_h)a<c-space>
  tmap <silent> <c-space>j <c-\><c-n><plug>(tsize_j)a<c-space>
  tmap <silent> <c-space>k <c-\><c-n><plug>(tsize_k)a<c-space>
  tmap <silent> <c-space>l <c-\><c-n><plug>(tsize_l)a<c-space>

  " splits
  tnoremap <silent> <c-space>- <c-\><c-n>:call TermHSplit('')<cr>
  tnoremap <silent> <c-space>/ <c-\><c-n>:call TermVSplit('')<cr>

  " window navigation
  tnoremap <c-h> <c-\><c-n><c-w>h
  tnoremap <c-j> <c-\><c-n><c-w>j
  tnoremap <c-k> <c-\><c-n><c-w>k
  tnoremap <c-l> <c-\><c-n><c-w>l

  augroup terminal_buffers
    autocmd!
    autocmd bufenter,termopen term://* call OnTerm()

    " preserve fzf bindings
    autocmd filetype fzf tnoremap <buffer> <c-j> <down>
    autocmd filetype fzf tnoremap <buffer> <c-k> <up>
  augroup end
endif
" }}}

" {{{ PLUGINS
" {{{ install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  augroup install_plugins
    autocmd!
    autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
  augroup end
endif
" }}}

call plug#begin()
" {{{ basics
Plug '/usr/local/opt/fzf'
let g:fzf_layout = { 'down': '~20%' }
nnoremap <silent> <leader>o <c-^><cr>
" git-aware fzf
nnoremap <silent> <leader>p :execute ':FZF '.trim(system('git rev-parse --show-toplevel 2> /dev/null'))<cr>

Plug 'jiangmiao/auto-pairs'
Plug 'thekelvinliu/kwbd'
Plug 'thekelvinliu/tsize'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
" }}}

" {{{ colorscheme
Plug 'thekelvinliu/stllrzd'
let g:colors_name = 'stllrzd'
set background=dark
if exists('+termguicolors')
  set termguicolors
endif

Plug 'lifepillar/vim-colortemplate'
" }}}

" {{{ completion
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-highprio-pop'
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-jedi'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'fgrsnau/ncm2-otherbuf'
Plug 'ncm2/ncm2-path'
augroup enable_completion
  autocmd!
  autocmd bufenter * call ncm2#enable_for_buffer()
augroup end
set completeopt=menuone,noinsert,noselect
set shortmess+=c
" }}}

" {{{ languages
" langserver
Plug 'autozimu/LanguageClient-neovim', { 'branch': 'next', 'do': 'bash install.sh' }
let g:LanguageClient_serverCommands = {
  \ 'javascript': ['typescript-language-server', '--stdio'],
  \ 'javascript.jsx': ['typescript-language-server', '--stdio'],
  \ 'rust': ['rls'],
  \ 'typescript': ['typescript-language-server', '--stdio'],
  \ 'typescript.tsx': ['typescript-language-server', '--stdio'],
  \ 'vue': ['vls'],
  \ }
nnoremap <leader>L :call LanguageClient_contextMenu()<cr>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<cr>

" language plugins
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1

Plug 'sheerun/vim-polyglot'
let g:javascript_plugin_jsdoc = 1
let g:polyglot_disabled = ['latex']

" Plug 'lervag/vimtex'
" let g:vimtex_compiler_method = 'latexmk'
" let g:vimtex_compiler_progname = 'nvr'
" let g:vimtex_view_method = 'skim'

" lint
Plug 'w0rp/ale'
let g:ale_fixers = {
  \ 'css': ['prettier'],
  \ 'html': ['prettier'],
  \ 'javascript': ['prettier', 'eslint'],
  \ 'json': ['prettier'],
  \ 'markdown': ['prettier'],
  \ 'python': ['black', 'isort'],
  \ 'rust': ['rustfmt'],
  \ 'scss': ['prettier'],
  \ 'typescript': ['prettier', 'eslint'],
  \ 'vue': ['prettier'],
  \ 'yaml': ['prettier'],
  \ '*': ['remove_trailing_lines'],
  \ }
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '🚫'
let g:ale_sign_warning = '⚡'
highlight clear ALEErrorSign
highlight clear ALEWarningSign
nmap <leader>n <plug>(ale_next_wrap)
nmap <leader>f <plug>(ale_fix)
nmap <leader>l <plug>(ale_lint)
" }}}

" {{{ taskwarrior
Plug 'xarthurx/taskwarrior.vim'
let g:task_default_prompt = ['description', 'due', 'project', 'depends', 'priority', 'tag']
nnoremap <leader>TA :call taskwarrior#action#new()<cr>
nnoremap <leader>TT :new<bar>set nobuflisted<cr>:TW<cr>
" }}}

" {{{ ui
Plug 'itchyny/lightline.vim'
let g:lightline = {}
let g:lightline.active = { 'left': [['mode', 'paste'], ['filename', 'gitbranch']] }
let g:lightline.colorscheme = 'stllrzd'
let g:lightline.component = { 'lineinfo': ' %3l:%-2v', 'separator': '' }
let g:lightline.component_expand = { 'buffers': 'lightline#bufferline#buffers' }
let g:lightline.component_function = { 'gitbranch': 'LightlineFugitive', 'mode': 'LightlineMode' }
let g:lightline.component_type = { 'buffers': 'tabsel' }
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '|', 'right': '|' }
let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']]}

Plug 'mgee/lightline-bufferline'
let g:lightline#bufferline#modified = '•'
let g:lightline#bufferline#shorten_path = 0
let g:lightline#bufferline#show_number = 2
let g:lightline#bufferline#unicode_symbols = 1
let g:lightline#bufferline#unnamed = '[No Name]'
nmap <leader>1 <plug>lightline#bufferline#go(1)
nmap <leader>2 <plug>lightline#bufferline#go(2)
nmap <leader>3 <plug>lightline#bufferline#go(3)
nmap <leader>4 <plug>lightline#bufferline#go(4)
nmap <leader>5 <plug>lightline#bufferline#go(5)
nmap <leader>6 <plug>lightline#bufferline#go(6)
nmap <leader>7 <plug>lightline#bufferline#go(7)
nmap <leader>8 <plug>lightline#bufferline#go(8)
nmap <leader>9 <plug>lightline#bufferline#go(9)
nmap <leader>0 <plug>lightline#bufferline#go(10)
" }}}
call plug#end()
" }}}

" {{{ AUTOCMDS
" filetype overrides
augroup ftdetect_overrides
  autocmd!
  " plist as xml
  autocmd bufnew,bufnewfile,bufread *.plist set filetype=xml
augroup end

" trim trailing whitespace for filetypes not in blacklist
let blacklist = ['markdown']
augroup trim_whitespace_on_write
  autocmd!
  autocmd bufwritepre * if index(blacklist, &ft) < 0 | %s/\v\s+$//e
augroup end
" }}}

" {{{ FUNCTIONS
" return lightline git branch display
function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return !empty(branch) ? ' '.branch : ''
  endif
  return ''
endfunction

" return lightline mode display
function! LightlineMode()
  return &filetype ==# 'fzf' ? 'fzf' : lightline#mode()
endfunction

" called when current buffer becomes a terminal
function! OnTerm()
  " change display name term title doesn't contain "fzf"
  if b:term_title !~? "fzf"
    execute 'keepalt file ['.split(expand(b:term_title), '/')[-1].']'
  endif

  " no line numbers
  setlocal nonumber
endfunction

" return term buffer title
function! TermBuffer(cmd)
  return "term://".(!empty(a:cmd) ? a:cmd : 'bash')
endfunction

" terminal horizontal split
function! TermHSplit(input)
  execute 'sp '.TermBuffer(a:input)
  if a:input ==# ''
    startinsert
  endif
endfunction

" terminal vertical split
function! TermVSplit(input)
  execute 'vsp '.TermBuffer(a:input)
  if a:input ==# ''
    startinsert
  endif
endfunction
" }}}

" {{{ NVIM
if has('nvim')
  let g:clipboard = {
    \ 'name': 'macos',
    \ 'copy': {
    \   '+': 'pbcopy',
    \   '*': 'pbcopy',
    \ },
    \ 'paste': {
    \   '+': 'pbpaste',
    \   '*': 'pbpaste',
    \ },
    \ 'cache_enabled': 0,
    \ }
  let g:loaded_python_provider = 1
  let g:loaded_node_provider = 1
  let g:loaded_ruby_provider = 1
  let g:python3_host_prog = '/usr/local/bin/python3'
endif
" }}}
