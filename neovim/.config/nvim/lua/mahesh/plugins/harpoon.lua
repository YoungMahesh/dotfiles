return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED
    --

    -->h == harpoon, ha=harpoon add, he=harpoon explore
		-- not using `h` directory, as h is part of vim-motion to move cursor to left
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():add() end, { desc = 'Add current file to harpoon' })
    -- {open harpoon list and then type `dd`, then `:w`, desc: 'Remove file from list'}
    -- {open harpoon list and then type `dd`, then `p` on another file-name, desc: 'Rearrange position of file in list'}
    vim.keymap.set("n", "<leader>he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = 'Open harpoon list' })

    --> Shift+a -> already mapped at append at end of the line
    vim.keymap.set("n", "<leader>h1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>h2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>h3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>h4", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list, A == Alt
    vim.keymap.set("n", "<A-k>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<A-j>", function() harpoon:list():next() end)
  end,
}
