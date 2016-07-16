set nocompatible

" vundle section {{{
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

" my vundles
Plugin 'vim-airline/vim-airline'
"Plugin 'vim-airline/vim-airline-themes'
Plugin 'moonkid196/vim-airline-themes'
"Plugin 'vim-scripts/Diablo3'
Plugin 'pfdevilliers/Pretty-Vim-Python'
Plugin 'vim-scripts/ScrollColors'
Plugin 'godlygeek/csapprox'
Plugin 'kien/ctrlp.vim'
" Plugin 'vim-scripts/doxygen-support.vim'
Plugin 'shawncplus/phpcomplete.vim'
" Plugin 'vim-scripts/slimv.vim'
Plugin 'scrooloose/syntastic'
Plugin 'kien/tabman.vim'
Plugin 'majutsushi/tagbar'
Plugin 'kchmck/vim-coffee-script'
Plugin 'basepi/vim-conque'
Plugin 'tpope/vim-fugitive'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'helino/vim-json'
Plugin 'tpope/vim-surround'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'nanotech/jellybeans.vim'
Plugin 'StanAngeloff/php.vim'
Plugin 'sjl/gundo.vim'
"Plugin 'arc.vim'
Plugin 'AndrewRadev/switch.vim'
Plugin 'proton'
"Plugin 'vimoutliner/vimoutliner'
Plugin 'nginx.vim'
Plugin 'ekalinin/Dockerfile.vim'
"Plugin 'sirtaj/vim-openscad'
"Plugin 'confluencewiki.vim'
Plugin 'vim-perl/vim-perl'
Plugin 'pearofducks/ansible-vim'
Plugin 'fatih/vim-go'
Plugin 'elixir-lang/vim-elixir'

call vundle#end()
"vundle section }}}

syntax enable
if &t_Co > 2 || has("gui_running")
  syntax on
  try
    set background=light
    colorscheme proton
  catch /^Vim\%((\a\+)\)\=:E185/
    colorscheme desert
  endtry
endif

" backspace like every other app please
set backspace=2

" booya. persistent undo. what now
set undodir=~/.cache/vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

filetype on
filetype plugin indent on
set laststatus=2

" yey mouse
set mouse=a

" whitespace dopeness
set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:⇥\ 
set list

" indentation and comments
set expandtab
set cindent
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set fo=rocqt
set comments=sl:/**,mbr:\ *,erx:\ */
set foldmethod=marker

" lets just only do tabs for go, c, php, c++
autocmd FileType php set noexpandtab
autocmd FileType go set noexpandtab
autocmd FileType c set noexpandtab
autocmd FileType cpp set noexpandtab
autocmd FileType sh set noexpandtab

" and set some ts/sw for lang defaults
autocmd FileType py set ts=4
autocmd FileType py set sw=4
autocmd FileType json set ts=4
autocmd FileType json set sw=4

" nginx stuf
au BufRead,BufNewFile /etc/nginx/*,/usr/local/nginx/conf/* if &ft == '' | setfiletype nginx | endif


" c.vim settings
let c_gnu = 1
let c_vms = 1
let c_C99 = 1

" ctags.vim settings
let g:ctags_path='/usr/bin/ctags'
let g:ctags_statusline=1
let g:generate_tags=1

" fancy powerline
"let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
let g:airline_theme = 'molokai'


" extra syntax application
au BufNewFile,BufRead *.j set filetype=objj

" no clue
set t_RV=

" BINDINGS !!!

nnoremap - :Switch<cr>

" epic tab commands of awesome tabbliness
nnoremap <c-j> gT
nnoremap <c-k> gt
" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" Emacs bindings in command line mode
cnoremap <c-a> <home>
cnoremap <c-e> <end>

" It's 2011.
noremap j gj
noremap k gk

" Less chording
nnoremap ; :

" epic sudo write
cmap w!! w !sudo tee % >/dev/null

nmap <F8> :TagbarToggle<CR>

" setup some mayansmoke stuff
let g:mayansmoke_search_visibility=4
let g:mayansmoke_cursor_line_visibility=2
" Rainbox Parentheses {{{

nnoremap <leader>R :RainbowParenthesesToggle<cr>
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16


" }}}
