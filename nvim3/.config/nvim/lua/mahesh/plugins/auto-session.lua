return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Desktop", "~/Pictures", "~/Documents" },
		})

		local keymap = vim.keymap
		-- ->s ss == session-save, sr == workspace-restore
		keymap.set('n', '<leader>ss', '<cmd>SessionSave<CR>', {desc = 'Save session for auto session'})
		keymap.set('n', '<leader>sr', '<cmd>SessionRestore<CR>', {desc = 'Restore last session for cwd'})
	end,
}
