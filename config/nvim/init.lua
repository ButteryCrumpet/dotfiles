local Plug = vim.fn["plug#"]
vim.call("plug#begin", "~/.vim/plugged")
-- Deps
Plug("nvim-lua/plenary.nvim")
Plug("lewis6991/impatient.nvim")

-- Debugging
Plug("mfussenegger/nvim-dap")
Plug("Pocco81/dap-buddy.nvim")
Plug("rcarriga/nvim-dap-ui")

-- LSP
Plug("neovim/nvim-lspconfig")
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("L3MON4D3/LuaSnip")
Plug("saadparwaiz1/cmp_luasnip")
Plug("jose-elias-alvarez/null-ls.nvim")
Plug("github/copilot.vim")

-- Navigation
Plug("folke/which-key.nvim")
Plug("scrooloose/nerdtree")
Plug("Xuyuanp/nerdtree-git-plugin")
Plug("tiagofumo/vim-nerdtree-syntax-highlight")
Plug("ryanoasis/vim-devicons")
Plug("airblade/vim-gitgutter")
Plug("scrooloose/nerdcommenter")
Plug("nvim-telescope/telescope.nvim")
Plug("nvim-telescope/telescope-fzf-native.nvim", { ["do"] = "make" })
Plug("nvim-telescope/telescope-dap.nvim")

-- Language extentions
Plug("vim-erlang/vim-erlang-runtime")
Plug("reasonml-editor/vim-reason-plus")
Plug("christoomey/vim-tmux-navigator")
Plug("raichoo/purescript-vim")
Plug("styled-components/vim-styled-components", { branch = "main" })
Plug("pantharshit00/vim-prisma") -- TODO: treesitter-base one
Plug("liuchengxu/graphviz.vim")
Plug("jwalton512/vim-blade")

-- Treesitter
Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug("romgrk/nvim-treesitter-context")
Plug("ziontee113/syntax-tree-surfer")

-- Airline
Plug("vim-airline/vim-airline")
Plug("vim-airline/vim-airline-themes")

-- Themes
Plug("chriskempson/base16-vim")
Plug("dikiaap/minimalist")
Plug("marko-cerovac/material.nvim")
Plug("danilo-augusto/vim-afterglow")

-- UX
Plug("tpope/vim-surround")
Plug("windwp/nvim-autopairs")
Plug("numToStr/Comment.nvim")
Plug("JoosepAlviste/nvim-ts-context-commentstring")
Plug("lewis6991/gitsigns.nvim")
Plug("lukas-reineke/indent-blankline.nvim")
Plug("romainl/vim-cool")
Plug("folke/trouble.nvim")

vim.call("plug#end")

-- Nerdtree
vim.api.nvim_set_keymap("i", "jk", "<ESC>", { noremap = true })
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeGitStatusWithFlags = 1
vim.g.NERDTreeIgnore = { "^node_modules$", "\\.git$[[dir]]" }

-- Airline
vim.g.airline_theme = "minimalist"
vim.g.airline_extensions = { "branch", "hunks" }
vim.g.airline_section_z = vim.fn["airline#section#create"]({ "linenr" })
vim.g.airline_skip_empty_sections = 1
vim.g["airline#extensions#tabline#formatter"] = "unique_tail"
vim.g["airline#extensions#default#layout"] = { { "a", "b", "c" }, { "x", "z", "warning", "error" } }
vim.g.NERDTreeStatusline = ""
vim.g.airline_exclude_preview = 1
vim.g.airline_powerline_fonts = 1
vim.g.airline_highlighting_cache = 1
if not vim.g.airline_symbols then
	vim.g.airline_symbols = {}
end
vim.g["airline#extensions#hunks#enabled"] = 0

vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

require("impatient")
require("settings")
require("lsp")
require("comp")
require("autopairs")
require("treesitter")
require("comment")
require("telescope-conf")
require("keybindings")
require("gitsigns-conf")
require("dap-conf")

vim.opt.foldmethod = "expr"
vim.opt.foldcolumn = "1"
vim.opt.foldlevelstart = 99
vim.opt.foldexpr = vim.fn["nvim_treesitter#foldexpr"]()

-- GUI
vim.cmd([[
  syntax enable
  colorscheme base16-default-dark
  set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
  set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto
]])
vim.opt.background = "dark"
vim.g.oceanic_next_terminal_bold = 1
vim.g.oceanic_next_terminal_italic = 1
vim.opt.guifont = "SourceCodePro"

-- Copilot
vim.g.copilot_no_tab_map = true
vim.api.nvim_set_keymap("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })

require("trouble").setup({})
