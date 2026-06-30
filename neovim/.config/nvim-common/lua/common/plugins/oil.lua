return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  opts = {},
  -- Optional dependencies
  dependencies = { { "echasnovski/mini.icons", opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
  config = function()
    require('oil').setup({
      view_options = {
        show_hidden = true
      }
    })
    vim.keymap.set('n', '-', '<cmd>Oil<cr>', {desc = 'open parent directory'})
    -- o create new file/directory insert-below->type-name->(put / at end for directory)->enter
    -- i insert to rename file
    -- dd delete/cut, p paste,   
  end,
}
