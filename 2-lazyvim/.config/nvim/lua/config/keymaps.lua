-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set({ "n", "x" }, "9", "$", { desc = "move to end of line" })
vim.keymap.set({ "n", "x" }, "q", "<C-u>", { desc = "move up half of viewport" })
vim.keymap.set({ "n", "x" }, ";", "<C-d>", { desc = "move down half of the viewport" })

vim.keymap.set("n", "a", "A", { desc = "insert at the end of line" })

vim.keymap.set("n", "r", "<C-r>", { desc = "redo" })

vim.keymap.set("n", "bw", "<cmd>w<CR>", { desc = "buffer write/save" })
