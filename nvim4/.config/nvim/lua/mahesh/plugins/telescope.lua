-- :checkhealth telescope
return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.6',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    local keymap = vim.keymap

    -- https://github.com/nvim-telescope/telescope.nvim?tab=readme-ov-file#default-mappings
    --	<C-x> go to file selection as a split
    --	<C-v> go to file selection as a vsplit
    --	<C-t> go to a file in a new tab
		--	<C-q> send all items to quickfix list

    -->f == find, fl=find-list,  fb=find-buffer, fh=find-help, fr=find-recent
    -- default mappings in docs are does not get enabled by default, need to be enabled here, 
    keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Fuzzy find files in cwd' })
    keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find string in cwd' })
    keymap.set('n', '<leader>fb', builtin.buffers, {})
    keymap.set('n', '<leader>fh', builtin.help_tags, {})
    -- custom mappings
    keymap.set('n', '<leader>fr', builtin.oldfiles, { desc = 'Fuzzy find recent files' })
    keymap.set('n', '<leader>fc', '<cmd>Telescope grep_string<cr>', { desc = 'Find string under cursor in cwd' })

    --keymap.set('n', '<leader>fm', "<cmd>Telescope marks mark_type=local<cr>", { desc = 'Find marks' }) -- does not work
    --keymap.set('n', '<leader>fm', builtin.marks, { desc = 'Find string under cursor in cwd' })
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
