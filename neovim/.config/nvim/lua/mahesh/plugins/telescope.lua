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
    local function new_tab_on_result_select(prompt_bufnr)
      local actions = require('telescope.actions')
      local action_state = require('telescope.actions.state')

      actions.select_default:replace(function()
        actions.close(prompt_bufnr) -- switch to normal mode (from insert mode) inside selected file

        local selection = action_state.get_selected_entry()
          if selection == nil then
            vim.notify("No results found") -- shown after clicking 'Enter' in telescope-window
            -- you cannot close telescope window prompt from here because this function (select_default) executes 
            --    after you click 'Enter' in telescope window prompt
        else
          local file_path = selection.filename or selection[1]
          if selection.lnum then  -- If it's a grep result with line number
            vim.cmd('tab split ' .. vim.fn.fnameescape(file_path))
            vim.api.nvim_win_set_cursor(0, {selection.lnum, selection.col or 0})
          else
            vim.cmd('tab split ' .. vim.fn.fnameescape(file_path))
          end
        end
      end)
      return true
    end


    keymap.set('n', '<c-o>', function()
      builtin.find_files({
        hidden = true, no_ignore = true
      })
    end, {desc = 'search files in cwd'} )
    keymap.set('n', '<c-p>', function()
      builtin.find_files({
        hidden = true, no_ignore = true,
        attach_mappings = new_tab_on_result_select
      })
    end, { desc = 'search files in cwd; open in new tab' })

    keymap.set('n', '<leader>fc', ":Telescope grep_string <cr>", { desc = 'Find string under cursor in cwd' })

    -- traditional grep_string, uses regex, for which i need to use escape character(\) before special symbols like ".", "/", etc
    -- hence search through Grep
    keymap.set('n', '<leader>fk', function()
      builtin.grep_string({
        search = vim.fn.input("Grep > "),
        attach_mappings = new_tab_on_result_select,
        additional_args = function()
          return {
          "--glob", "!*.svg" -- exclude .svg files
        }
        end
      })
    end, { desc = 'search string (without regex) cursor in cwd' })

    -- fs - find specific (case sensitive)
    keymap.set('n', '<leader>fs', function()
      builtin.grep_string({
        search = vim.fn.input("Grep > "),
        attach_mappings = new_tab_on_result_select,
        additional_args = function()
            return {
          "--case-sensitive",
          "--glob", "!*.svg" -- exclude .svg files
        }
        end
      })
    end)

    vim.keymap.set('v', '<leader>fs', function()
      vim.cmd('normal! "vy') -- Yank the selected text into the default register
      local selected_text = vim.fn.getreg('"') -- Get the yanked text
      print("Selected Text: " .. selected_text)

      builtin.grep_string({
        search = selected_text,
        attach_mappings = new_tab_on_result_select,
        additional_args = function()
          return {
            "--case-sensitive",
            "--glob", "!*.svg" -- exclude .svg files
          }
        end
      })
    end)

    -- :help telescope.command
    -- no_ignore=true - show files form paths which are mentioned in .gitignore
    --    large directories like node_modules are handled through defaults.file_ignore_patterns in telescope.setup
    -- hidden=true - show files starting with . - like .env
    -- <C-p> = Ctrl+p
    
    telescope.setup {
      -- `:help telelscope.defaults`
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
        -- --smart-case (enables smart case matching) or --case-sensitive
        -- --hidden       - includes hidden files in the search.
        -- 1) :help telescope.defaults.vimgrep_arguments 2) K on vimgrep_arguments here 3) rg --help
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
