-- :checkhealth telescope
return {
  'nvim-telescope/telescope.nvim',

  tag = '0.1.6',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      "nvim-telescope/telescope-live-grep-args.nvim",
      -- This will not install any breaking changes.
      -- For major updates, this must be adjusted manually.
      version = "^1.0.0",
    },
  },
  config = function()
    local builtin = require('telescope.builtin')
    local keymap = vim.keymap
    local telescope = require('telescope')

    -- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#default-mappings
    --	<C-x> go to file selection as a split
    --	<C-v> go to file selection as a vsplit
    --	<C-t> go to a file in a new tab
    --	<C-q> send all items to quickfix list

    -->f == find, fl=find-list,  fb=find-buffer, fh=find-help, fr=find-recent
    -- default mappings in docs are does not get enabled by default, need to be enabled here,
    -- :help telescope.command
    -- keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Fuzzy find files in cwd' })
    -- include find hidden files like .env
    keymap.set('n', '<leader>ff', ':Telescope find_files hidden=true<cr>', { desc = 'Fuzzy all files in cwd' })
    keymap.set('n', '<leader>fg',
      ":Telescope live_grep vimgrep_arguments=rg,--color=never,--no-heading,--no-heading,--line-number,--column,--smart-case,--hidden,--no-ignore<cr>",
      { desc = 'Find string in cwd' })
    keymap.set('n', '<leader>fb', builtin.buffers, {})
    keymap.set('n', '<leader>fh', builtin.help_tags, {})
    -- custom mappings
    keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Fuzzy find recent files' })

    keymap.set('n', '<leader>fc',
      ":Telescope grep_string vimgrep_arguments=rg,--color=never,--no-heading,--no-heading,--line-number,--column,--smart-case,--hidden,--no-ignore<cr>",
      { desc = 'Find string under cursor in cwd' })

    --keymap.set('n', '<leader>fm', "<cmd>Telescope marks mark_type=local<cr>", { desc = 'Find marks' }) -- does not work
    --keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Find string under cursor in cwd' })
    -- vim.keymap.set('n', '<leader>ps', function()
    --  builtin.grep_string({ search = vim.fn.input("Grep > ") });
    -- end)
    -- <C-p> = Ctrl+p
    keymap.set('n', '<C-p>', builtin.git_files, {})

    telescope.setup {
      defaults = {
        file_ignore_patterns = {
          -- in lua: The dash in the string is interpreted as quantifier so I need to escape them.
          -- For example the package-lock.json should be package%-lock.json
          "package%-lock.json",
          ".git/" -- we need hidden=true to see .env files, but it results in showing .git files also, hence excluding them
        }
      }

    }

    telescope.load_extension("live_grep_args")
  end,
}
