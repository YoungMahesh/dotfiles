require("mahesh.core.keymaps.disabled")
require("mahesh.core.keymaps.mark")
require("mahesh.core.keymaps.netrw")
require("mahesh.core.keymaps.quickfix")
require("mahesh.core.keymaps.tabs")
require("mahesh.core.keymaps.search")
require("mahesh.core.keymaps.visual-mode")
require("mahesh.core.keymaps.terminal")
require("mahesh.core.keymaps.window")
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

--• “n” → Normal 
--• “i” → Insert (n -> i -> i)
--• “v” → Visual-block = Visual + Select (any visual or select mode)
--• “x” → Visual only (char‐, line‐ or block-wise)
--• “s” → Select only (normal-mode -> gh, gH) - not for normal user, GUI apps use it to select text in neovim using api
--• “o” → Operator-pending
--• “c” → Command-line
--• “t” → Terminal

local keymap = vim.keymap
-- .set first-argument (n == normal mode, i == insert mode, v == visual mode, <empty> == all modes)
-- <C-u> == Ctrl+u
keymap.set({ "n", "v" }, "0", "^", { desc = "move to first char of current line", noremap = true })
keymap.set({ "n", "v" }, "^", "0", { desc = "move to start of current line", noremap = true })
keymap.set({ "n", "v" }, "'", "g_", { desc = "move to last char of line", noremap = true, nowait = true })
keymap.set({ "n", "v" }, "q", "A", { desc = "move and insert at end of line", noremap = true })
-- Disable the conflicting mapping for 'a' (`:verbose map a`), which was causes delay in execution
-- remember: v (visual+select) == x(visual) + s(select)
keymap.set("x", "a%", "<nop>", { noremap = true })
keymap.set({ "n", "v" }, "a", "<C-u>zz", { desc = "move up half of viewport; cursor at middle(zz)", noremap = true, nowait = true})
keymap.set({ "n", "v" }, ";", "<C-d>zz", { desc = "move down half of viewport; move cursor to middle(zz)", noremap = true, nowait = true })
-- { - to move to previous empty line, } - to move to the next empty line
-- from inside code move to boundary
--    [{  move to opening curly-brace {
--    ]}  move to closing curly-brace }
--    [(  move to opening parentheses (
--    ])  move to closing parentheses )
-- <line number> then shift+g - to move to specific line

keymap.set({ "n", "v" }, ".", ";", { desc = "repeat latest f or F", noremap = true })
keymap.set("n", "r", "<C-r>", { desc = "redo", noremap = true })

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
  vim.cmd('normal! F>l') -- F>l: F>(move backward to >)  l (move one character right)
end, { noremap = true, silent = true })
keymap.set('n', 'td', function()
  vim.api.nvim_put({ '<div></div>' }, '', true, false)
  vim.cmd('normal! F>l') -- F>l: F>(move backward to >)  l (move one character right)
end, { noremap = true, silent = true })

----------------------- scratch pad ------------------
keymap.set('n', '<leader>.', '<cmd>vsplit ~/.local/share/nvim/raw.txt<cr>', {desc = 'open raw.txt in split'})
--vim.keymap.set('n', '<leader>.', function()
--  -- Define height and width as percentages of the screen size
--  local width_percent = 80
--  local height_percent = 80
--
--  -- Open a new window with specified dimensions
--  local width = math.floor(vim.o.columns * (width_percent / 100))
--  local height = math.floor(vim.o.lines * (height_percent / 100))
--  local buf = vim.api.nvim_create_buf(false, true) -- Create a new buffer
--  vim.api.nvim_open_win(buf, true, {
--      relative = 'editor',
--      width = width,
--      height = height,
--      col = math.floor((vim.o.columns - width) / 2),
--      row = math.floor((vim.o.lines - height) / 2),
--      border = 'rounded'
--  })
--  vim.cmd('edit ~/.local/share/nvim/raw.txt') -- open file content
--
--  -- :q or keymap you created for closing tab will close popup 
--end, { desc = 'open raw.txt file in a popup' })

keymap.set('n', '<leader>m', "<cmd>put =execute('messages')<cr>", {desc = 'copy neovim messages to buffer'})

