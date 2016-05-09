" disable original vi compataiblity
set runtimepath=~/.vim,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after
set nocompatible

" pathogen
execute pathogen#infect()
syntax on
filetype plugin indent on

" CUSTOM SETTINGS BEGIN #######################################################
"
" no compatible
" enable syntax highlighting
syntax on
syntax enable

" leave hidden buffers open
set hidden

" don't wrap long lines
set nowrap

" tpop's sensible settings
set number " show line number in the right corner
set ruler " display line numbers to the left
set showcmd " show last command line
set autoread " watch the file for outside changes
set fileformats+=mac " end of lines format (default is unix)
set history=1000 " default of 20 is too low

set incsearch " live incremental search 
set hlsearch " highlight matching search text
set ignorecase " ignore case when searching
set smartcase

set so=5 " *bottom and top display margins *

" replace tabs with spaces
set expandtab
set smarttab
set shiftwidth=4
set softtabstop=4
set ai " autoindent

" don't clutter current directory with temp files 
set backup
set backupdir=~/.vim/backup
set directory=~/.vim/tmp

" add plugin documentation directory to path"
set path+='~/.vim/doc/'

" viminfo
set viminfo="~/.viminfo"
set modeline

" gui
set wildmenu
set wildmode=list:longest,full
set mouse=a

" Eye candy stuff
set t_Co=256
colo molokai
let g:rehash256 = 1
let g:molokai_original = 1

let mapleader = ","

" CUSTOM SETTINGS END ##########################################################


" CUSTOM MAPPINGS BEGIN  #######################################################
"

" escape by typing jj
inoremap jj <Esc>
cnoremap jj <Esc>
vnoremap <C-j> <Esc>

" $ and ^ are too annoying to read for such a common command
noremap A $
noremap I ^

" write file as root, useful
command W w !sudo tee % > /dev/null

noremap <Leader>k :edit .<Return>

" CUSTOM MAPPINGS END ##########################################################


" ultisnips stuff
let g:UltiSnipsExpandTrigger="<c-L>"
let g:UltiSnipsJumpForwardTrigger="<c-J>"
let g:UltiSnipsJumpBackwardTrigger="<c-K>"

" yaml shiftwidth
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2