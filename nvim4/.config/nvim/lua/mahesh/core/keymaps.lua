-- check default keymap: :help <keymap>
-- check specific keymap: `:map <keymap>`
-- check all keymaps: `:map` or `:map <leader>`
-- check all keymaps in normal mode: `:nmap`
-- check all keymaps in insert mode: `:imap`
-- check all keymaps in visual mode: `:vmap`
-- check all keymaps in command mode: `:cmap`
-- check all keymaps in select mode: `:smap`

vim.g.mapleader = " " -- set <space> as leader key

local keymap = vim.keymap

-- .set first-argument (n == normal mode, i == insert mode, v == visual mode, <empty> == all modes)
-- <C-u> == Ctrl+u
keymap.set("n", "a", "A", { desc = "move and insert at end of line" })
keymap.set("n", "r", "<C-r>", { desc = "redo" })
keymap.set("n", "s", "<cmd>w<CR>", { desc = "save file" })
keymap.set({ "n", "v" }, "9", "$", { desc = "moved to end of line" })
keymap.set({ "n", "v" }, "q", "<C-u>", { desc = "move up half of viewport" })
keymap.set({ "n", "v" }, ";", "<C-d>", { desc = "move down half of viewport" })

-- ->t == tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tc", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- ->w == window
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current window" })

-->p explorer
-- %: create new file, d: create new directory
keymap.set('n', '<leader>fv', vim.cmd.Ex)

-->x == close 
keymap.set('n', '<leader>x', '<cmd>xa<CR>', {desc = 'Save session for auto session'})
keymap.set('n', '<leader>q', '<cmd>qa<CR>', {desc = 'Save session for auto session'})

-- add comments, using visual-block mode
-- `ctrl-v` to enter visual-block mode, select lines, `I` to insert, type `--` and press `esc` to add comments to selected lines

-- search and replace all lines: `%s/<search-word>/<replace-word>/g` %s=substitute, g=global
-- search and replace current line: s/<search-word>/<replace-word>/g
--
--------------------- `:help m` `help: mark`--------------------------------
-- ma: set mark a, 'a: go to line of mark a, `m: go to position of mark, [': go to previous mark, ]': go to next mark 
-- :marks: show all marks 
--
-- `:delm` delete all marks in current buffer
-- `:delm abc` delete mark a, mark b, mark c
-- `:delm A-Z` delete all global marks
-- `:delm 0-9` delete all numbered marks
--
-- lowercase marks (a-z): local to current buffer, uppercase marks (A-Z): global
--
-- ----------------- `:help fold` ------------------------------
-- select text in visual mode and `zf` to fold, `zo` to open fold, `zc` to close fold
-- you can created nested folds as well
-- `zE` to delete all folds, `zd` to delete current fold at cursor, `zD` to delete all-folds(nested) at cursor
-- `zR` to open all folds, `zM` to close all folds
