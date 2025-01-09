local wk = require("which-key")
local builtin = require("telescope.builtin")

wk.add({
	{ "<leader><leader>", "<cmd>lua require'telescope-conf'.project_files()<CR>", desc = "Files" },
	{
		"<leader>b",
		function()
			builtin.buffers({})
		end,
		desc = "Buffers",
	},
	{ "<leader>f", group = "Find" },
	{ "<leader>ff", "<cmd>Telescope find_files<CR>", desc = "Files" },
	{ "<leader>fr", "<cmd>Telescope oldfiles<CR>", desc = "Recent" },
	{
		"<leader>fg",
		function()
			builtin.live_grep({})
		end,
		desc = "GREP",
	},
	{ "<leader>fb", "<cmd>Telescope buffers<CR>", desc = "Buffers" },
	{ "<leader>fB", "<cmd>Telescope git_branches<CR>", desc = "Checkout branch" },
	{ "<leader>fc", "<cmd>Telescope colorscheme<CR>", desc = "colorscheme" },
	{ "<leader>fm", "<cmd>lua require 'telescope.builtin'.marks()<CR>", desc = "marks" },
	{ "<leader>g", group = "Git" },
	{ "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<CR>", desc = "Next Hunk" },
	{ "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", desc = "Prev Hunk" },
	{ "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<CR>", desc = "Blame" },
	{ "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", desc = "Preview Hunk" },
	{ "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", desc = "Reset Hunk" },
	{ "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", desc = "Reset Buffer" },
	{ "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", desc = "Stage Hunk" },
	{ "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>", desc = "Undo Stage Hunk" },
	{ "<leader>go", "<cmd>Telescope git_status<CR>", desc = "Open changed file" },
	{ "<leader>gb", "<cmd>Telescope git_branches<CR>", desc = "Checkout branch" },
	{ "<leader>gc", "<cmd>Telescope git_commits<CR>", desc = "Checkout commit" },
	{ "<leader>gC", "<cmd>Telescope git_bcommits<CR>", desc = "Checkout commit(for current file)" },
	{ "<leader>gd", "<cmd>Gitsigns diffthis HEAD<CR>", desc = "Git Diff" },
	{ "<leader>d", group = "Debugging" },
	{ "<leader>ds", "<cmd>lua require'dap'.continue()<CR>", desc = "Start/Continue" },
	{ "<leader>dx", "<cmd>lua require'dap'.terminate()<CR>", desc = "Stop" },
	{ "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", desc = "Breakpoint" },
	{ "<leader>dr", "<cmd>lua require'dap'.repl.toggle({ height = 15 })<CR>", desc = "Repl" },
	{ "<leader>du", "<cmd>lua require'dapui'.toggle()<CR>", desc = "UI" },
	{ "<leader>de", "<cmd>lua require'dapui'.eval()<CR>", desc = "Eval" },
	{ "<leader>dv", "<cmd>lua require'telescope'.extensions.dap.variables()<CR>", desc = "Vars" },
	{ "<leader>dl", "<cmd>lua require'telescope'.extensions.dap.list_breakpoints()<CR>", desc = "Breakpoints" },
	{ "<leader>df", "<cmd>lua require'telescope'.extensions.dap.frames()<CR>", desc = "Frames" },
	{ "g", group = "LSP" },
	{ "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions()<CR>", desc = "Go to definition" },
	{ "gD", "<cmd>lua require'telescope.builtin'.diagnostics{ bufnr = 0 }<CR>", desc = "List diagnostics" },
	{ "gr", "<cmd>lua require'telescope.builtin'.lsp_references()<CR>", desc = "Go to references" },
	{ "gi", "<cmd>lua require'telescope.builtin'.lsp_implementations()<CR>", desc = "Go to implementation" },
	{ "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", desc = "Peek signature" },
	{ "gf", "<cmd>lua require'conform'.format({ async = true, lsp_fallback = true })", desc = "Format" },
	{ "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover" },
	{ "ga", "<cmd>lua vim.lsp.buf.code_action()<CR>", desc = "Code Action" },
	{ "gn", "<cmd>lua vim.diagnostic.goto_next()<CR>", desc = "Next diagnostic" },
	{ "gp", "<cmd>lua vim.diagnostic.goto_previous()<CR>", desc = "Previous diagnostic" },
	{ "K", "<cmd>lua vim.lsp.buf.hover()<CR>", desc = "Hover" },
	{ "D", "<cmd>lua vim.diagnostic.open_float()<CR>", desc = "Line diagnostic" },
	{ "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", desc = "Rename" },
})

-- Move selection up/down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Append next line to current line
vim.keymap.set("n", "J", "mzJ`z")

-- Page move centres cursor
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- Search centre cursor
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Register preserve paste
vim.keymap.set("x", "<leader>p", '"_dP')
-- Register preserve delete
vim.keymap.set("n", "<leader>d", '"_d')
vim.keymap.set("v", "<leader>d", '"_d')

-- Yank to clipboard
vim.keymap.set("n", "<leader>y", '"+y')
vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')

-- Replace all word instances
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")

-- Bump right in insert mode
vim.keymap.set("i", "<C-l>", "<Right>")
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<Right>", "<nop>")
vim.keymap.set("n", "<Left>", "<nop>")
vim.keymap.set("n", "<Up>", "<nop>")
vim.keymap.set("n", "<Down>", "<nop>")

vim.keymap.set("n", "gt", function()
	vim.lsp.inlay_hint.enable(0, not vim.lsp.inlay_hint.is_enabled(0))
end, { desc = "Toggle Inlay Hints" })
