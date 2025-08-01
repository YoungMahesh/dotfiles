----------------- keymaps -------------------
-- find keymaps: :map <leader>ff
--    provides file-path except for mahesh.vscode
--
-- c- == ctrl (e.g. <c-p> = Ctrl+p )

vim.g.mapleader = " " -- set <space> as leader key, this must come before other configuration for working of keymaps with <leader>
require("mahesh.core")
require("mahesh.disabled")

if vim.g.vscode then
  require("mahesh.vscode")
else
  require("mahesh.lazy")
end

--local username = os.getenv("USER")
--if username == "mahesh" then
--  -- load plugins
--  require("mahesh.lazy")
--end

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

-- fix :checkhealth warnings
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0


