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
Plugin 'rking/ag.vim.git'
"Git stuff for vim
Plugin 'tpope/vim-fugitive.git'
Plugin 'scrooloose/syntastic.git'
"autocomplete
Plugin 'Shougo/neocomplete.vim.git'
"handlebars syntax and stuff
Plugin 'mustache/vim-mustache-handlebars'
"handlebars syntax and stuff
Plugin 'leafgarland/typescript-vim.git'
"abolish.vim
Plugin 'tpope/vim-abolish.git'
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
"highlight words that are searched for and make a hotkey to toggle the
"highlight 
set hlsearch!
nnoremap <F4> :set hlsearch!<CR>
"Show line numbers
set number
syntax on
"highlight current window and other windows
highlight StatusLine ctermbg=93 cterm=none
highlight StatusLineNC ctermbg=55 cterm=none
highlight VertSplit ctermbg=55 cterm=none
"highlight search matches (toggle with f5)
highlight Search ctermbg=93 ctermfg=10
"Change the color slightly in insert mode
highlight ModeMsg ctermbg=57 ctermfg=51
highlight iCursor ctermbg=239
"highlight current line and line number
highlight LineNr ctermfg=57
highlight CursorLineNr ctermfg=162
highlight CursorLine cterm=none ctermbg=234
"---Ruby Syntax Colors---
"sets color for if/else/ends
highlight rubyConditional ctermfg=30
"sets color for the contents of a do block
highlight rubyDoBlock ctermfg=45
highlight RubyBlockExpression ctermfg=39
highlight RubyBlock ctermfg=141
highlight RubyConstant ctermfg=093
highlight RubyFunction ctermfg=010
highlight RubyIdentifier ctermfg=45
highlight RubyPseudoVariable ctermfg=29
highlight RubySymbol ctermfg=46
highlight RubyString ctermfg=128
highlight RubyStringDelimiter ctermfg=13
highlight RubyComment ctermfg=243
highlight RubyControl ctermfg=49
"---JS Syntax Colors---
highlight javaScriptFunction ctermfg=47
highlight javaScriptRepeat ctermfg=28
highlight javaScriptParens ctermfg=57
highlight javaScriptStringS ctermfg=36
highlight javaScriptStringD ctermfg=41
highlight javaScriptStatement ctermfg=38
highlight javaScriptBraces ctermfg=105
highlight javaScriptIdentifier ctermfg=37
highlight javaScriptLineComment ctermfg=67
highlight javaScriptComment ctermfg=67
highlight javaScriptNull ctermfg=20
highlight javaScriptValue ctermfg=99
highlight javaScriptBoolean ctermfg=75
highlight javaScriptRegexpString ctermfg=160
"---HTML Syntax Colors---
highlight htmlComment ctermfg=62
highlight htmlCommentPart ctermfg=62
highlight htmlString ctermfg=37
highlight htmlTagName ctermfg=93
highlight htmlTag ctermfg=45
highlight htmlSpecialChar ctermfg=40
highlight htmlLink ctermfg=40
"ag grep stuff
let g:ctrlp_match_window                 = 'results:100'
let g:ctrlp_use_caching                  = 0
let g:ctrlp_user_command                 = 'ag %s -l -g ""'
set grepprg=ag\ --nogroup\ --nocolor\ --ignore-case\ --column

"custom ctrlp ignoring (doesn't work)
"let g:ctrlp_custom_ignore = '\*node_module*\'
"attempt to make ctrlp only look at the current directory and its children
let g:ctrlp_working_path_mode = '0'
"relative line numbering
set relativenumber
set number
"Make it so onlu the current split has a highlight
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cul
    autocmd WinLeave * set nocul
augroup END
"map nerddtree to ctrl n
map <silent> <C-n> :NERDTreeFocus<CR>
"set a different key to enter an esc

"make tabs less ridiculous
set tabstop=2
set shiftwidth=2
set expandtab
set smarttab
"fix backspace
set backspace=2
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
"Make vim dynamically update as changes to the vimrc are made
"doesn't always work
augroup reload_vimrc " {
        autocmd!
        autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }
"show a little symbol at linebreaks
"set showbreak=↪ 

"Creates a clipboard separate from the vim buffer that you can paste from with
"f1 and copy to with f2
nmap <F2> :set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
imap <F2> <Esc>:set paste<CR>:r !pbpaste<CR>:set nopaste<CR>
nmap <F1> :.w !pbcopy<CR><CR>
vmap <F1> :w !pbcopy<CR><CR>
"Dont use Syntastic in HTML Files
let g:syntastic_mode_map = {
        \ "mode": "active",
        \ "active_filetypes": ["javascript"],
        \ "passive_filetypes": ["ruby", "html", "typescript"] }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint', 'flow']

" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Neocomplete dictionary stuff
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 2

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
        \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
"neocomplete colors
highlight Pmenu ctermbg=55 ctermfg=45 cterm=bold 
highlight PmenuSel ctermbg=93 ctermfg=14 cterm=bold  
"CtrlP mapping -:help ctrlp to look at more  
let g:ctrlp_prompt_mappings = { 'PrtExit()' : ['<esc>', '<c-c>']}

