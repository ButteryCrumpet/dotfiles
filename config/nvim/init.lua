vim.pack.add({
	--Deps
	{ src = "https://github.com/nvim-lua/plenary.nvim" },
	{ src = "https://github.com/lewis6991/impatient.nvim" },

	-- Debugging
	{ src = "https://github.com/mfussenegger/nvim-dap" },
	{ src = "https://github.com/Pocco81/dap-buddy.nvim" },
	{ src = "https://github.com/nvim-neotest/nvim-nio" },
	{ src = "https://github.com/rcarriga/nvim-dap-ui" },

	-- LSP
	{ src = "https://github.com/neovim/nvim-lspconfig" },
	{ src = "https://github.com/williamboman/mason.nvim"},
	{ src = "https://github.com/williamboman/mason-lspconfig.nvim" },
	{ src = "https://github.com/stevearc/conform.nvim" },
	{ src = "https://github.com/mfussenegger/nvim-lint" },
	{ src = "https://github.com/zbirenbaum/copilot.lua" },

	-- AutoCompletion
	{ src = "https://github.com/hrsh7th/nvim-cmp" },
	{ src = "https://github.com/hrsh7th/cmp-nvim-lsp" },
	{ src = "https://github.com/hrsh7th/cmp-buffer" },
	{ src = "https://github.com/hrsh7th/cmp-path" },
	{ src = "https://github.com/L3MON4D3/LuaSnip" },
	{ src = "https://github.com/saadparwaiz1/cmp_luasnip" },
	{ src = "https://github.com/zbirenbaum/copilot-cmp" },

	-- Auto Config
	{ src = "https://github.com/VonHeikemen/lsp-zero.nvim", branch = "v3.x" },

	-- Navigation
	{ src = "https://github.com/folke/which-key.nvim" },
	{ src = "https://github.com/stevearc/oil.nvim" },
	{ src = "https://github.com/ryanoasis/vim-devicons" },
	{ src = "https://github.com/airblade/vim-gitgutter" },
	{ src = "https://github.com/scrooloose/nerdcommenter" },
	{ src = "https://github.com/nvim-telescope/telescope.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-fzf-native.nvim", ["do"] = "make" },
	{ src = "https://github.com/nvim-telescope/telescope-dap.nvim" },

	-- Language extentions
	{ src = "https://github.com/vim-erlang/vim-erlang-runtime" },
	{ src = "https://github.com/reasonml-editor/vim-reason-plus" },
	{ src = "https://github.com/christoomey/vim-tmux-navigator" },
	{ src = "https://github.com/raichoo/purescript-vim" },
	{ src = "https://github.com/styled-components/vim-styled-components", branch = "main" },
	{ src = "https://github.com/pantharshit00/vim-prisma" }, -- TODO: treesitter-base one
	{ src = "https://github.com/liuchengxu/graphviz.vim" },
	{ src = "https://github.com/jwalton512/vim-blade" },
	{ src = "https://github.com/MeanderingProgrammer/render-markdown.nvim" },

	-- Treesitter
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter", version = "main" },
	{ src = "https://github.com/vrischmann/tree-sitter-templ" },
	{ src = "https://github.com/romgrk/nvim-treesitter-context" },
	{ src = "https://github.com/ziontee113/syntax-tree-surfer" },

	-- Airline
	{ src = "https://github.com/vim-airline/vim-airline" },
	{ src = "https://github.com/vim-airline/vim-airline-themes" },

	-- Themes
	{ src = "https://github.com/chriskempson/base16-vim" },
	{ src = "https://github.com/dikiaap/minimalist" },
	{ src = "https://github.com/marko-cerovac/material.nvim" },
	{ src = "https://github.com/danilo-augusto/vim-afterglow" },
	{ src = "https://github.com/folke/tokyonight.nvim" },
	{ src = "https://github.com/ribru17/bamboo.nvim" },

	-- UX
	{ src = "https://github.com/tpope/vim-surround" },
	{ src = "https://github.com/windwp/nvim-autopairs" },
    	{ src = "https://github.com/numToStr/Comment.nvim" },
	-- { src = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring" },
	{ src = "https://github.com/lewis6991/gitsigns.nvim" },
	{ src = "https://github.com/lukas-reineke/indent-blankline.nvim" },
	{ src = "https://github.com/romainl/vim-cool" },
	{ src = "https://github.com/folke/trouble.nvim" },
	{ src = "https://github.com/nvim-telescope/telescope-ui-select.nvim" }

})

vim.api.nvim_create_autocmd({'PackChanged'}, {
	callback = function(args)
		if args.data.kind ~= 'delete' and args.data.spec.name == 'telescope-fzf-native.nvim' then
			os.execute("cd " .. args.data.path .. " && make")
		end
	end,
})


-- Airline
vim.g.airline_theme = "minimalist"
vim.g.airline_extensions = { "branch", "hunks" }
vim.g.airline_section_z = vim.fn["airline#section#create"]({ "linenr", "colnr" })
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

vim.filetype.add({
	extension = {
		frag = "glsl",
		vert = "glsl",
	},
})

require("impatient")
-- require("treesitter")
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
