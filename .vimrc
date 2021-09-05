call plug#begin('~/.vim/plugged')

" Manipulate surrounding elements
Plug 'tpope/vim-surround'

" Allow gc to comment selections
Plug 'tpope/vim-commentary'

" Theme
Plug 'rakr/vim-one'
Plug 'ryanoasis/vim-devicons'

" Status bar
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

" Snippets
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Syntax highlighting
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nelsyeung/twig.vim'

" Wiki
Plug 'vimwiki/vimwiki'

" Test Runner
Plug 'vim-test/vim-test'

" Linting and Syntax
Plug 'dense-analysis/ale'

" Javascript formatting
Plug 'yuezk/vim-js'

" Autopairs enabled
Plug 'jiangmiao/auto-pairs'

" Highlight yanks
Plug 'machakann/vim-highlightedyank'

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'fannheyward/telescope-coc.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Registers
Plug 'junegunn/vim-peekaboo'

" Git gutter
Plug 'mhinz/vim-signify'

" Git in Vim
Plug 'tpope/vim-fugitive'

" Code Completetion and Explorer
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Startify
Plug 'mhinz/vim-startify'

" Diff Conflicts
Plug 'whiteinge/diffconflicts'

" Undo Options
Plug 'mbbill/undotree'

call plug#end()

" enable all features on neovim and vim
set nocompatible

" detect file type
filetype plugin on

" set a leader
let mapleader=","

" enable a full suite of rich colours
set termguicolors

" enable syntax highlighting
syntax on

" show line numbers
set number

" scroll before we hit the top or bottom
set scrolloff=8

" set an amazing colour scheme
set background=dark
colorscheme one

" Move visual selection with SHIFT+J/K
vnoremap J :m '>+1<cr>gv=gv
vnoremap K :m '<-2<cr>gv=gv

" store load of commands in the history
set history=500

" set what character to use with vertical splits
set fillchars+=vert:│

" show a line where 120 characters is when editing
set colorcolumn=120

" reload file if it changes outside of vim
set autoread

" silly bell
set visualbell
set t_vb=

" no wrapping
set nowrap

" show whitespace characters
set list

" spelling is hard
set spell spelllang=en_gb

" replace any tabs with spaces because we are not psychos
set expandtab

" set the default tab spacing
set tabstop=4
set softtabstop=4
set shiftwidth=4
set smartindent

" tab between buffers
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprev<CR>

" set spacing for various filetypes
autocmd Filetype javascript setlocal ts=2 sw=2 sts=2

" set split strategy
set splitbelow
set splitright

" no backups
set nobackup
set noswapfile
set nowritebackup

" hide abandoned buffers, meaning if we have unsaved changes in a buffer we
" can open another one without being forced to save.
set hidden

" show the sign column for things like git
set signcolumn=yes

" ignore some files and folders that we will just never edit
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.idea/*,*/vendor/*,*/storage/*,*/cache/*,*/node_modules/*,*/bower_components/*

" remove gutter/numbers background colour
highlight LineNr cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
highlight clear SignColumn
highlight SignColumn ctermbg=NONE

" set some sensible tab colours
highlight TabLineFill cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
highlight TabLine cterm=NONE ctermfg=NONE ctermbg=NONE gui=NONE guifg=NONE guibg=NONE
highlight TabLineSel ctermfg=Black ctermbg=Yellow

" remap jj as shortcut to get out of insert mode
imap jj <Esc>

" insert mode, press CTRL-A (or <leader> a) to jump to the end of the line and stay in insert mode
" <leader> a - added after the fact since CTRL A feels a bit clunky when used
" in  fast flowing text typing session
inoremap <C-a> <C-o>$
inoremap <leader>a <C-o>$

" disable the evil arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" map Ctrl+HJKL to move between splits
nnoremap <C-H> <C-W><C-H>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>

" create vertical splits with <leader>v
nmap <leader>v :vnew<CR>

" close all location lists and quickfix windows in one key
nmap <leader>. :windo lcl\|ccl<CR>

" create horizontal splits with <leader>h
nmap <leader>h :sp<CR>

" save files with <leader>s
nmap <leader>s :w<CR>

" jump to the config file for vim
nmap <leader><leader>v :e ~/.vimrc<CR>
nmap <leader>c :Telescope file_browser cwd=~/.config/nvim<CR>

" close buffer
nmap <leader>x :bd<CR>

" next buffer
nmap <leader>bn :bn<CR>

" previous buffer
nmap <leader>bp :bn<CR>

" set custom vim config filetype
autocmd BufNewFile,BufRead .vim.custom set ft=vim

" remove all end of line whitespace in the buffer on save
autocmd BufWritePre * :%s/\s\+$//e

" when opening blade files set type to html
autocmd BufNewFile,BufRead *.blade.php set ft=html

" Peekaboo / Register Settings
let g:peekaboo_window = 'vertical botright 80new'

" Highlighted Yank
let g:highlightedyank_highlight_duration = 250

" Update time
set updatetime=100

" set comment types for these file types
autocmd FileType php setlocal commentstring=//\ %s
autocmd FileType vue setlocal commentstring=//\ %s

luafile ~/.config/nvim/lualine.lua
source ~/.config/nvim/snippets.vim
source ~/.config/nvim/treesitter.vim
source ~/.config/nvim/coc.vim
source ~/.config/nvim/startify.vim
source ~/.config/nvim/telescope.vim
source ~/.config/nvim/fugitive.vim
source ~/.config/nvim/undotree.vim
source ~/.config/nvim/ale.vim
source ~/.config/nvim/vim-test.vim
