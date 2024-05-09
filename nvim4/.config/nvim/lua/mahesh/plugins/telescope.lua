-- :checkhealth telescope 
return {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
-- or                              , branch = '0.1.x',
      dependencies = { 'nvim-lua/plenary.nvim' },
      config = function()
	      local builtin = require('telescope.builtin')
	  --> p == project, pf=project-files, 
	  -- ps=project-search, search current file
	vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
	vim.keymap.set('n', '<leader>ps', function()
		builtin.grep_string({ search = vim.fn.input("Grep > ") });
	end)
	-- <C-p> = Ctrl+p
	vim.keymap.set('n', '<C-p>', builtin.git_files, {})
	--vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
	--vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
	--vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})
end,
    }
