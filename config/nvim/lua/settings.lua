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

vim.api.nvim_create_autocmd({ "BufEnter" }, {
	pattern = { "*.ts", "*.js", "*.jsx", "*.tsx", "*.md", "*.json" },
	callback = function()
		vim.opt.tabstop = 2
		vim.opt.softtabstop = 2
		vim.opt.shiftwidth = 2
	end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
	pattern = { "*.ejs" },
	callback = function()
		vim.opt.filetype = "html"
	end,
})
