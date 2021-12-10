call plug#begin('~/.vim/plugged')
" Deps
Plug 'nvim-lua/plenary.nvim'
Plug 'lewis6991/impatient.nvim'

" Debugging
Plug 'mfussenegger/nvim-dap'
Plug 'Pocco81/DAPInstall.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'tami5/lspsaga.nvim'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

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

" Language extentions
Plug 'vim-erlang/vim-erlang-runtime'
Plug 'reasonml-editor/vim-reason-plus'
Plug 'christoomey/vim-tmux-navigator'
Plug 'raichoo/purescript-vim'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'pantharshit00/vim-prisma' "TODO: treesitter-base one
Plug 'liuchengxu/graphviz.vim'

" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'romgrk/nvim-treesitter-context'

" Airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Themes
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'chriskempson/base16-vim'
Plug 'dikiaap/minimalist'

" UX
Plug 'tpope/vim-surround'
Plug 'windwp/nvim-autopairs'
Plug 'numToStr/Comment.nvim'
Plug 'JoosepAlviste/nvim-ts-context-commentstring'
Plug 'lewis6991/gitsigns.nvim'

call plug#end()

" GUI
set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto
set background=dark
syntax enable
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme base16-default-dark
set guifont=Hack


" Nerdtree
inoremap jk <ESC>
nmap <C-n> :NERDTreeToggle<CR>
vmap ++ <plug>NERDCommenterToggle
nmap ++ <plug>NERDCommenterToggle
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

" LSP
nnoremap <silent> <leader>cd :Lspsaga show_line_diagnostics<CR>
"nnoremap <silent> <C-[> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
"nnoremap <silent> <C-]> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <C-[> :Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <C-]> :Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent> <C-f> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

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
