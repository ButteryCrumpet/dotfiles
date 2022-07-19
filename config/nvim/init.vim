call plug#begin('~/.vim/plugged')
" Deps
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/impatient.nvim'

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'Pocco81/dap-buddy.nvim'
Plug 'rcarriga/nvim-dap-ui'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'jose-elias-alvarez/null-ls.nvim'

" Navigation
Plug 'folke/which-key.nvim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-telescope/telescope-dap.nvim'

" Language extentions
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'christoomey/vim-tmux-navigator'
Plug 'raichoo/purescript-vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pantharshit00/vim-prisma' "TODO: treesitter-base one
Plug 'liuchengxu/graphviz.vim'
Plug 'jwalton512/vim-blade'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'romgrk/nvim-treesitter-context'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'chriskempson/base16-vim'
Plug 'dikiaap/minimalist'

" UX
Plug 'tpope/vim-surround'
Plug 'windwp/nvim-autopairs'
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'lewis6991/gitsigns.nvim'
Plug 'lukas-reineke/indent-blankline.nvim'
Plug 'romainl/vim-cool'

call plug#end()

" Nerdtree
inoremap jk <ESC>
let g:NERDTreeShowHidden = 1
let g:NERDTreeGitStatusWithFlags = 1
let g:NERDTreeIgnore = ['^node_modules$', '\.git$[[dir]]']

" Airline
let g:airline_theme='minimalist'
let g:airline_extensions = ['branch', 'hunks']
let g:airline_section_z = airline#section#create(['linenr'])
let g:airline_skip_empty_sections = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:airline#extensions#default#layout = [['a', 'b', 'c'], ['x', 'z', 'warning', 'error']]
let g:NERDTreeStatusline = ''
let g:airline_exclude_preview = 1
let g:airline_powerline_fonts = 1
let g:airline_highlighting_cache = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline#extensions#hunks#enabled=0

vnoremap <silent> < <gv
vnoremap <silent> > >gv

lua require('impatient')
luafile ~/.config/nvim/lua/settings.lua
luafile ~/.config/nvim/lua/lsp.lua
luafile ~/.config/nvim/lua/comp.lua
luafile ~/.config/nvim/lua/autopairs.lua
luafile ~/.config/nvim/lua/treesitter.lua
luafile ~/.config/nvim/lua/comment.lua
luafile ~/.config/nvim/lua/telescope-conf.lua
luafile ~/.config/nvim/lua/keybindings.lua
luafile ~/.config/nvim/lua/gitsigns-conf.lua
luafile ~/.config/nvim/lua/dap-conf.lua

set foldmethod=expr
set foldcolumn=1
set foldlevelstart=99
set foldexpr=nvim_treesitter#foldexpr()

" GUI
set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto
set background=dark
syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
set guifont=SourceCodePro
colorscheme base16-default-dark
