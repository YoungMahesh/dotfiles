vim.g.mapleader = " "  -- set <space> as leader key


local keymap = vim.keymap

-- .set first-argument (n == normal mode, i == insert mode, <empty> == all modes)
-- <C-u> == Ctrl+u
keymap.set("n", "a", "A", { desc = "move and insert at end of line" })
keymap.set("n", "r", "<C-r>", { desc = "redo" })
keymap.set("", "9", "$", { desc = "moved to end of line" })
keymap.set("", "q", "<C-u>", { desc = "move up half of viewport" })
keymap.set("", ";", "<C-d>", { desc = "move down half of viewport" })

