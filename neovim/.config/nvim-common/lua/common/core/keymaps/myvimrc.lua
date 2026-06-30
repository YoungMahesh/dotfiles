-- vim.cmd('so $MYVIMRC') for entire config, 'so %' for current file config
-- detects and enables new keymap but does NOT remove/update existing keymaps
--    because vim.keymap.set() does not automatically "unbind" previously set mappings.
--    It only defines or overrides the mappings for the given mode and key combination.
-- If you put code to remove all keymaps and reload them again, then does not work
vim.keymap.set('n', 'sr', function()
  vim.cmd('w')
  vim.cmd('so $MYVIMRC')
  vim.notify('reloaded new config')
end, {desc = 'reload new config'})

-- if you remove some keymap this way, then you cannot get it back even with `:so $MYVIMRC`, you need to restart neovim
--vim.keymap.set('n', 'sd', function()
--  vim.cmd('w')
--  local key = vim.fn.input('Enter the keymap to delete (e.g., sr): ')
--  vim.keymap.del('n', key)
--  print('Removed keymap: ' .. key)
--end, { desc = 'Dynamically remove a keymap' })
