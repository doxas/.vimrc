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

set timeout timeoutlen=1000 ttimeoutlen=75

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
NeoBundle 'cohama/agit.vim'

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

nnoremap k   gk
nnoremap j   gj
vnoremap k   gk
vnoremap j   gj
nnoremap gk  k
nnoremap gj  j
vnoremap gk  k
vnoremap gj  j

nnoremap + <c-a>
nnoremap - <c-x>
nnoremap <c-j> 10j
nnoremap <c-k> 10k
nnoremap mh 5<c-w><
nnoremap ml 5<c-w>>
nnoremap mk 5<c-w>+
nnoremap mj 5<c-w>-
nnoremap m<left>  <c-w>h
nnoremap m<down>  <c-w>j
nnoremap m<up>    <c-w>k
nnoremap m<right> <c-w>l
nnoremap mm <c-w>w
nnoremap m, <c-w>p
nnoremap mt :tabnew<cr>
nnoremap mw gt
nnoremap mp gT
nnoremap mn :cn<cr>
nnoremap mb :cN<cr>
nnoremap mq :ccl<cr>
nnoremap <esc><esc> :noh<cr>
nnoremap <c-l><c-l> :noh<cr>
nnoremap <c-f> :vimgrep //j %<left><left><left><left>
nnoremap <c-h> :%s///g<left><left><left>
vnoremap <c-h> :s///g<left><left><left>

nnoremap <space>a :Agit<cr>
nnoremap <space>d :NERDTree<cr>

let g:markdown_fenced_languages=['html', 'css', 'javascript', 'bash=sh']

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

let g:NERDTreeShowBookmarks=1

autocmd vimenter * NERDTree

autocmd! FileType markdown hi! def link markdownItalic Normal

autocmd QuickFixCmdPost *grep* cwindow

