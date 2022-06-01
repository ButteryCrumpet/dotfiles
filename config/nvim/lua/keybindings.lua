local wk = require("which-key")

wk.register({
	["<leader>"] = { "<cmd>Telescope find_files<cr>", "Files" }, -- create a binding with label
	f = {
		name = "file", -- optional group name
		f = { "<cmd>Telescope find_files<cr>", "Files" }, -- create a binding with label
		r = { "<cmd>Telescope oldfiles<cr>", "Recent" }, -- additional options for creating the keymap
		g = { "<cmd>Telescope live_grep<cr>", "Recent" }, -- additional options for creating the keymap
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
	},
	g = {
		name = "Git",
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
		C = {
			"<cmd>Telescope git_bcommits<cr>",
			"Checkout commit(for current file)",
		},
		d = {
			"<cmd>Gitsigns diffthis HEAD<cr>",
			"Git Diff",
		},
	},
	d = { "<cmd>lua vim.diagnostic.open_float()<CR>", "Line diagnostic" },
}, { prefix = "<leader>", nowait = true })

wk.register({
	g = {
		d = { "<cmd>lua vim.lsp.buf.definition()<CR>", "Go to definition" },
		D = { "<cmd>lua vim.lsp.buf.declaration()<CR>", "Go to declaration" },
		r = { "<cmd>lua require'telescope.builtin'.lsp_references{}<CR>", "Go to references" },
		i = { "<cmd>lua require'telescope.builtin'.lsp_implementations{}<CR>", "Go to implementation" },
		p = { "<cmd>lua vim.lsp.buf.preview_location()<CR>", "Peek definition" },
		s = { "<cmd>lua vim.lsp.buf.signature_help()<CR>", "Peek signature" },
		f = { "<cmd>lua vim.lsp.buf.formatting_sync()<CR>", "Format" },
		h = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
	},
	K = { "<cmd>lua vim.lsp.buf.hover()<CR>", "Hover" },
	["<leader>"] = {
		rn = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
	},
}, { nowait = true })
