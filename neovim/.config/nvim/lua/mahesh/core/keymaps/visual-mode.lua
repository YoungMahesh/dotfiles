-- `o`: change direction (left -> right or right -> left) while selecting text

-- Move selected block up/down/left/right
-- Maintain the visual selection after moving (gv), Fix the indentation (=gv)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", {desc = 'move the selected block down one line', noremap = true})
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", {desc = 'move the selected block up one line', noremap = true})

-- {visual}[count]< == 	Shift the highlighted lines [count] 'shiftwidth' leftwards
-- << or {visiual}< move to left by one
-- disable below keymaps as we are using `L` to move to end of line
--vim.keymap.set('v', 'H', '<gv', { noremap = true, desc = "decrease indentation" })
--vim.keymap.set('v', 'L', '>gv', { noremap = true, desc = "increase indentation" })
