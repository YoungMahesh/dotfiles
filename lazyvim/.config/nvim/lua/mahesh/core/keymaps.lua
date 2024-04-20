vim.g.mapleader = " " -- setup leader-key

local keymap = vim.keymap


-- commented out .set() keymaps are default keymaps by neovim which i use 
-- first parameter specify mode of keymap in nvim  
-- i == insert, "" == all modes, "n" == normal mode

-- -------------------------- normal/select mode ----------------------------
-- history
-- keymap.set("n", "u", {desc = "undo"}) 
keymap.set("n", "r", "<C-r>", {desc = "redo"}) 

-- cursor movements
-- keymap.set("", "0", "<C-d>", {desc = "move cursor to the start of line"}) 
keymap.set("", "9", "$", {desc = "move cursor to the end of line"}) 
keymap.set("n", "a", "A", {desc = "move to the end of line and switch to insert mode"})
keymap.set("", "q", "<C-u>", {desc = "move cursor up half of the screen"}) 
keymap.set("", ";", "<C-d>", {desc = "move cursor down half of the screen"}) 
-- .set("n", "gd") - go to defination of variable/function

-- -------------------------- insert mode ----------------------------
keymap.set("i", "jk", "<ESC>", {desc = "Exit insert mode"})


-- -------------------- search --------------------
keymap.set("n", "<leader>nh", ":nohl<CR>", {desc = "clear search highlights"})

-- ------------------- window management -------------------
keymap.set("n", "<leader>sv", "<C-w>v", {desc = "split window vertically"})
keymap.set("n", "<leader>sh", "<C-w>h", {desc = "split window horizontally"})
keymap.set("n", "<leader>se", "<C-w>=", {desc = "make splits equal size"})
keymap.set("n", "<leader>sx", "<cmd>close<CR>", {desc = "close current split"})


keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", {desc = "open new tab"})
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", {desc = "close current tab"})
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", {desc = "go to next tab"})
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", {desc = "go to previous tab"})
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", {desc = "open current buffer in new tab"})


