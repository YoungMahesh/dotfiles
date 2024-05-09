return {
'mbbill/undotree',
config = function()
-- docs: https://github.com/mbbill/undotree/blob/master/plugin/undotree.vim#L27
-->u == undo, uu=toggle-undo-tree,  ue=edit-undo-tree
	vim.keymap.set('n', '<leader>uu', '<cmd>UndotreeToggle<cr>')
	vim.keymap.set('n', '<leader>ue', '<cmd>UndotreeFocus<cr>')
	end,
}
