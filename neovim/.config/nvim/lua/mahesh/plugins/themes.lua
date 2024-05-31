return { "rose-pine/neovim", name = "rose-pine",
config = function()
	-- apply rose-pine as colorscheme
	vim.cmd("colorscheme rose-pine")

	-- transparent backgrouond
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end,
}
