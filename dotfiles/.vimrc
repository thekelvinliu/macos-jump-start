" plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'w0rp/ale'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'edkolev/tmuxline.vim'
Plug 'tpope/vim-fugitive'
Plug 'terryma/vim-multiple-cursors'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-sensible'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" leader
map <space> <leader>

" source ~/.vimrc
nmap <leader>r :so $MYVIMRC<cr>

" buffers
" new
nmap <leader>o :e<space>
" save
nmap <leader>s :w<cr>
" close
nmap <leader>a :bd<cr>
nmap <leader>q :q<cr>
nmap <leader>Q :q!<cr>
" prev
nmap <leader>h :bp<cr>
nmap <leader>k :bp<cr>
" next
nmap <leader>l :bn<cr>
nmap <leader>j :bn<cr>

" ctrlp
nmap <leader>p <c-p>
nmap <leader>P <c-p><f5><esc>

" toggle line numbers and whitespace characters
nmap <leader>N :set number! number?<cr>
nmap <leader>C :set list! list?<cr>

" easily get out of insert mode
imap jj <esc>

" trim trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" soft not hard tabs
set expandtab
set shiftwidth=2
set softtabstop=2

" indentation
vnoremap <tab> >
nnoremap <tab> >>
inoremap <tab> <c-t>
vnoremap <s-tab> <
nnoremap <s-tab> <<
inoremap <s-tab> <c-d>

" display settings
set nowrap
set number
highlight LineNr ctermfg=grey
set listchars=eol:¬,tab:>>,trail:~,extends:>,precedes:<,space:·

" natural splitting
set splitbelow
set splitright

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
nmap <Leader>1 <Plug>lightline#bufferline#go(1)
nmap <Leader>2 <Plug>lightline#bufferline#go(2)
nmap <Leader>3 <Plug>lightline#bufferline#go(3)
nmap <Leader>4 <Plug>lightline#bufferline#go(4)
nmap <Leader>5 <Plug>lightline#bufferline#go(5)
nmap <Leader>6 <Plug>lightline#bufferline#go(6)
nmap <Leader>7 <Plug>lightline#bufferline#go(7)
nmap <Leader>8 <Plug>lightline#bufferline#go(8)
nmap <Leader>9 <Plug>lightline#bufferline#go(9)
nmap <Leader>0 <Plug>lightline#bufferline#go(10)

" tmuxline
let g:tmuxline_powerline_separators = 0
let g:tmuxline_preset = {}
let g:tmuxline_preset.a = '#(whoami)@#h'
let g:tmuxline_preset.b = '#S#F'
let g:tmuxline_preset.c = '#W'
let g:tmuxline_preset.win = ['#I', '#W']
let g:tmuxline_preset.cwin = ['w #I', '#W']
let g:tmuxline_preset.x = '#(bash ~/macos-jump-start/configs/tmuxline/uptime.sh)'
let g:tmuxline_preset.y = '#(uptime | cut -d , -f 3- | cut -d : -f 2 | xargs)'
let g:tmuxline_preset.z = ['%a', '%Y-%m-%d', '%R']

" ctrlp
let g:ctrlp_show_hidden = 1
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)|node_modules$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" ale
let g:ale_fixers = {
  \ 'javascript': ['eslint'],
  \ }
let g:ale_sign_error = '>>'
let g:ale_sign_warning = '~~'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
