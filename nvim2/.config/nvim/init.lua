-- init.lua
vim.o.tabstop = 2 -- tab-character should be 2 spaces wide
vim.o.softtabstop = 2 -- tab-char should be displayed as 2 spaces wide, even if `tabstop` setting is different
vim.o.shiftwidth = 2 -- insert 2 spaces on when <Tab> is clicked
vim.o.smarttab = true -- if(beginning of line) insert tab-char, else insert spaces defined in shiftwidth
vim.wo.number = true -- numbers on left side
vim.o.autoindent = true -- auto-indent new lines based on indentation of previous lines
vim.o.mouse = 'a' -- enable mouse in all modes
vim.o.clipboard = "unnamedplus" -- copy to system clipboard

-- 'n' == mapping only for normal-mode
-- 'v' == mapping only for visual-mode
-- '' == mapping for all modes (normal, visual, select, etc)

-- ---------------- mapping for normal mode ---------------
-- append at the end of line
vim.api.nvim_set_keymap('n', 'a', 'A', {})

-- move to end of the line
vim.api.nvim_set_keymap('', '9', '$', {})

-- move up half of the file
vim.api.nvim_set_keymap('', 'q', '<C-u>', {})

-- move down half of the file
vim.api.nvim_set_keymap('', ';', '<C-d>', {})

-- redo
vim.api.nvim_set_keymap('n', 'r', '<C-r>', {})

-- ----------------- default mapping i am using ---------------------
--  gd  -> go to defination (opens declared function/variable when executed 'gd' on called function/variable)
