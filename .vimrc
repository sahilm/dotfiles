set nocompatible
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-rails'
Plugin 'mileszs/ack.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-repeat'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-haml'
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
set wildmode=longest,list
set noerrorbells
set novisualbell
set t_vb=
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent
set nobackup
set nowritebackup

autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
autocmd FileType python setlocal ts=4 sts=4 sw=4 expandtab
autocmd BufNewFile,BufRead Vagrantfile,Rakefile setfiletype ruby
" Restore cursor position
autocmd BufReadPost *
  \ if line("'\"") > 1 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif

set incsearch
set ignorecase
set hlsearch
set bs=2
