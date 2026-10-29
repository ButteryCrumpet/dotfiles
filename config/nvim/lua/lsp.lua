local nvim_lsp = require("lspconfig")
local tb = require("telescope.builtin")

local lsp = require("lsp-zero")
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
	vim.keymap.set("n", "gi", function()
		tb.lsp_implementations()
	end, opts)
end)

require("mason").setup()
require("mason-lspconfig").setup({
	handlers = {
		function(server_name)
			nvim_lsp[server_name].setup({})
		end,
        rust_analyzer = function()
            nvim_lsp.rust_analyzer.setup({
                procMacro = {
                    ignored = {
                        ['napi-derive'] = { 'napi' },
                    },
                },
            })
        end,
		tailwindcss = function()
			nvim_lsp.tailwindcss.setup({
				autostart = false,
				filetypes = {
					"html",
					"css",
					"scss",
					"javascript",
					"typescript",
					"javascriptreact",
					"typescriptreact",
					"templ",
				},
				init_options = { userLanguages = { templ = "html" } },
			})
		end,
		tsc = function()
			nvim_lsp.tsc.setup({
                    cmd = { "tsc", "--lsp", "--stdio" },
                    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
                    root_dir = lspconfig.util.root_pattern("tsconfig.json", "package.json", ".git"),
			})
		end,
		lua_ls = function()
			nvim_lsp.lua_ls.setup({
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						hint = { enable = true },
					},
				},
			})
		end,
	},
})

require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescript = { "prettierd" },
		typescriptreact = { "prettierd" },
		markdown = { "markdownlint" },
		python = { "black" },
		php = { "php_cs_fixer" },
		rust = { "rustfmt" },
		ocaml = { "ocamlformat" },
		go = { "gofmt" },
		sql = { "sql_formatter" },
		blade = { "blade-formatter" },
		html = { "prettierd" },
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

-- require("copilot").setup({
-- 	suggestion = { enabled = false },
-- 	panel = { enabled = false },
-- })
-- require("copilot_cmp").setup()

require("render-markdown").setup({
    completions = { lsp = { enabled = true } },
})
