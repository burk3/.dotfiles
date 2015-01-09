set nocompatible

" vundle section {{{
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" my vundles
Bundle 'Lokaltog/vim-powerline'
Bundle 'vim-scripts/Diablo3'
Bundle 'pfdevilliers/Pretty-Vim-Python'
Bundle 'vim-scripts/ScrollColors'
Bundle 'godlygeek/csapprox'
Bundle 'kien/ctrlp.vim'
" Bundle 'vim-scripts/doxygen-support.vim'
Bundle 'shawncplus/phpcomplete.vim'
" Bundle 'vim-scripts/slimv.vim'
Bundle 'scrooloose/syntastic'
Bundle 'kien/tabman.vim'
Bundle 'majutsushi/tagbar'
Bundle 'kchmck/vim-coffee-script'
Bundle 'basepi/vim-conque'
Bundle 'tpope/vim-fugitive'
Bundle 'nathanaelkane/vim-indent-guides'
Bundle 'helino/vim-json'
Bundle 'tpope/vim-pathogen'
Bundle 'tpope/vim-surround'
Bundle 'Lokaltog/vim-easymotion'
Bundle 'nanotech/jellybeans.vim'
Bundle 'StanAngeloff/php.vim'
Bundle 'sjl/gundo.vim'
Bundle 'arc.vim'
Bundle 'AndrewRadev/switch.vim'
Bundle 'proton'
Bundle 'vimoutliner/vimoutliner'
Bundle 'nginx.vim'
Bundle 'ekalinin/Dockerfile.vim'

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

" indentation and comments
set cindent
set smartindent
set autoindent
set tabstop=2
set shiftwidth=2
set fo=rocqt
set comments=sl:/**,mbr:\ *,erx:\ */
set noexpandtab
set foldmethod=marker

" python doesnt like tabs
autocmd FileType py set expandtab

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
let g:Powerline_symbols = 'unicode'

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
