local lsp = require("lsp-zero").preset("recommended")
local nvim_lsp = require("lspconfig")
local tb = require("telescope.builtin")

lsp.ensure_installed({
	"tsserver",
	"lua_ls",
	"rust_analyzer",
})

lsp.configure("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

lsp.configure("tsserver", {
	single_file_support = false,
	root_dir = function(fname)
		local project = nvim_lsp.util.root_pattern("package.json", "tsconfig.json", "jsconfig.json")(fname)
		local git = nvim_lsp.util.find_git_ancestor(fname)
		return git or project or nvim_lsp.util.path.dirname(fname)
	end,
})

lsp.format_on_save({
	format_opts = {
		async = false,
		timeout_ms = 10000,
	},
	servers = {
		["null-ls"] = { "javascript", "typescript", "javascriptreact", "typescriptreact", "lua", "php", "rust" },
	},
})

lsp.on_attach(function(client, bufnr)
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

require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.prettierd,
		require("null-ls").builtins.formatting.rustfmt,
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.phpcsfixer,
		require("null-ls").builtins.diagnostics.eslint_d,
		require("null-ls").builtins.diagnostics.phpcs,
	},
})

require("copilot").setup({
	suggestion = { enabled = false },
	panel = { enabled = false },
})
require("copilot_cmp").setup()
