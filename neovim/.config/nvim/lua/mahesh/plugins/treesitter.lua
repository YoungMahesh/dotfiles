return { {
  -- syntax highlighting, indentation for multiple languages
  -- requirements: https://github.com/nvim-treesitter/nvim-treesitter?tab=readme-ov-file#requirements
  "nvim-treesitter/nvim-treesitter",
  -- from treesitter-docs: on first install, treesitter will throw error, error will go after installation
  build = ":TSUpdate",
  config = function()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      --https://github.com/nvim-treesitter/nvim-treesitter/wiki/List-of-parsers
      -- query represents - https://github.com/tree-sitter-grammars/tree-sitter-query and required in vim `:help <cmd>` docs
      -- if some language is giving error, update it - e.g. for vimdoc =>  :TSUpdate vimdoc
      ensure_installed = { "lua", "vim", "vimdoc", "query", "javascript", "typescript", "html", "prisma", "sql", "go", "cpp", "markdown" },
      sync_install = false,
      highlight = {
        enable = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
      },
      indent = { enable = true },
    })
  end
}, {
  'nvim-treesitter/playground',
  --  :InspectTree,   - AST (abstract syntax tree) - strutctured source code
  --  :q
  --  :Inspect
  --  :EditQuerya  - extract specific data from AST using query
  --  TSPlaygroundToggle
} }
