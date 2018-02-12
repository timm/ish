set backupdir-=.
set backupdir^=~/tmp,/tmp
set nocompatible              " required
filetype plugin indent on
set modelines=5
set scrolloff=3
set autoindent
set hidden "remember ls
set wildmenu
set wildmode=list:longest
set visualbell
set ttyfast
set backspace=indent,eol,start
set laststatus=2
set undofile
nnoremap / /\v
vnoremap / /\v
let mapleader = ","
nnoremap <leader><space> :noh<cr>
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>
nnoremap <leader>w <C-w>v<C-w>l
set splitbelow
set splitright
set ruler
set rulerformat=%l,%v
set mouse=a
set title
set number
autocmd BufEnter * cd %:p:h
set matchtime=15
set background=light
set syntax=on
colorscheme desert
syntax enable
set ignorecase
set incsearch
set smartcase
set showmatch
set encoding=utf-8
set clipboard=unnamed
set spell spelllang=en_us
set nospell
set tabstop=2 shiftwidth=2 expandtab
set lispwords+=deftest
set lispwords+=defthing
set lispwords+=until
set lispwords+=while
set lispwords+=doitems
set lispwords+=doh
set lispwords+=aif

