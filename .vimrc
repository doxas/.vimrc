set nocompatible

"lightline
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
set smarttab
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=0
set background=dark

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
NeoBundle 'glsl.vim'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/caw.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'mattn/emmet-vim'
NeoBundle 'cohama/agit.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'nathanaelkane/vim-indent-guides'

filetype plugin indent on
filetype indent on

syntax on
colorscheme molokai

function! ZenkakuSpace()
    highlight ZenkakuSpace cterm=reverse ctermfg=DarkGray guifg=DarkGray
endfunction
if has('syntax')
    augroup ZenkakuSpace
        autocmd!
        autocmd ColorScheme * call ZenkakuSpace()
        autocmd VimEnter,WinEnter,BufRead * let w:m1=matchadd('ZenkakuSpace', '　')
    augroup END
    call ZenkakuSpace()
endif

"keys
map q: :q
imap <c-l> <esc>
vmap <c-l> <esc>
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
nnoremap <c-j> 10j
nnoremap <c-k> 10k
vnoremap <c-j> 10j
vnoremap <c-k> 10k
nnoremap ma $
nnoremap mi ^
vnoremap ma $
vnoremap mi ^

nnoremap J Jx
nnoremap + <c-a>
nnoremap - <c-x>
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

nnoremap <cr> 3w
nnoremap <bs> 3b

nnoremap <esc><esc> :noh<cr>
nnoremap <c-l><c-l> :noh<cr>
nnoremap <c-f> :vimgrep //j %<left><left><left><left>
nnoremap <c-h> :%s///g<left><left><left>
vnoremap <c-h> :s///g<left><left><left>
nnoremap <space>n :cn<cr>
nnoremap <space>b :cN<cr>
nnoremap <space>q :ccl<cr>

nnoremap <space>c :FixWhitespace<cr>
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
let g:NERDTreeShowHidden=1

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

if !argc()
  autocmd vimenter * NERDTree
endif

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
let g:indent_guides_exclude_filetypes=['help', 'nerdtree', 'Agit stat', 'Agit diff']
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=232
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=234

autocmd BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl
            \ set syntax=glsl

autocmd! FileType markdown hi! def link markdownItalic Normal

autocmd QuickFixCmdPost *grep* cwindow


