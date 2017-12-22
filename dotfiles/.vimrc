" plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'itchyny/lightline.vim'
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

" lightline config
set laststatus=2
set noshowmode
let g:lightline = {
  \ 'colorscheme': 'Dracula',
  \ 'active': {
  \   'left': [ [ 'mode', 'paste' ],
  \             [ 'readonly', 'gitbranch', 'filename', 'modified' ] ]
  \ },
  \ 'component': {
  \   'lineinfo': ' %3l:%-2v',
  \ },
  \ 'component_function': {
  \   'readonly': 'LightlineReadonly',
  \   'gitbranch': 'LightlineFugitive'
  \ },
  \ 'separator': { 'left': '', 'right': '' },
  \ 'subseparator': { 'left': '', 'right': '' }
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
