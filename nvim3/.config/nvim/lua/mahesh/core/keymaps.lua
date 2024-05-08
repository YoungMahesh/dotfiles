vim.g.mapleader = " "  -- set <space> as leader key


local keymap = vim.keymap

-- .set first-argument (n == normal mode, i == insert mode, <empty> == all modes)
-- <C-u> == Ctrl+u
keymap.set("n", "a", "A", { desc = "move and insert at end of line" })
keymap.set("n", "r", "<C-r>", { desc = "redo" })
keymap.set("", "9", "$", { desc = "moved to end of line" })
keymap.set("", "q", "<C-u>", { desc = "move up half of viewport" })
keymap.set("", ";", "<C-d>", { desc = "move down half of viewport" })


keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', {desc = 'Open new tab'})
keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', {desc = 'Close current tab'})
keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', {desc = 'Go to next tab'})
keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', {desc = 'Go to previous tab'})
keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', {desc = 'Open current buffer in new tab'})

