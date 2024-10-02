local keymap = vim.keymap
keymap.set("n", "to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "tx", "<cmd>w<cr><cmd>tabclose<cr>", { desc = "save changes and close current tab" })
keymap.set("n", "tq", "<cmd>tabclose<cr>", { desc = "close current tab" })
keymap.set("n", "tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "tc", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })
-- 2gt -> switch to 2nd tab, 4gt -> switch to 4th tab, etc
