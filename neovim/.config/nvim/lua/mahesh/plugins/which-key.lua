return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- https://github.com/folke/which-key.nvim?tab=readme-ov-file#%EF%B8%8F-configuration
    triggers = {
      { "<auto>", mode = "nixsotc" },
      { "t",      mode = { "n", "v" } },
    }
  },
  keys = {
    {
      "<leader>?",
      function()
        require("which-key").show({ global = false })
      end,
      desc = "Buffer Local Keymaps (which-key)",
    },
  }
}
