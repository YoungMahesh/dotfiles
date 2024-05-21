return { {
  -- parser, syntax highlighting for language
  "nvim-treesitter/nvim-treesitter",
  -- from treesitter-docs: on first install, treesitter will throw error, error will go after installation
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "lua", "javascript", "typescript", "html", "prisma", "go" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}, {
  'nvim-treesitter/playground',
  --  :InspectTree,   :q
  --  :Inspect
  --  :EditQuery
  --  TSPlaygroundToggle
} }
