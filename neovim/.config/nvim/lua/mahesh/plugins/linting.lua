return {
  "mfussenegger/nvim-lint",
  -- BufReadPre: execute when opened existing buffer
  -- BufNewFile: execute when created a new buffer
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require("lint");
    -- linters_by_ft: linters by file type
		-- you can install eslint_d by :Mason -> Linters -> eslint_d -> i
		-- if not working properly, execute: !eslint_d restart, then restart neovim 
    lint.linters_by_ft = {
      javascript = { "eslint_d" },
      typescript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescriptreact = { "eslint_d" },
    }

    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        lint.try_lint()
      end
    })

    vim.keymap.set("n", "<leader>l", function()
      lint.try_lint()
    end, {desc = "Trigger linting for current file"})
  end,
}
