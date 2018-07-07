" SETTINGS

" change dir based on file
set autochdir
set showcmd

" system clipboard
set clipboard+=unnamedplus

" soft not hard tabs
set expandtab
set shiftwidth=2
set softtabstop=2

" additional display settings
set nowrap
set number
set listchars=eol:¬,tab:>>,trail:~,extends:>,precedes:<,space:·

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
  au BufNew,BufNewFile,BufRead *.md,*.markdown setfiletype markdown
  " text filetype by default
  au BufNew,BufNewFile,BufRead * if &ft == '' | set filetype=text | endif
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
" new
nnoremap <leader>n :e<space>
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
nnoremap <leader>h :noh<cr>

" easily get out of insert mode
imap jk <esc>

" terminal
tnoremap jk <c-\><c-n>

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
Plug 'mileszs/ack.vim'
Plug 'w0rp/ale'
Plug 'jiangmiao/auto-pairs'
Plug 'ctrlpvim/ctrlp.vim'
if !has('nvim')
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'carlitux/deoplete-ternjs'
Plug 'mattn/emmet-vim'
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'edkolev/tmuxline.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" lightline
set hidden
set laststatus=2
set noshowmode
set showtabline=2

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

" tmuxline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {}
let g:tmuxline_preset.a = '#(whoami)@#h'
let g:tmuxline_preset.b = ['#S#F', '#W']
let g:tmuxline_preset.c = '#(osascript ~/macos-jump-start/configs/tmuxline/track.applescript)'
let g:tmuxline_preset.win = ['#I', '#W']
let g:tmuxline_preset.cwin = ['w #I', '#W']
let g:tmuxline_preset.x = ''
let g:tmuxline_preset.y = ['#(bash ~/macos-jump-start/configs/tmuxline/uptime.sh)', '#(uptime | cut -d , -f 3- | cut -d : -f 2 | xargs)']
let g:tmuxline_preset.z = ['%a', '%Y-%m-%d %R']

" ack.vim
if executable('rg')
  let g:ackprg = 'rg --vimgrep --no-heading --hidden'
elseif executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" ale
let g:ale_fixers = {}
let g:ale_fixers.javascript = ['eslint']
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '~~'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
nmap <leader>l <plug>(ale_lint)
nmap <leader>L <plug>(ale_fix)

" ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {}
let g:ctrlp_custom_ignore.dir = '\v[\/]\.(git|hg|svn)|node_modules$'
let g:ctrlp_custom_ignore.file = '\v\.(exe|so|dll)$'
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --hidden --color=never -g "!.git" -g ""'
  let g:ctrlp_use_caching = 0
elseif executable('ag')
  let g:ctrlp_user_command = 'ag %s -l --nocolor --ignore=vendor --ignore images --ignore svg --ignore fonts -g ""'
  let g:ctrlp_use_caching = 0
else
  let g:ctrlp_clear_cache_on_exit = 0
endif
nnoremap <leader>o :CtrlPMRU<cr>
nnoremap <leader>p :CtrlP<cr>
nnoremap <leader>f :Ack!<space>

" deoplete
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
inoremap <silent><expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
inoremap <silent><expr><s-tab> pumvisible() ? "\<c-p>" : "\<c-d>"
inoremap <silent><expr><cr> pumvisible() ? "\<c-y>" : "\<cr>"
inoremap <silent><expr><bs> pumvisible() ? "\<c-e>\<bs>" : "\<bs>"
inoremap <silent><expr>jk pumvisible() ? "\<c-e>\<esc>" : "\<esc>"
" ternjs
let g:deoplete#sources#ternjs#types = 1
let g:deoplete#sources#ternjs#docs = 1
let g:deoplete#sources#ternjs#include_keywords = 1
let g:deoplete#sources#ternjs#filetypes = ['jsx', 'javascript.jsx']
" disable preview window
set completeopt-=preview

" multiple cursors
function! g:Multiple_cursors_before()
  let g:deoplete#disable_auto_complete = 1
endfunction
function! g:Multiple_cursors_after()
  let g:deoplete#disable_auto_complete = 0
endfunction

" OVERRIDES

" grey line numbers
hi LineNr ctermfg=grey
hi DraculaSubtle ctermfg=cyan
hi CtrlPMatch ctermfg=cyan
