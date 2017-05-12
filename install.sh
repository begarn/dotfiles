#!/bin/bash
set -E

# This script is to configure my CentOS7 VirtualBox
# base stack
yum makecache fast
yum install -y tmux vim ruby rubygem-bundler git zsh unzip wget

# get the references files
wget 'https://github.com/begarn/dotfiles/archive/win$.zip'
unzip 'win$.zip'
mv dotfiles-win- dotfiles

# vundle
git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
cat > ~/.vimrc << EOF
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

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
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

EOF

vim +PluginInstall +qall
cat >> ~/.vimrc <<EOF

" Enable vim-airline
set laststatus=2
set t_Co&
let g:airline_theme='solarized'

" enable solarized theme
syntax enable
set background=dark
colorscheme solarized
EOF

# tmux
cp dotfiles/.tmux.conf ~/

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cp dotfiles/.zshrc ~/
cp dotfiles/arno.zsh-theme ~/.oh-my-zsh/themes/

# GIT config
git config --global user.name "Arnaud Begot"
git config --global user.email arnaud.begot@worldline.com
git config --global color.ui true

# SSHD
/usr/bin/sed -i -e 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config
systemctl restart sshd.service

# clean
rm -rf dotfiles

exit 0
