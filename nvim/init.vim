" VIM PLUGINS
call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'nvim-tree/nvim-tree.lua'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'nvim-lua/plenary.nvim' " dependency for telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'justinmk/vim-sneak'
Plug 'kylechui/nvim-surround'
Plug 'nvim-lualine/lualine.nvim'
Plug 'akinsho/bufferline.nvim', { 'tag': '*' }
Plug 'windwp/nvim-autopairs'
Plug 'lervag/vimtex'
" Plug 'puremourning/vimspector'
" Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'kyazdani42/nvim-web-devicons'
" Plug 'fannheyward/telescope-coc.nvim'
Plug 'numToStr/Comment.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'
Plug 'neovim/nvim-lspconfig'
call plug#end()

syntax on
let g:gruvbox_contrast_dark = 'hard'

colorscheme gruvbox
set bg=dark
let $NVIM_TUI_ENABLE_TRUE_COLOR=1
set termguicolors

set number relativenumber
set signcolumn=no
let b:signcolumn_on=0
set noerrorbells
set tabstop=4
set shiftwidth=4
set pumheight=10
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
set fo-=ro "if doesn't work, might be a problem in ftplugin/vim.vim
set backspace=indent,eol,start "make backspace work like in other programs
set mouse=a
set inccommand=nosplit " interactive feedback when substituting
"----------Keymaps and general stuff----------
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
nnoremap <leader>bd :bd<CR>
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
inoremap <M-h> <C-o>^
inoremap <M-l> <C-o>$
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
nnoremap <silent> <leader>, :vs ~/.config/nvim/init.vim<CR>
nnoremap <silent> <leader>. :source ~/.config/nvim/init.vim<CR>
nnoremap <silent> <tab> :bn<CR>
nnoremap <silent> <s-tab> :bp<CR>
" term
tnoremap <Esc> <C-\><C-n>
tnoremap jk <C-\><C-n>
autocmd TermOpen * setlocal nonumber norelativenumber
autocmd InsertEnter * let @/ = ""
autocmd BufWritePre * %s/\s\+$//e "removing trailing whitespace when saving
autocmd FileType plaintex,tex,latex
    \ syntax spell toplevel |
    \ set spelllang=en_us spell
nnoremap <leader>s 1z=
" compile and run
autocmd filetype cpp nnoremap <F1> :w <CR>:!g++ --std=c++11 -Wall -Werror -g % -o %:r && ./%:r<CR>
autocmd filetype cpp nnoremap <leader>g :w <CR>:!g++ --std=c++11 -Wall -Werror -g % -o %:r<CR>
autocmd filetype c nnoremap <silent> <leader>vs :silent !cp -n /home/michael/.vim/plugged/vimspector/configurations/linux/c/default.json .vimspector.json<CR>:vs .vimspector.json<CR>
autocmd filetype cpp nnoremap <silent> <leader>vs :silent !cp -n /home/michael/.vim/plugged/vimspector/configurations/linux/cpp/default.json .vimspector.json<CR>:vs .vimspector.json<CR>
autocmd filetype python nnoremap <silent> <leader>vs :silent !cp -n /home/michael/.vim/plugged/vimspector/configurations/linux/python/default.json .vimspector.json<CR>:vs .vimspector.json<CR>
autocmd Filetype python nnoremap <F1> :w<CR>:!python3 %<CR>
" recognize tsx files as typescript
augroup SyntaxSettings
    autocmd!
    autocmd BufRead,BufNewFile *.jsx set filetype=javascriptreact
    autocmd BufRead,BufNewFile *.tsx set filetype=typescriptreact
augroup END
" disable concealing
autocmd Filetype json
  \ let g:vim_json_syntax_conceal = 0
autocmd Filetype tex let g:tex_conceal=""
" toggle sign column
nnoremap <silent> <leader>1 :call ToggleSignColumn()<CR>
highlight clear SignColumn
function! ToggleSignColumn()
    if !exists("b:signcolumn_on") || b:signcolumn_on
        set signcolumn=no
        let b:signcolumn_on=0
    else
        set signcolumn=yes
        let b:signcolumn_on=1
    endif
endfunction

" NvimTree
nnoremap <silent> <C-n> :NvimTreeToggle<CR>

" yank
augroup highlight_yank
    autocmd!
    au TextYankPost * silent! lua vim.highlight.on_yank {higroup='IncSearch', timeout=700}
augroup END

" vimsneak
let g:sneak#use_ic_scs = 1

" nerdcommenter
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" vimtex
let g:tex_flavor = "latex"
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_view_general_viewer="SumatraPDF.exe"
let g:vimtex_view_general_options=expand('%:r') . '.pdf'

nnoremap <leader>ff <cmd>lua project_files()<cr>
nnoremap <leader>fg <cmd>lua grep_project()<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>fs <cmd>Telescope lsp_workspace_symbols<cr>

hi! link BufferLineErrorSelected GruvboxRed
hi! link BufferLineErrorDiagnosticSelected GruvboxRed
hi! link Type GruvboxRed

lua require('init')
