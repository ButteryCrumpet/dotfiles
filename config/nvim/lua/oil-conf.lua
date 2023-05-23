local oil = require("oil")
oil.setup({})

vim.keymap.set("n", "<C-n>", function()
	oil.toggle_float(vim.fn.getcwd())
end)

vim.keymap.set("n", "-", function()
	oil.open_float()
end)
