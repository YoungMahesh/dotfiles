return {
	"numToStr/Comment.nvim",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},

	config = function()
		-- visual mode (https://github.com/numToStr/Comment.nvim?tab=readme-ov-file#-usage)
		--`gc` - Toggles the region using linewise comment
		-- `gb` - Toggles the region using blockwise comment

		local comment = require("Comment")
		local ts_context_commentstring = require("ts_context_commentstring.integrations.comment_nvim")

		-- enable comment
		comment.setup({
			-- for commenting tsx, jsx, svelte, html files
			pre_hook = ts_context_commentstring.create_pre_hook(),
		})
	end,
}
