return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Desktop", "~/Pictures", "~/Documents" },
		})

		local keymap = vim.keymap
		keymap.set('n', '<leader>wr', '<cmd>SessionRestore<CR>', {desc = 'Restore last session for cwd'})
		keymap.set('n', '<leader>ws', '<cmd>SessionSave<CR>', {desc = 'Save session for auto session'})
	end,
}
