return {
'github/copilot.vim',
-- :Copilot setup
-- :help copilot
	-- :Copilot disable
	-- :Copilot enable

	config = function()
		local keymap = vim.keymap
		keymap.set("n", "<leader>cd", "<cmd>Copilot disable<cr>", { })
		keymap.set("n", "<leader>ce", "<cmd>Copilot enable<cr>", { })

		-- disable by default
		vim.cmd("Copilot disable")
	end,
}
