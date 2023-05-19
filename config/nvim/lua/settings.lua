local settings = {
	nu = true,
	relativenumber = true,
	numberwidth = 4,

	cursorline = true,

	tabstop = 4,
	softtabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	smartindent = true,

	wrap = false,

	swapfile = false,
	backup = false,
	undofile = true,

	hlsearch = false,
	incsearch = true,
	ignorecase = true,
	smartcase = true,

	termguicolors = true,

	scrolloff = 8,
	signcolumn = "yes",
	isfname = vim.opt.isfname + { "@-@" },

	updatetime = 50,

	-- colors a column at the given width
	colorcolumn = "0",

	cmdheight = 2,
	fileencoding = "utf-8",

	foldmethod = "expr",
	foldcolumn = "1",
	foldlevelstart = 99,
	foldexpr = vim.fn["nvim_treesitter#foldexpr"](),
}

for k, v in pairs(settings) do
	vim.opt[k] = v
end
