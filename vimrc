syntax on
set number relativenumber
set signcolumn=no
let b:signcolumn_on=0
set noerrorbells
set tabstop=4
set shiftwidth=4
set noautoindent
set expandtab
set noswapfile
set nobackup
set hlsearch
set ruler
set hidden
set splitright
set splitbelow
set ignorecase
set smartcase
set fo-=ro
set backspace=indent,eol,start "make backspace work like in other programs
set mouse=a
inoremap jk <ESC>
let mapleader = "\<Space>"
let maplocalleader = "\<Space>"
noremap <Space> <Nop>
nnoremap <expr> k v:count == 0 ? 'gk' : 'k'
nnoremap <expr> j v:count == 0 ? 'gj' : 'j'
vnoremap <expr> k v:count == 0 ? 'gk' : 'k'
vnoremap <expr> j v:count == 0 ? 'gj' : 'j'
nnoremap gj j
nnoremap gk k
vnoremap gj j
vnoremap gk k
" switching between windows
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>wq <C-w>q
nnoremap <leader>wo <C-w>o
nnoremap <leader>wh <C-w>H
nnoremap <leader>wj <C-w>J
nnoremap <leader>wk <C-w>K
nnoremap <leader>wl <C-w>L
autocmd BufEnter * silent! :lcd%:p:h
" copy and paste
vmap <C-c> "+y
vmap <C-x> "+c
inoremap <C-v> <ESC>"+pa
nnoremap <leader>p "+p
" resize
nnoremap <silent> <Up> :resize +2<CR>
nnoremap <silent> <Down> :resize -2<CR>
nnoremap <silent> <Left> :vertical resize +2<CR>
nnoremap <silent> <Right> :vertical resize -2<CR>
" random stuff
nnoremap <M-j> <C-e>
nnoremap <M-k> <C-y>
vnoremap <M-j> <C-e>
vnoremap <M-k> <C-y>
nnoremap <M-h> ^
nnoremap <M-l> $
vnoremap <M-h> ^
vnoremap <M-l> $
inoremap <M-j> <C-x><C-e>
inoremap <M-k> <C-x><C-y>
inoremap <CR> <CR> <BS>
nnoremap o o <BS>
nnoremap O O <BS>
nnoremap Y y$
nnoremap - ^
vnoremap - ^
inoremap <C-d> <DELETE>
inoremap <C-BS> <C-w>
nnoremap ` ~
vnoremap ` ~
vnoremap > >gv
vnoremap <s-lt> <gv
vnoremap < <gv
autocmd InsertEnter * let @/ = ""
autocmd BufWritePre * %s/\s\+$//e "removing trailing whitespace when saving
