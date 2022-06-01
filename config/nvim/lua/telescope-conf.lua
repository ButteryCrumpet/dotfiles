local builtin = require("telescope.builtin")
local themes = require("telescope.themes")

local previewers = require("telescope.previewers")
local sorters = require("telescope.sorters")
local actions = require("telescope.actions")
local telescope = require("telescope")

local config = {
	defaults = {
		prompt_prefix = "≫ ",
		selection_caret = " ",
		entry_prefix = "  ",
		initial_mode = "insert",
		selection_strategy = "reset",
		sorting_strategy = "descending",
		layout_strategy = "horizontal",
		layout_config = {
			width = 0.75,
			preview_cutoff = 120,
			horizontal = { mirror = false },
			vertical = { mirror = false },
		},
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob=!.git/",
		},
		mappings = {
			i = {
				["<C-n>"] = actions.move_selection_next,
				["<C-p>"] = actions.move_selection_previous,
				["<C-c>"] = actions.close,
				["<C-j>"] = actions.cycle_history_next,
				["<C-k>"] = actions.cycle_history_prev,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
				["<CR>"] = actions.select_default + actions.center,
			},
			n = {
				["<C-n>"] = actions.move_selection_next,
				["<C-p>"] = actions.move_selection_previous,
				["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
			},
		},
		file_ignore_patterns = { ".git/", "node_modules" },
		path_display = { shorten = 5 },
		winblend = 0,
		border = {},
		borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
		color_devicons = true,
		set_env = { ["COLORTERM"] = "truecolor" },
	},
	file_previewer = previewers.vim_buffer_cat.new,
	grep_previewer = previewers.vim_buffer_vimgrep.new,
	qflist_previewer = previewers.vim_buffer_qflist.new,
	file_sorter = sorters.get_fuzzy_file,
	generic_sorter = sorters.get_generic_fuzzy_sorter,
	pickers = {
		find_files = {
			find_command = { "fdfind", "-L", "--type=file", "--hidden" },
		},
		live_grep = {
			only_sort_text = true,
		},
	},
	extensions = {
		fzf = {
			fuzzy = true,
			override_generic_sorter = true,
			override_file_sorter = true,
			case_mode = "smart_case",
		},
	},
}

telescope.setup(config)
telescope.load_extension("fzf")
