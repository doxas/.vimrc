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
set matchtime=1
set textwidth=0
set wrap
set display=lastline
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

set pumheight=20


"neobundle
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/caw.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mattn/emmet-vim'

filetype plugin indent on
filetype indent on

syntax on
colorscheme molokai

highlight ZenkakuSpace cterm=reverse ctermfg=DarkGray guifg=DarkGray
au BufRead,BufNew * match ZenkakuSpace /　/

imap <c-l> <esc>
imap <c-_> <c-y>,
nmap <c-_> <Plug>(caw:i:toggle)
vmap <c-_> <Plug>(caw:i:toggle)
nnoremap <c-;> :
nnoremap + <c-a>
nnoremap - <c-x>

nnoremap <c-j> 10j
nnoremap <c-k> 10k
nnoremap mh 5<c-w><
nnoremap ml 5<c-w>>
nnoremap mk 5<c-w>+
nnoremap mj 5<c-w>-
nnoremap m<left> <c-w>h
nnoremap m<down> <c-w>j
nnoremap m<up> <c-w>k
nnoremap m<right> <c-w>l
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

let g:lightline = {
\   'active': {
\     'left': [ 
\       [ 'mode', 'paste' ],
\       [ 'fugitive', 'readonly', 'filename', 'modified' ]
\     ]
\   },
\   'inactive': {
\     'left': [ 
\       [ 'fugitive', 'readonly', 'filename', 'modified' ]
\     ]
\   },
\   'component': {
\     'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}',
\     'readonly': '%{&filetype=="help"?"":&readonly?"x":""}',
\     'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}'
\   },
\   'separator': { 'left': '', 'right': '' },
\   'subseparator': { 'left': '|', 'right': '|' }
\ }

