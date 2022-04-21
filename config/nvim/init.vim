call plug#begin('~/.vim/plugged')

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'
Plug 'tpope/vim-sensible'
Plug 'junegunn/seoul256.vim'
Plug 'reedes/vim-pencil'
Plug 'mzlogin/vim-markdown-toc'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-css-color'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'makerj/vim-pdf'
Plug 'jelera/vim-javascript-syntax' 
Plug 'moll/vim-node'
Plug 'maksimr/vim-jsbeautify'
Plug 'einars/js-beautify'
Plug 'scrooloose/nerdtree'
Plug 'pangloss/vim-javascript'
Plug 'wincent/command-t'
Plug 'JulesWang/css.vim' " only necessary if your Vim version < 7.4
Plug 'cakebaker/scss-syntax.vim'
Plug 'elzr/vim-json'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'leafgarland/typescript-vim'
Plug 'jason0x43/vim-js-indent'
Plug 'szw/vim-g'
Plug 'scrooloose/nerdcommenter'
" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Multiple Plug commands can be written in a single line using | separators
" Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'
Plug 'vimwiki/vimwiki'

" Initialize plugin system
call plug#end()

" colorscheme darkblue

set number            " show line numbers
set background=dark   " dark background
set showcmd           " Show partial command in status line
set showmatch         " Show matching brackets
set softtabstop=0
set shiftwidth=2
set ruler
set cmdheight=1
set backspace=indent,eol,start
set history=400
set nolist            " list disables linebreak
set autoindent
set linebreak
set nocompatible


syntax on             " Enable syntax highlighting
"set spell spelllang=en_us
" The width of a TAB is set to 4.
" Still it is a \t. It is just that
" Vim will interpret it to be having
" a width of 4.
set tabstop=2
" Indents will have a width of 4
set shiftwidth=2
" Sets the number of columns for a TAB
set softtabstop=2
" Expand TABs to spaces
set expandtab

set autowrite           " Automatially save before commands like :next and :make
set hidden              " Hide buffers when they are abandoned

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '>'
set laststatus=2
let g:airline_powerline_fonts = 1

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

set mouse=a

let g:vim_markdown_folding_level = 6

"Goyo mode on/off by F9
map <F9> :Goyo <bar> <CR>

" Set up a thesaurus
set thesaurus+=/hom/kim/.config/nvim/thesaurus.txt

" disabling "s" from going to insert mode
nnoremap s <Nop>

" Changing leader from \ to ,
let mapleader = ","

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spellcheck Danish set to F6
map <F6> :setlocal spell! spelllang=da<CR>
" Spellcheck English set to F7
map <F7> :setlocal spell! spelllang=en_us<CR>

" open as markdown when the file is named .md
autocmd BufEnter,BufRead,BufNewFile *.md set filetype=markdown
autocmd BufWritePost book.md silent !sh build.sh
autocmd BufWritePost *note-*.md silent !~/.scripts/buildNote %:p


