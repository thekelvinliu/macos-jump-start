" plugins
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin()
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'tpope/vim-sensible'
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

" powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
