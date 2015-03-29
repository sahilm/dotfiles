set nocompatible
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-rails'
Plugin 'pangloss/vim-javascript'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-commentary'
call vundle#end()

set laststatus=2
set noshowmode
set t_Co=256
filetype plugin indent on
filetype on
syntax enable
set background=dark
colorscheme solarized

set expandtab
set noerrorbells
set novisualbell
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set nobackup
set nowritebackup

autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd BufNewFile,BufRead Vagrantfile,Rakefile setfiletype ruby

set incsearch
set ignorecase
set hlsearch
set backspace=2
