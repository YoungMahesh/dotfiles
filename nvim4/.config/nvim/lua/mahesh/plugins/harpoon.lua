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
    vim.keymap.set("n", "ha", function() harpoon:list():add() end, { desc = 'Add current file to harpoon' })
    -- {open harpoon list and then type `dd`, then `:w`, desc: 'Remove file from list'}
    -- {open harpoon list and then type `dd`, then `p` on another file-name, desc: 'Rearrange position of file in list'}
    vim.keymap.set("n", "he", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
      { desc = 'Open harpoon list' })

    --> Shift+a -> already mapped at append at end of the line
    vim.keymap.set("n", "h1", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "h2", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "h3", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "h4", function() harpoon:list():select(4) end)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "hp", function() harpoon:list():prev() end)
    vim.keymap.set("n", "hn", function() harpoon:list():next() end)
  end,
}
