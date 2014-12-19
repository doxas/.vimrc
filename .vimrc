set nocompatible

"ligjtline
set laststatus=2
set t_Co=256

"basic
set hlsearch
set title
set number
set showcmd
set cmdheight=2
set scrolloff=5
set showmatch
set textwidth=0
set wrap
set cursorline

set backspace=indent,eol,start
set clipboard+=unnamed
set list
set listchars=tab:›\ 
set autoindent
set tabstop=4
set shiftwidth=4

set incsearch
set noignorecase
set smartcase

set encoding=utf8
set fileencoding=utf-8
set noswapfile
set nobackup
set nowritebackup

"neobundle
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/caw.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'closetag.vim'
NeoBundle 'kchmck/vim-coffee-scrpt'

filetype plugin indent on
filetype indent on

syntax on
colorscheme molokai

highlight ZenkakuSpace cterm=reverse ctermfg=DarkGray guifg=DarkGray
au BufRead,BufNew * match ZenkakuSpace /　/

imap <c-l> <esc>

nnoremap <c-j> 10j
nnoremap <c-k> 10k
nnoremap <c-;> :
nnoremap mh <c-w><
nnoremap ml <c-w>>
nnoremap mk <c-w>+
nnoremap mj <c-w>-
nnoremap mw <c-w>w
nnoremap mp <c-w>p
nnoremap mn gt
nnoremap mb gT
nnoremap mt :<c-u>tabnew<cr>
nnoremap md :<c-u>NERDTree<cr>
nnoremap <esc><esc> :noh<cr>
nnoremap <c-l><c-l> :noh<cr>

let g:markdown_fenced_languages=['html', 'css', 'javascript', 'bash=sh']

autocmd! FileType markdown hi! def link markdownItalic Normal

autocmd QuickFixCmdPost *grep* cwindow

