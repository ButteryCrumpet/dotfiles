local Plug = vim.fn["plug#"]
vim.call("plug#begin", "~/.vim/plugged")
-- Deps
Plug("nvim-lua/plenary.nvim")
Plug("lewis6991/impatient.nvim")

-- Debugging
Plug("mfussenegger/nvim-dap")
Plug("Pocco81/dap-buddy.nvim")
Plug("nvim-neotest/nvim-nio")
Plug("rcarriga/nvim-dap-ui")

-- LSP
Plug("neovim/nvim-lspconfig")
Plug("williamboman/mason.nvim", {
	run = function()
		pcall(vim.cmd, "MasonUpdate")
	end,
})
Plug("williamboman/mason-lspconfig.nvim")
Plug("stevearc/conform.nvim")
Plug("mfussenegger/nvim-lint")
Plug("zbirenbaum/copilot.lua")

-- AutoCompletion
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("hrsh7th/cmp-buffer")
Plug("hrsh7th/cmp-path")
Plug("L3MON4D3/LuaSnip")
Plug("saadparwaiz1/cmp_luasnip")
Plug("zbirenbaum/copilot-cmp")

-- Auto Config
Plug("VonHeikemen/lsp-zero.nvim", { branch = "v3.x" })

-- Navigation
Plug("folke/which-key.nvim")
Plug("stevearc/oil.nvim")
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
Plug("vrischmann/tree-sitter-templ")
Plug("romgrk/nvim-treesitter-context")
Plug("ziontee113/syntax-tree-surfer")
Plug("nvim-treesitter/playground")

-- Airline
Plug("vim-airline/vim-airline")
Plug("vim-airline/vim-airline-themes")

-- Themes
Plug("chriskempson/base16-vim")
Plug("dikiaap/minimalist")
Plug("marko-cerovac/material.nvim")
Plug("danilo-augusto/vim-afterglow")
Plug("folke/tokyonight.nvim")

-- UX
Plug("tpope/vim-surround")
Plug("windwp/nvim-autopairs")
Plug("numToStr/Comment.nvim")
Plug("JoosepAlviste/nvim-ts-context-commentstring")
Plug("lewis6991/gitsigns.nvim")
Plug("lukas-reineke/indent-blankline.nvim")
Plug("romainl/vim-cool")
Plug("folke/trouble.nvim")
Plug("nvim-telescope/telescope-ui-select.nvim")

vim.call("plug#end")

-- Airline
vim.g.airline_theme = "minimalist"
vim.g.airline_extensions = { "branch", "hunks" }
vim.g.airline_section_z = vim.fn["airline#section#create"]({ "linenr" })
vim.g.airline_skip_empty_sections = 1
vim.g["airline#extensions#tabline#formatter"] = "unique_tail"
vim.g["airline#extensions#default#layout"] = { { "a", "b", "c" }, { "x", "z", "warning", "error" } }
vim.g.airline_exclude_preview = 1
vim.g.airline_powerline_fonts = 1
vim.g.airline_highlighting_cache = 1
if not vim.g.airline_symbols then
	vim.g.airline_symbols = {}
end
vim.g["airline#extensions#hunks#enabled"] = 0

-- Block Indenting
vim.api.nvim_set_keymap("v", "<", "<gv", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", ">", ">gv", { noremap = true, silent = true })

require("impatient")
require("treesitter")
require("telescope-conf")
require("comp")
require("lsp")
require("settings")
require("colour")
require("autopairs")
require("comment")
require("keybindings")
require("gitsigns-conf")
require("dap-conf")
require("oil-conf")

require("trouble").setup({})
