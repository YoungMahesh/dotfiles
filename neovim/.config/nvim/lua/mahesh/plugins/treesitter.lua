return { {
  -- parser, syntax highlighting for language
  "nvim-treesitter/nvim-treesitter",
  -- from treesitter-docs: on first install, treesitter will throw error, error will go after installation
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      --https://github.com/nvim-treesitter/nvim-treesitter/wiki/List-of-parsers
      -- query represents - https://github.com/tree-sitter-grammars/tree-sitter-query and required in vim `:help <cmd>` docs
      -- if some language is giving error, update it - e.g. for vimdoc =>  :TSUpdate vimdoc
      ensure_installed = { "lua", "vim", "vimdoc", "query", "javascript", "typescript", "html", "prisma", "go", "cpp", "markdown" },
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
