local wk = require("which-key")

wk.register({
	["<leader>"] = { "<cmd>lua require'telescope-conf'.project_files()<CR>", "Files" }, -- CReate a binding with label
	f = {
		name = "file", -- optional group name
		f = { "<cmd>Telescope find_files<CR>", "Files" }, -- CReate a binding with label
		r = { "<cmd>Telescope oldfiles<CR>", "Recent" }, -- additional options for CReating the keymap
		g = { "<cmd>Telescope live_grep<CR>", "Recent" }, -- additional options for CReating the keymap
		b = { "<cmd>Telescope buffers<CR>", "Buffers" },
		B = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
	},
	g = {
		name = "Git",
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<CR>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
		C = {
			"<cmd>Telescope git_bcommits<CR>",
			"Checkout commit(for current file)",
		},
		d = {
			"<cmd>Gitsigns diffthis HEAD<CR>",
			"Git Diff",
		},
	},
	d = {
		name = "Debugging",
		s = { "<cmd>lua require'dap'.continue()<CR>", "Start/Continue" },
		x = { "<cmd>lua require'dap'.terminate()<CR>", "Stop" },
		b = { "<cmd>lua require'dap'.toggle_breakpoint()<CR>", "Breakpoint" },
		r = { "<cmd>lua require'dap'.repl.toggle({ height = 15 })<CR>", "Repl" },
		u = { "<cmd>lua require'dapui'.toggle()<CR>", "UI" },
		e = { "<cmd>lua require'dapui'.eval()<CR>", "Eval" },
		v = { "<cmd>lua require'telescope'.extensions.dap.variables()<CR>", "Vars" },
		l = { "<cmd>lua require'telescope'.extensions.dap.list_breakpoints()<CR>", "Breakpoints" },
		f = { "<cmd>lua require'telescope'.extensions.dap.frames()<CR>", "Frames" },
	},
}, { prefix = "<leader>", nowait = true })

wk.register({
	["<C-n>"] = { "<cmd>NERDTreeToggle<CR>", "Open Folder Navigator" },
	g = {
		name = "LSP",
		d = { "<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>", "Go to definition" },
		D = { "<cmd>lua require'telescope.builtin'.diagnostics{ bufnr = 0 }<CR>", "List diagnostics" },
		r = { "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", "Go to references" },
		i = { "<cmd>lua require'telescope.builtin'.lsp_implementations()<CR>", "Go to implementation" },
		p = { "<cmd>lua vim.lsp.buf.preview_location()<CR>", "Peek definition" },
		s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Peek signature" },
		f = { "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", "Format" },
		h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
		n = { "<cmd>lua vim.diagnostic.goto_next()<CR>", "Next diagnostic" },
		p = { "<cmd>lua vim.diagnostic.goto_previous()<CR>", "Previous diagnostic" },
	},
	K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
	D = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line diagnostic" },
	["<leader>"] = {
		rn = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
	},
}, { nowait = true })
