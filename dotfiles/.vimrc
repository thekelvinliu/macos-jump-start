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
Plug 'taohex/lightline-buffer'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-sensible'
Plug 'christoomey/vim-tmux-navigator'
call plug#end()

" easily get out of insert mode
imap jj <ESC>

" trim trailing whitespace
autocmd BufWritePre * %s/\s\+$//e

" soft not hard tabs
set expandtab
set shiftwidth=2
set softtabstop=2

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
let g:lightline = {
  \ 'colorscheme': 'Dracula',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'gitbranch', 'filename', 'modified' ] ]
  \ },
  \ 'tabline': {
  \   'left': [ [ 'bufferinfo' ],
  \             [ 'separator' ],
  \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
  \   'right': [ [ 'close' ], ],
  \ },
  \ 'component_expand': {
  \   'buffercurrent': 'lightline#buffer#buffercurrent',
  \   'bufferbefore': 'lightline#buffer#bufferbefore',
  \   'bufferafter': 'lightline#buffer#bufferafter',
  \ },
  \ 'component_type': {
  \   'buffercurrent': 'tabsel',
  \   'bufferbefore': 'raw',
  \   'bufferafter': 'raw',
  \ },
  \ 'component': {
  \   'lineinfo': ' %3l:%-2v',
  \   'separator': '',
  \ },
  \ 'component_function': {
  \   'bufferinfo': 'lightline#buffer#bufferinfo',
  \   'gitbranch': 'LightlineFugitive',
  \   'readonly': 'LightlineReadonly',
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' },
  \ }

function! LightlineReadonly()
  return &readonly ? '' : ''
endfunction
function! LightlineFugitive()
  if exists('*fugitive#head')
    let branch = fugitive#head()
    return branch !=# '' ? ''.branch : ''
  endif
  return ''
endfunction

" lightline-buffer ui
let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '•'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']

let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20

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
