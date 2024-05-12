return {
  "LintaoAmons/bookmarks.nvim",
  dependencies = {
    { "stevearc/dressing.nvim" }, -- optional for better ui
  },
  config = function()
    local keymap = vim.keymap

    -- ->b == bookmark
    -- not using `b` directory, as b is part of vim-motion to move cursor to previous word 
    keymap.set(
      { "n", "v" },
      "<leader>bm",
      "<cmd>BookmarksMark<cr>",
      { desc = "Mark current line into active BookmarkList" }
    )
    keymap.set(
      { "n", "v" },
      "<leader>bo",
      "<cmd>BookmarksGoto<cr>",
      { desc = "Go to bookmark at current active BookmarkList" }
    )
  end,
}
