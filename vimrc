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
nnoremap <Enter> o<ESC>
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
nnoremap <silent> <tab> :bn<CR>
nnoremap <silent> <s-tab> :bp<CR>
" ## added by OPAM user-setup for vim / base ## 93ee63e278bdfc07d1139a748ed3fff2 ## you can edit, but keep this line
let s:opam_share_dir = system("opam config var share")
let s:opam_share_dir = substitute(s:opam_share_dir, '[\r\n]*$', '', '')

let s:opam_configuration = {}

function! OpamConfOcpIndent()
  execute "set rtp^=" . s:opam_share_dir . "/ocp-indent/vim"
endfunction
let s:opam_configuration['ocp-indent'] = function('OpamConfOcpIndent')

function! OpamConfOcpIndex()
  execute "set rtp+=" . s:opam_share_dir . "/ocp-index/vim"
endfunction
let s:opam_configuration['ocp-index'] = function('OpamConfOcpIndex')

function! OpamConfMerlin()
  let l:dir = s:opam_share_dir . "/merlin/vim"
  execute "set rtp+=" . l:dir
endfunction
let s:opam_configuration['merlin'] = function('OpamConfMerlin')

let s:opam_packages = ["ocp-indent", "ocp-index", "merlin"]
let s:opam_check_cmdline = ["opam list --installed --short --safe --color=never"] + s:opam_packages
let s:opam_available_tools = split(system(join(s:opam_check_cmdline)))
for tool in s:opam_packages
  " Respect package order (merlin should be after ocp-index)
  if count(s:opam_available_tools, tool) > 0
    call s:opam_configuration[tool]()
  endif
endfor
" ## end of OPAM user-setup addition for vim / base ## keep this line
" ## added by OPAM user-setup for vim / ocp-indent ## ead54c1986b84042c350bd11d94d63b4 ## you can edit, but keep this line
if count(s:opam_available_tools,"ocp-indent") == 0
  source "/home/michael/.opam/5.1.0/share/ocp-indent/vim/indent/ocaml.vim"
endif
" ## end of OPAM user-setup addition for vim / ocp-indent ## keep this line
