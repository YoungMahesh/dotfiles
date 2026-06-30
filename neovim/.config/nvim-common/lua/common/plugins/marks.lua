return {
  "chentoast/marks.nvim",
  event = "VeryLazy",
  opts = {
    -- default_mappings = https://github.com/chentoast/marks.nvim?tab=readme-ov-file#mappings
    -- dm<space> -> delete all marks in file
    -- m,        -> Set the next available alphabetical (lowercase) mark
    default_mappings = true,
    mappings = {
      delete_line = "m-" -- delete all marks on current line
    }
  },
}
