require("tokyonight").setup({
	transparent = true,
	on_highlight = function(h1, c)
		h1.TelescopePromptNormal = { bg = "#2d3149" }
	end,
})

function ColorSetup()
	vim.cmd([[
        set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
        set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto
    ]])

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

vim.api.nvim_create_autocmd({ "ColorScheme" }, { callback = ColorSetup })
-- base16-default-dark
-- tokyonight
vim.cmd.colorscheme("tokyonight")
