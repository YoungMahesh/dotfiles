-- :vsplit -> split current content in new window on right side
-- :vertical resize +3<cr>  increase size of split/window
-- :vertical resize -3<cr>  decrease size of split/window
-- A tab in Neovim is a collection of windows. 

vim.keymap.set('n', '<c-h>', '<c-w>h', {desc = 'move to left window'})
vim.keymap.set('n', '<c-l>', '<c-w>l', {desc = 'move to right window'})
