set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Nerdtree
Plugin 'scrooloose/nerdtree.git'
"NerdTree Git thing
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'kien/ctrlp.vim.git'

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
"
"color words
color elflord
set cursorline

"Show line numbers
set number

"make current current line obv
set highlight LineNr ctermfg=darkmagenta

syntax on
"map nerddtree to ctrl n
map <silent> <C-n> :NERDTreeFocus<CR>
"make tabs less ridiculous
set tabstop=2
set shiftwidth=2
set expandtab
"attempt to make vim put swp files in the directory below
set directory^=$HOME/.vim/tmp//
"make splitting make more sense
set splitbelow
set splitright
"make it so you can move around splits with ctrl+ h, j, k, or l
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

augroup reload_vimrc " {
        autocmd!
        autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
"show a little symbol at linebreaks
"set showbreak=↪ 

"Creates a clipboard separate from the vim buffer that you can paste from with
"f1 and copy to with f2
nmap <F1> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F1> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <F2> :.w !pbcopy<CR><CR>
vmap <F2> :w !pbcopy<CR><CR>
