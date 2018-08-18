" SETTINGS

set hidden
set laststatus=2
set listchars=eol:¬,tab:>>,trail:~,extends:>,precedes:<,space:·
set noshowmode
set nowrap
set number
set showcmd
set showtabline=2

" autochdir but local
autocmd BufEnter * silent! lcd %:p:h

" soft not hard tabs
set expandtab
set shiftwidth=2
set softtabstop=2

" use system clipboard
set clipboard+=unnamedplus

" natural splitting
set splitbelow
set splitright

" colorscheme
let g:colors_name = 'dracula'
let g:dracula_colorterm = 0

" filetypes
augroup filetypedetect
  " plist as xml
  au BufNew,BufNewFile,BufRead *.plist set filetype=xml
  " markdown
  au BufNew,BufNewFile,BufRead *.md,*.markdown set filetype=markdown
augroup END
" trim trailing whitespace for filetypes not in blacklist
let blacklist = ['markdown']
autocmd BufWritePre * if index(blacklist, &ft) < 0 | %s/\s\+$//e

" KEY BINDINGS

" leader
map <space> <leader>

" source ~/.vimrc
nnoremap <leader>r :so $MYVIMRC<cr>

" buffers
" edit/new
nnoremap <leader>e :e<space>
" save
nnoremap <leader>s :w<cr>
" close
nnoremap <leader>a :bd<cr>
nnoremap <leader>A :bd!<cr>
nnoremap <leader>q :q<cr>
nnoremap <leader>Q :q!<cr>
" prev
nnoremap <leader>k :bp<cr>
" next
nnoremap <leader>j :bn<cr>

" toggle line numbers and whitespace characters
nnoremap <leader>N :set number! number?<cr>
nnoremap <leader>C :set list! list?<cr>

" turn search highlight off
nnoremap <silent> <leader>h :noh<cr>

" indentation
vnoremap <tab> >
nnoremap <tab> >>
inoremap <tab> <c-t>
vnoremap <s-tab> <
nnoremap <s-tab> <<
inoremap <s-tab> <c-d>

" PLUGINS

" vim plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
" basics
Plug '/usr/local/opt/fzf'
Plug 'jiangmiao/auto-pairs'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'

" lint
Plug 'w0rp/ale'

" lightline
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'

" ncm2
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-html-subscope'
Plug 'ncm2/ncm2-markdown-subscope'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-tern', { 'do': 'npm install' }

" languages
Plug 'sheerun/vim-polyglot'
Plug 'plasticboy/vim-markdown'

" other
" uncomment when regenerating .tmuxline.conf
" Plug 'edkolev/tmuxline.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" fugitive
nnoremap <leader>gc :Gcommit<cr>
nnoremap <leader>gd :Gvdiff<cr>
nnoremap <leader>gs :Gstatus<cr>

" fzf
function! GitRoot()
  let dir = system('git rev-parse --show-toplevel 2> /dev/null')
  return !empty(dir) ? dir : "\<cr>"
endfunction
nnoremap <silent><expr> <leader>p ':FZF '.GitRoot()
nnoremap <leader>o <c-^><cr>
let g:fzf_layout = { 'down': '~20%' }

" lightline
let g:lightline = {}
let g:lightline.active = { 'left': [['mode', 'paste'], ['filename', 'gitbranch']] }
let g:lightline.colorscheme = 'Dracula'
let g:lightline.component = { 'lineinfo': ' %3l:%-2v', 'separator': '' }
let g:lightline.component_expand = { 'buffers': 'lightline#bufferline#buffers' }
let g:lightline.component_function = { 'gitbranch': 'LightlineFugitive', 'mode': 'LightlineMode' }
let g:lightline.component_type = { 'buffers': 'tabsel' }
let g:lightline.separator = { 'left': '', 'right': '' }
let g:lightline.subseparator = { 'left': '|', 'right': '|' }
let g:lightline.tabline = {'left': [['buffers']], 'right': [['close']]}

function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ' '.branch : ''
  endif
  return ''
endfunction
function! LightlineMode()
  return expand('%:t') ==# '__Tagbar__' ? 'Tagbar':
        \ expand('%:t') ==# 'ControlP' ? 'CtrlP' :
        \ &filetype ==# 'fzf' ? 'fzf' :
        \ &filetype ==# 'unite' ? 'Unite' :
        \ &filetype ==# 'vimfiler' ? 'VimFiler' :
        \ &filetype ==# 'vimshell' ? 'VimShell' :
        \ lightline#mode()
endfunction

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

" uncomment when regenerating .tmuxline.conf
" let g:tmuxline_powerline_separators = 0
" let g:tmuxline_preset = {}
" let g:tmuxline_preset.a = '#(whoami)@#h'
" let g:tmuxline_preset.b = ['#S#F', '#W']
" let g:tmuxline_preset.c = '#(osascript ~/macos-jump-start/configs/tmuxline/track.applescript)'
" let g:tmuxline_preset.win = ['#I', '#W']
" let g:tmuxline_preset.cwin = ['w #I', '#W']
" let g:tmuxline_preset.x = ''
" let g:tmuxline_preset.y = ['#(bash ~/macos-jump-start/configs/tmuxline/uptime.sh)', '#(uptime | cut -d , -f 3- | cut -d : -f 2 | xargs)']
" let g:tmuxline_preset.z = ['%a', '%Y-%m-%d %R']

" ale
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint']
let g:ale_lint_on_enter = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '~~'
nmap <leader>n <plug>(ale_next_wrap)
nmap <leader>l <plug>(ale_lint)
nmap <leader>L <plug>(ale_fix)

" ncm2
autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=menuone,noinsert,noselect
set shortmess+=c
inoremap <silent><expr> <tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr> <s-tab> pumvisible() ? "\<c-p>" : "\<c-d>"
inoremap <silent><expr> <cr> pumvisible() ? "\<c-y>" : "\<cr>"
inoremap <silent><expr> <bs> pumvisible() ? "\<c-e>\<bs>" : "\<bs>"
inoremap <silent><expr> jk pumvisible() ? "\<c-e>\<esc>" : "\<esc>"

" language support
let g:javascript_plugin_jsdoc = 1
let g:vim_markdown_folding_disabled = 1

" OVERRIDES
" yellow ale warnings
hi ALEWarningSign ctermfg=yellow
" make a little less subtle
hi DraculaSubtle ctermfg=yellow
" grey line numbers
hi LineNr ctermfg=grey
