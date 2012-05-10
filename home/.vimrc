runtime bundle/vim-pathogen/autoload/pathogen.vim
call pathogen#infect()

syntax enable
colorscheme diablo3
set t_Co=256
if &t_Co > 2 || has("gui_running")
  syntax on
endif

" booya. persistent undo. what now
set undodir=~/.cache/vim/undodir
set undofile
set undolevels=1000 "maximum number of changes that can be undone
set undoreload=10000 "maximum number lines to save for undo on a buffer reload

filetype on
filetype plugin indent on
set laststatus=2

" rainbow things

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

" c.vim settings
let c_gnu = 1
let c_vms = 1
let c_C99 = 1

" ctags.vim settings
let g:ctags_path='/usr/bin/ctags'
let g:ctags_statusline=1 
let g:generate_tags=1

" delimitMate settings

" extra syntax application
au BufNewFile,BufRead *.j set filetype=objj

" no clue
set t_RV=

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