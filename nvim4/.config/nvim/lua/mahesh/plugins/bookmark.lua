return {
	"LintaoAmons/bookmarks.nvim",
	dependencies = {
		{ "stevearc/dressing.nvim" }, -- optional for better ui
	},
	config = function()
		local keymap = vim.keymap

		-- ->b == bookmark
		keymap.set(
			{ "n", "v" },
			"bm",
			"<cmd>BookmarksMark<cr>",
			{ desc = "Mark current line into active BookmarkList" }
		)
		keymap.set(
			{ "n", "v" },
			"bo",
			"<cmd>BookmarksGoto<cr>",
			{ desc = "Go to bookmark at current active BookmarkList" }
		)
	end,
}
