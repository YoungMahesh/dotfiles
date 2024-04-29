# 💤 LazyVim

A starter template for [LazyVim](https://github.com/LazyVim/LazyVim).
Refer to the [documentation](https://lazyvim.github.io/installation) to get started.


# initialize
1. setup/install lazyvim as described in above documentation
2. add custom keymaps at `lua/config/keymaps.lua`
```lua
vim.keymap.set({ "n", "x" }, "9", "$", { desc = "move to end of line" })
vim.keymap.set({ "n", "x" }, "q", "<C-u>", { desc = "move up half of viewport" })
vim.keymap.set({ "n", "x" }, ";", "<C-d>", { desc = "move down half of the viewport" })

vim.keymap.set("n", "a", "A", { desc = "insert at the end of line" })

vim.keymap.set("n", "r", "<C-r>", { desc = "redo" })

vim.keymap.set("n", "bw", "<cmd>w<CR>", { desc = "buffer write/save" })
```
