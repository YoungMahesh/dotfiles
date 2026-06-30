-- :vsplit -> split current content in new window on right side
-- A tab in Neovim is a collection of windows. 

vim.keymap.set('n', '<c-h>', '<c-w>h', {desc = 'move to left window', noremap = true})
vim.keymap.set('n', '<c-l>', '<c-w>l', {desc = 'move to right window', noremap = true})
vim.keymap.set('n', '<c-[>', '<cmd>vertical resize +3<cr>', {desc = 'increase size of vsplit window', noremap = true})
vim.keymap.set('n', '<c-]>', '<cmd>vertical resize -3<cr>', {desc = 'decrease size of vplit window', noremap = true})
