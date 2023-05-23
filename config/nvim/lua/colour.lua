require("rose-pine").setup({ disable_background = true })
require("tokyonight").setup({
	transparent = true,
	on_highlight = function(h1, c)
		h1.TelescopePromptNormal = { bg = "#2d3149" }
	end,
})

function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
	vim.cmd([[
        set t_8f=^[[38;2;%lu;%lu;%lum  " Needed in tmux
        set t_8b=^[[48;2;%lu;%lu;%lum  " Ditto
    ]])

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- base16-default-dark
-- tokyonight
ColorMyPencils("tokyonight-moon")
