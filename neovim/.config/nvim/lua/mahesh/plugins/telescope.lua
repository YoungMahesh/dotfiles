-- :checkhealth telescope
return {
  'nvim-telescope/telescope.nvim',

  tag = '0.1.8',
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
    -- :help telescope.actions
    --  <C-u>	Scroll up in preview window
    --  <C-d>	Scroll down in preview window
    --	<C-x> go to file selection as a split
    --	<C-v> go to file selection as a vsplit
    --	<C-t> go to a file in a new tab
    --	<C-q> send all items to quickfix list

    -->f == files, fl=files-list,  fb=files-buffer, fh=files-help, fr=files-recent
    -- default mappings in docs are does not get enabled by default, need to be enabled here,
    -- :help telescope.command
    -- keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Fuzzy find files in cwd' })
    -- include find hidden files like .env
    --keymap.set('n', '<leader>fl', ':Telescope find_files hidden=true<cr>', { desc = 'Fuzzy all files in cwd' })
    -- hidden=true - show files starting with . - like .env
    -- no_ignore=true - show files form paths which are mentioned in .gitignore
    --    large directories like node_modules are handled through defaults.file_ignore_patterns in telescope.setup
    keymap.set('n', '<C-p>', '<cmd>tab split | Telescope find_files hidden=true no_ignore=true<cr>', { desc = 'Fuzzy all files in cwd' })
    keymap.set('n', '<leader>fg', ":Telescope live_grep<cr>", { desc = 'Find string in cwd' })
    keymap.set('n', '<leader>fb', builtin.buffers, {})
    keymap.set('n', '<leader>fh', builtin.help_tags, {})
    -- custom mappings
    keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Fuzzy find recent files' })

    keymap.set('n', '<leader>fc', ":Telescope grep_string <cr>", { desc = 'Find string under cursor in cwd' })
    keymap.set('n', '<leader>fs', function()
      vim.cmd('tabnew')
      -- traditional grep_string, uses regex, so i need to use escape character(\) before special symbols like ".", "/", etc
      builtin.grep_string({ search = vim.fn.input("Grep > ") })
    end, { desc = 'search string (without regex) cursor in cwd' })
    --keymap.set('n', '<leader>fc',
    --  ":Telescope grep_string vimgrep_arguments=rg,--color=never,--no-heading,--no-heading,--line-number,--column,--smart-case,--hidden,--no-ignore<cr>",
    --  { desc = 'Find string under cursor in cwd' })

    --keymap.set('n', '<leader>fm', "<cmd>Telescope marks mark_type=local<cr>", { desc = 'Find marks' }) -- does not work
    --keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Find string under cursor in cwd' })
    -- vim.keymap.set('n', '<leader>ps', function()
    --  builtin.grep_string({ search = vim.fn.input("Grep > ") });
    -- end)
    -- <C-p> = Ctrl+p
    --keymap.set('n', '<C-p>', builtin.git_files, {})

    telescope.setup {
      -- `:help telelscope.default`
      defaults = {
        mappings = {
          i = {
            -- scroll left/right in only for nightly for now:
            --    https://github.com/nvim-telescope/telescope.nvim/issues/3110#issuecomment-2116467751
            --    https://github.com/nvim-telescope/telescope.nvim/issues/3110#issuecomment-2395242266
            --["<C-h>"] = "preview_scrolling_left",
            --["<C-m>"] = "preview_scrolling_right",
          }
        },
        -- vimgrep_arguments can be applied to all commands through here or to specific command, as shown in one of the comments above
        -- -- rg (ripgrep - search utility),
        -- The order of arguments in Lua functions matters. When calling a function, Lua adjusts the number of arguments to the number of parameters. Extra arguments are thrown away, and extra parameters get nil
        -- --color=never  - ensures that the output does not include color codes.
        -- --no-heading   - suppresses the heading line with the file name.
        -- --with-filename - includes the file name in the output.
        -- --line-number  - includes the line number in the output.
        -- --column       - includes the column number in the output.
        -- --smart-case   - enables smart case matching.
        -- --hidden       - includes hidden files in the search.
        vimgrep_arguments = { 'rg', '--color=never', '--no-heading', '--with-filename', '--line-number', '--column', '--smart-case', '--hidden', '--no-ignore' },
        file_ignore_patterns = {
          -- put `.ignore` file to exclude specific folders in specific directory, it works same as .gitignore (.gitignore for git, .ignore for telescope)
          -- note: there is no way to ignore files in subdirectories, if you put * in home-directory's .ignore, it will not show files when you open telescope in any subdirectory
          -- in lua: The dash in the string is interpreted as quantifier so I need to escape them.
          -- For example the package-lock.json should be package%-lock.json
          "package%-lock.json", -- nodejs project depedency installation history
          "pnpm%-lock.yaml",
          "%.git/",             -- we need hidden=true to see .env files, but it results in showing .git files also, hence excluding them
          "node_modules",       -- path for nodejs modules
          -- output of 'nextjs build', trailng '/' ensures only folder is exclude and not any files with name 'next' in it
          -- '.', is special character which will match with anything, to avoid hiding folders with 'next' in it, use "%" before '.'
          "%.next/",
          "typechain/", -- types directory created by typechain npm package
          "artifacts/", -- solidity contract artifacts
          "a%.out",     -- output after cpp file compilation
        }
      }
    }

    telescope.load_extension("live_grep_args")
  end,
}
