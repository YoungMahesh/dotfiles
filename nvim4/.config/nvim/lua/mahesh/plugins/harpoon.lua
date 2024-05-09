return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
	local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED
-->Shift e=explore, a,s,d,f = serially on keybord, w=near-e 
vim.keymap.set("n", "<S-w>", function() harpoon:list():add() end, {desc = 'Add current file to harpoon'})
-- {open harpoon list and then type `dd`, then `:w`, desc: 'Remove file from list'} 
-- {open harpoon list and then type `dd`, then `p` on another file-name, desc: 'Rearrange position of file in list'} 
vim.keymap.set("n", "<S-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, {desc = 'Open harpoon list'})

--> Shift+a -> already mapped at append at end of the line
vim.keymap.set("n", "<S-s>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<S-d>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<S-f>", function() harpoon:list():select(3) end)
vim.keymap.set("n", "<S-g>", function() harpoon:list():select(4) end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
	end,
}
