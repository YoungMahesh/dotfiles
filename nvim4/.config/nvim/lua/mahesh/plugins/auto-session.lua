return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_session_suppress_dirs = { "~/", "~/Downloads", "~/Desktop", "~/Pictures", "~/Documents" },
		})

		local keymap = vim.keymap
		-->s ss == session-save, sr == workspace-restore
		-- keymap.set('n', '<leader>ss', '<cmd>SessionSave<CR>', {desc = 'Save session for auto session'})
		-- auto-session automatically restores session when we execute `nvim`, hence no need for <cmd>SessionRestore<CR>
		-- keymap.set('n', '<leader>sr', '<cmd>SessionRestore<CR>', {desc = 'Restore last session for cwd'})

		-->x == close 
		-- <BAR> == combines two commands
		-- keymap.set('n', '<leader>x', '<cmd>SessionSave<CR><BAR><cmd>xa<CR>', {desc = 'Save session for auto session'})
		-- auto-session automatically saves session when we exit, hence no need to add <cmd>SessionSave<CR>
		keymap.set('n', '<leader>x', '<cmd>xa<CR>', {desc = 'Save session for auto session'})
	end,
}
