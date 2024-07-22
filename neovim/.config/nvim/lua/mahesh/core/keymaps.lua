-- check default keymap: :help <keymap>
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
keymap.set({ "n", "v" }, "a", "A", { desc = "move and insert at end of line" })
keymap.set("n", "r", "<C-r>", { desc = "redo" })
keymap.set({ "n", "v" }, "9", "$", { desc = "moved to end of line" })
keymap.set({ "n", "v" }, "q", "<C-u>", { desc = "move up half of viewport" })
keymap.set({ "n", "v" }, ";", "<C-d>", { desc = "move down half of viewport" })

--When yanking content, it goes to the Unnamed register ("") but also to register "0. Thus, you can still paste the most recent yanked text
-- (after using the paste command) using "0p.
-- :reg or :register to check all enteries in register
-- Refer to :help quote0 for more info.
-- use P to paste text copied from browser after this change
-- keymap.set({ "n", "v" }, "p", '"0p', { desc = "paste but retain pasted-text in register" }) -- not using, as it does paste text which is cut with 'd'
-- `noremap = true` makes mapping non-recursive
keymap.set("n", "s", "<Nop>", { noremap = true, desc = "remove key s" })           -- avoid accidentail-execution (due to delay) of `s` while using keymaps like `ss`
keymap.set("n", "x", "<Nop>", { noremap = true, desc = "remove key s" })           -- avoid accidentail-execution (due to delay) of `x` while using keymaps like `sx`
keymap.set("n", "T", "<Nop>", { noremap = true, desc = "Toggle maximize window" }) -- used by tmux-config
keymap.set("n", "ss", "<cmd>wa<CR>", { desc = "save all files" })
keymap.set("n", "sq", "<cmd>qa<CR>", { desc = "close all files" })
keymap.set("n", "sx", "<cmd>xa<CR>", { desc = "save all files and close" })
keymap.set("n", "<leader>q", "<cmd>q<CR>", { desc = "close current file" })

-- ->t == tab
keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>w<cr><cmd>tabclose<cr>", { desc = "save changes and close current tab" })
keymap.set("n", "<leader>tq", "<cmd>tabclose<cr>", { desc = "close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tc", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- ------------------------ :help buffers ----------------------------------
-- :buffers  = view buffers

-- ------------------------ :help window -------------------------------------
keymap.set("n", "<leader>wv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>ww", "<C-w>w", { desc = "Cycle cursor to the next window" })
keymap.set("n", "<leader>wh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>wx", "<cmd>close<CR>", { desc = "Close current window" })

--------------------------------- quickfix list ----------------------------------------
--:copen " Open the quickfix window
--:ccl   " Close it
--:cw    " Open it if there are "errors", close it otherwise (some people prefer this)
--:[count]cn    " Go to the next error in the window, if count is given go to count-th next error
--:[count]cp    " Go to the previous error in the window, if count is given go to count-th previous error
--:cnf   " Go to the first error in the next file
--:[count]cc   " Go to error under cursor (if cursor is in quickfix window), if count is given go to count-th error
-- `Ctrl+w` to move to and out of quickfix list window
-- chistory     " Open all quickfix lists opened until now in current session
-- [count]chistory     " open count'th quickfix list from chistory-list

----------------------------> f == explorer -------------------------------------------------
-- %: create new file, d: create new directory
keymap.set('n', '<leader>fv', vim.cmd.Ex)
--keymap.set('n', '<leader>ff', '<cmd>e#<cr>', { desc = 'go to previous file' })
keymap.set('n', '<C-i>', '<cmd>e#<cr>', { noremap = true, silent = true }) -- <C-i> == tab
-----------------------------> s == save ------------------------------------
-- :w        save changes in current file
-- :x        save changes in current file and quit
-- :wa       save changes in all files
-- :xa			 save changes in all files and quit

-- ------------------------ comments ---------------------------------------------------------------
-- -- `ctrl-v` to enter visual-block mode, select lines, `I` to insert, type `--` and press `esc` to add comments to selected lines

-- search and replace all lines: `%s/<search-word>/<replace-word>/g` %s=substitute, g=global
-- search and replace current line: s/<search-word>/<replace-word>/g
--
--------------------- `:help m` `help: mark`--------------------------------
-->m=marks
-- lowercase marks (a-z): current buffer, uppercase marks (A-Z): global buffers
keymap.set("n", "ml", "<cmd>marks abcdef<cr>", { desc = "show marks list from a to f" })
keymap.set("n", "mm", "<cmd>marks ABCDE<cr>", { desc = "show marks list from a to f" })
-- `ma`: set mark a, `'a`: go to line of mark a, ``m`: go to position of mark, `['`: go to previous mark, `]'`: go to next mark
-- `:delm A` to delete mark A, `:delm a` to delete mark a
-- :marks: show all marks
-- keymap.set("n", "<leader>md", "<cmd>delmarks a-f<cr>", { desc = "delele marks from a to f" }) -- we rarely delete marks, hence no need to create shortcut for it
-- `:delm` delete all marks in current buffer, `:delm abc` delete mark a, mark b, mark c
-- `:delm A-Z` delete all global marks, `:delm 0-9` delete all numbered marks
-- ----------------- `:help fold` ------------------------------
-- visual mode
-- `zf`: fold
-- `zo` to open fold, `zO` open folds recursively
-- `zc` to close fold
-- you can created nested folds as well
-- `zR` to open all folds, `zM` to close all folds
--
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

---------------------- ->search and replace ---------------------------------
-- search word with :/<word><cr>
-- type `cw` (change word) -> type new word -> Esc
-- move to next word by typing `n`
-- if you want to change word, type `.` which will follow previous process
-- else type `n` to move to next word
--
---------------------- ->netrw keybindings ---------------------------------
-- change Vim's current directory to match the directory you're browsing in Netrw, helps during copy-file
-- vim.g.netrw_keepdir = 0  -- cannot use as harpoon, telescope shows files only in current directory once netrw is opened
-- %          - create new file
-- d          - create new directory
-- R          - rename path/file
-- D          - delete
-- delete non-empty directory: mf(mark directory) -> mx(apply shell commands to marked files) -> rm -rf <enter>
-- move file: mt(mark target directory) -> mf(mark file) -> mc(copy marked file to target directory)
-- copy file in same directory: mt(go outside and mark current directory) -> mf(come inside and mark file) -> mc(copy file) -> you will get prompt for name of the file
--
--
-- ------------------ -> code snippets -----------------------
-- t == type, te = type-empty, td = type-div
keymap.set('n', 'te', function()
  vim.api.nvim_put({ '<></>' }, '', true, false)
end, { noremap = true, silent = true })
keymap.set('n', 'td', function()
  vim.api.nvim_put({ '<div></div>' }, '', true, false)
end, { noremap = true, silent = true })


