-- :checkhealth telescope
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    local keymap = vim.keymap
    -->p == find, fl=find-list, fs=find-string, fb=find-buffer, fh=find-help, fr=find-recent
    -- ps=project-search, search current file
    keymap.set('n', '<leader>pf', builtin.find_files, { desc = 'Fuzzy find files in cwd' })
    keymap.set('n', '<leader>ps', builtin.live_grep, { desc = 'Find string in cwd' })
    keymap.set('n', '<leader>pb', builtin.buffers, {})
    keymap.set('n', '<leader>ph', builtin.help_tags, {})
    keymap.set('n', '<leader>pr', builtin.oldfiles, { desc = 'Fuzzy find recent files' })
    keymap.set('n', '<leader>pc', '<cmd>Telescope grep_string<cr>', { desc = 'Find string under cursor in cwd' })
    keymap.set('n', '<leader>pm', builtin.marks, { desc = 'Find string under cursor in cwd' })
    -- vim.keymap.set('n', '<leader>ps', function()
    --  builtin.grep_string({ search = vim.fn.input("Grep > ") });
    -- end)
    -- <C-p> = Ctrl+p
    keymap.set('n', '<C-p>', builtin.git_files, {})



    --vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
    --vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
    --vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
  end,
}
