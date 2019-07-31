set nocompatible

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
set ambiwidth=double

"neobundle
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))
NeoBundleFetch 'Shougo/neobundle.vim'
NeoBundle 'Shougo/neobundle.vim'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'tchyny/vim-cursorword'
NeoBundle 'tyru/caw.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'cohama/agit.vim'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'junegunn/vim-easy-align'
NeoBundle 'rust-lang/rust.vim'
call neobundle#end()

filetype plugin indent on
filetype indent on

syntax on
colorscheme badwolf

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
imap <c-k> <esc>
imap <c-_> <c-y>,
nmap <c-_> <Plug>(caw:hatpos:toggle)
vmap <c-_> <Plug>(caw:hatpos:toggle)
vmap <Enter> <Plug>(EasyAlign)

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

let g:brightest#highlight = {
\   "group" : "BrightestUnderline"
\}

let g:NERDTreeShowBookmarks=1
let g:NERDTreeShowHidden=1

hi IndentGuidesOdd  ctermbg=black
hi IndentGuidesEven ctermbg=darkgrey

if !argc()
  autocmd vimenter * NERDTree
endif

au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl

let g:indent_guides_enable_on_vim_startup=1
let g:indent_guides_start_level=1
let g:indent_guides_guide_size=1
let g:indent_guides_auto_colors=0
let g:indent_guides_exclude_filetypes=['help', 'nerdtree', 'Agit stat', 'Agit diff']
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=red   ctermbg=232
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=green ctermbg=234

autocmd! FileType markdown hi! def link markdownItalic Normal

autocmd QuickFixCmdPost *grep* cwindow

let g:quickrun_config={'*': {'split': ''}}
set splitbelow

autocmd BufNewFile,BufRead *.crs setf rust
autocmd BufNewFile,BufRead *.rs  let g:quickrun_config.rust = {'exec' : 'cargo run'}
autocmd BufNewFile,BufRead *.crs let g:quickrun_config.rust = {'exec' : 'cargo script %s -- %a'}

