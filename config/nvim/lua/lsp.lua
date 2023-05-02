local nvim_lsp = require("lspconfig")

vim.cmd([[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]])
vim.cmd([[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#282828]])

local border = {
	{ "┌", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "┐", "FloatBorder" },
	{ "│", "FloatBorder" },
	{ "┘", "FloatBorder" },
	{ "─", "FloatBorder" },
	{ "└", "FloatBorder" },
	{ "│", "FloatBorder" },
}

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
	opts = opts or {}
	opts.border = opts.border or border
	return orig_util_open_floating_preview(contents, syntax, opts, ...)
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

local lsp_formatting = function(bufnr)
	vim.lsp.buf.format({
		bufnr = bufnr,
	})
end

-- SERVER SETUP
local servers = { "erlangls", "ocamlls", "rust_analyzer", "intelephense", "pyright", "csharp_ls" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		capablities = capablities,
		flags = {
			debounce_text_changes = 150,
		},
		on_attach = function(client)
			client.server_capabilities.documentFormattingProvider = false
		end,
	})
end

nvim_lsp["tsserver"].setup({
	capablities = capablities,
	root_dir = require("lspconfig.util").root_pattern(".git"),
	flags = {
		debounce_text_changes = 150,
	},
	on_attach = function(client)
		client.server_capabilities.documentFormattingProvider = false
	end,
})

require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.prettier,
		require("null-ls").builtins.formatting.rustfmt,
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.formatting.phpcsfixer,
		require("null-ls").builtins.diagnostics.eslint_d,
		require("null-ls").builtins.diagnostics.phpcs,
	},
	on_attach = function(client, bufnr)
		if client.supports_method("textDocument/formatting") then
			vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
			vim.api.nvim_create_autocmd("BufWritePre", {
				group = augroup,
				buffer = bufnr,
				callback = function()
					lsp_formatting(bufnr)
				end,
			})
		end
	end,
})
