set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'chriskempson/base16-vim'
Plugin 'vim-syntastic/syntastic'
Plugin 'bbatsov/rubocop'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-ruby/vim-ruby'
Plugin 'rodjek/vim-puppet'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append  to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append  to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append  to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


" personal settings
"syntax on
set nohlsearch
set incsearch
set expandtab
set tabstop=2
set shiftwidth=2
set showmatch
set encoding=utf-8
set nu

" Enable vim-airline
set laststatus=2
set t_Co&
set noshowmode
let g:rehash256 = 1
let g:airline_theme='solarized'

" enable solarized theme
syntax enable
set background=dark
colorscheme solarized

