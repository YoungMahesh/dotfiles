local keymap = vim.keymap
keymap.set("n", "to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
--keymap.set("n", "tx", "<cmd>w<cr><cmd>tabclose<cr>", { desc = "save changes and close current tab" })
--keymap.set("n", "tq", "<cmd>tabclose<cr>", { desc = "close current tab" })
keymap.set('n', '<C-w>', "<cmd>tabclose<cr><cmd>tabp<cr>", { noremap = true, silent = true, nowait = true, desc = 'Close current tab' })
keymap.set("n", "tn", "<cmd>tabn<cr>", { desc = "Go to next tab" })
keymap.set("n", "tp", "<cmd>tabp<cr>", { desc = "Go to previous tab" })
keymap.set("n", "tt", "<cmd>tabnew %<cr>", { desc = "Open current buffer in new tab" })
keymap.set("n", "tl", "<cmd>tabmove -1<cr>", { desc = "move current tab to left" })
keymap.set("n", "tr", "<cmd>tabmove +1<cr>", { desc = "move current tab to right" })
-- 2gt -> switch to 2nd tab, 4gt -> switch to 4th tab, etc
