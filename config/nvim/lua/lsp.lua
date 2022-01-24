local nvim_lsp = require("lspconfig")

local saga = require("lspsaga")
saga.init_lsp_saga({
	code_action_prompt = { enable = false },
})

local capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities.textDocument.completion.completionItem.resolveSupport = {
	properties = {
		"documentation",
		"detail",
		"additionalTextEdits",
	},
}

-- FORMAT ON SAVE
local format_async = function(err, result, ctx)
	if err ~= nil or result == nil then
		return
	end
	if not vim.api.nvim_buf_get_option(ctx.bufnr, "modified") then
		local view = vim.fn.winsaveview()
		local client = vim.lsp.get_client_by_id(ctx.client_id)
		vim.lsp.util.apply_text_edits(result, ctx.bufnr, client.offset_encoding)
		vim.fn.winrestview(view)
		if ctx.bufnr == vim.api.nvim_get_current_buf() then
			vim.b.saving_format = true
			vim.api.nvim_command("noautocmd :update")
			vim.b.saving_format = false
		end
	end
end

vim.lsp.handlers["textDocument/formatting"] = format_async

local on_attach = function(client, bufnr)
	vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
	if client.resolved_capabilities.document_formatting then
		vim.api.nvim_exec(
			[[
     augroup LspAutocommands
         autocmd! * <buffer>
         autocmd BufWritePost <buffer> LspFormatting
     augroup END
     ]],
			true
		)
	end
end

-- SERVER SETUP
local servers = { "erlangls", "ocamlls", "rust_analyzer", "intelephense", "tsserver" }
for _, lsp in ipairs(servers) do
	nvim_lsp[lsp].setup({
		capablities = capablities,
		flags = {
			debounce_text_changes = 150,
		},
		on_attach = function(client)
			client.resolved_capabilities.document_formatting = false
		end,
	})
end

require("null-ls").setup({
	sources = {
		require("null-ls").builtins.formatting.prettier,
		require("null-ls").builtins.formatting.rustfmt,
		require("null-ls").builtins.formatting.stylua,
		require("null-ls").builtins.diagnostics.eslint_d,
	},
	on_attach = on_attach,
})
