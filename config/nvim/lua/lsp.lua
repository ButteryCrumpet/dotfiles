local lsp = require("lsp-zero").preset("recommended")
local nvim_lsp = require("lspconfig")
local tb = require("telescope.builtin")

require("mason").setup()
require("mason-lspconfig").setup()

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		markdown = { "markdownlint" },
		python = { "black" },
		php = { "php-cs-fixer" },
		rust = { "rustfmt" },
		ocaml = { "ocamlformat" },
		go = { "gofmt" },
		sql = { "sql_formatter" },
		blade = { "blade-formatter" },
		zig = { "zigfmt" },
	},
	format_on_save = {
		timout_ms = 500,
		lsp_fallback = true,
	},
})

require("lint").linters_by_ft = {
	typescript = { "eslint_d" },
	javascript = { "eslint_d" },
	typescriptreact = { "eslint_d" },
	javascriptreact = { "eslint_d" },
	markdown = { "markdownlint" },
	php = { "phpcs" },
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

lsp.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			hint = { enable = true },
		},
	},
})

lsp.configure("tsserver", {
	settings = {
		typescript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
		javascript = {
			inlayHints = {
				includeInlayParameterNameHints = "all",
				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
				includeInlayFunctionParameterTypeHints = true,
				includeInlayVariableTypeHints = true,
				includeInlayVariableTypeHintsWhenTypeMatchesName = false,
				includeInlayPropertyDeclarationTypeHints = true,
				includeInlayFunctionLikeReturnTypeHints = true,
				includeInlayEnumMemberValueHints = true,
			},
		},
	},
	single_file_support = false,
	root_dir = function(fname)
		local project = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json")(fname)
		local git = nvim_lsp.util.find_git_ancestor(fname)
		return git or project or nvim_lsp.util.path.dirname(fname)
	end,
})

nvim_lsp.ccls.setup({
	init_options = {
		compilationDatabaseDirectory = "build",
		index = {
			threads = 0,
		},
		clang = {
			excludeArgs = { "-frounding-math" },
		},
	},
})

lsp.on_attach(function(_, bufnr)
	local opts = { buffer = bufnr, silent = true }
	lsp.default_keymaps({ buffer = bufnr })

	vim.keymap.set("n", "gd", function()
		tb.lsp_definitions()
	end, opts)
	vim.keymap.set("n", "gr", function()
		tb.lsp_references()
	end, opts)
	vim.keymap.set("n", "gD", function()
		tb.diagnostics()
	end, opts)
end)

lsp.setup()

require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})
require("copilot_cmp").setup()
