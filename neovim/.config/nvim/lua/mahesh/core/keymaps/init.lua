require("mahesh.core.keymaps.disabled")
require("mahesh.core.keymaps.mark")
require("mahesh.core.keymaps.netrw")
require("mahesh.core.keymaps.quickfix")
require("mahesh.core.keymaps.tabs")
require("mahesh.core.keymaps.search")
require("mahesh.core.keymaps.visual-mode")

-- NOTE: when you update keymap, to test changes, you first need to close all nvim instances
-- check default keymap documentation: :help <keymap>
--    some of the default keymaps are disabled in keymaps.disabled file
-- check specific keymap: `:map <keymap>` or `:map <leader><keymap>`
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
keymap.set({ "n", "v" }, "q", "A", { desc = "move and insert at end of line", noremap = true })
keymap.set("n", "r", "<C-r>", { desc = "redo", noremap = true })
keymap.set({ "n", "v" }, "9", "$", { desc = "moved to end of line", noremap = true })
keymap.set({ "n", "v" }, "a", "<C-u>zz", { desc = "move up half of viewport + cursor at middle(zz)", noremap= true })
keymap.set({ "n", "v" }, ";", "<C-d>zz", { desc = "move down half of viewport + cursor at middle", noremap=true })

--When yanking content, it goes to the Unnamed register ("") but also to register "0. Thus, you can still paste the most recent yanked text
-- (after using the paste command) using "0p.
-- :reg or :register to check all enteries in register
-- Refer to :help quote0 for more info.
-- use P to paste text copied from browser after this change
-- keymap.set({ "n", "v" }, "p", '"0p', { desc = "paste but retain pasted-text in register" }) -- not using, as it does paste text which is cut with 'd'
-- `noremap = true` makes mapping non-recursive
keymap.set("n", "ss", "<cmd>wa<CR>", { desc = "save all files" })
keymap.set("n", "sq", "<cmd>qa<CR>", { desc = "close all files" })
keymap.set("n", "sx", "<cmd>xa<CR>", { desc = "save all files and close" })
keymap.set('n', '<C-a>', '0ggvG$', { desc = 'select all text on current page/buffer' })

-- ------------------------ :help buffers ----------------------------------
-- :buffers  = view buffers

-- ------------------------ :help window -------------------------------------
-- <C-w> is used for closing 
--keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
--keymap.set("n", "<leader>ww", "<C-w>w", { desc = "Cycle cursor to the next window" })
--keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
--keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current window" })

----------------------------> f == explorer -------------------------------------------------
-- %: create new file, d: create new directory, D: delete file or empty directory
keymap.set('n', '<leader>fv', vim.cmd.Ex)
keymap.set('n', '<C-i>', '<cmd>e#<cr>', { noremap = true, silent = true }) -- <C-i> == tab
-----------------------------> s == save ------------------------------------
-- :w        save changes in current file
-- :x        save changes in current file and quit
-- :wa       save changes in all files
-- :xa			 save changes in all files and quit

-- ------------------------ comments ---------------------------------------------------------------
-- -- `ctrl-v` to enter visual-block mode, select lines, `I` to insert, type `--` and press `esc` to add comments to selected lines

-- ----------------- `:help fold` ------------------------------
-- visual mode
-- `zf`: fold
-- `zo` to open fold, `zO` open folds recursively
-- `zc` to close fold
-- you can created nested folds as well
-- `zR` to open all folds, `zM` to close all folds
--
-- ------------------- visual line ------------------------
-- Shift+v: enter visual line mode, start selecting whole lines
---------------------- :help f (movement on current line) ----------------------------------------
-- fm: move cursor to next character 'm' on current line
-- Fk: move cursor to last character 'k' on current line

---------------------- :help [ (jump lines) ---------------------------
-- [(: move to previous (,   ]): move to next )
-- [{: move to previous {,   ]}: move to next }
-- [[: move to previous [,   ]]: move to next ]

----------------------- vim cmd erros --------------------------------------
-- https://vi.stackexchange.com/a/31071
-- :messages    -- view errors thrown in current session
-- :put =execute('messages')  -- copy errors to current buffer
--
-- echo $XDG_RUNTIME_DIR

---------------------- wrap unwrap --
keymap.set('n', '<leader>ww', function()
  vim.wo.wrap = not vim.wo.wrap
  print("Wrap is now " .. (vim.wo.wrap and "on" or "off"))
end, { noremap = true, silent = true, desc = "Toggle wrap" }
)

-- ------------------ -> code snippets -----------------------
-- t == type, te = type-empty, td = type-div
keymap.set('n', 'te', function()
  vim.api.nvim_put({ '<></>' }, '', true, false)
end, { noremap = true, silent = true })
keymap.set('n', 'td', function()
  vim.api.nvim_put({ '<div></div>' }, '', true, false)
end, { noremap = true, silent = true })
