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

----------------- installation ----------------------
-- installation/upgrade, `nvim --version`: 0.9.5 -> 0.10.1 (on 26-august-2024)
-- do not move to new version until it becomes 3 month old, as plugins may not be compatible with new version
-- remove previous installation cache (taken from lazyvim installation script):
--	 mv ~/.local/share/nvim{,.bak}
--	 mv ~/.local/state/nvim{,.bak}
--	 mv ~/.cache/nvim{,.bak}

-- 1. download Tarball: https://github.com/neovim/neovim/releases/tag/v0.10.1
-- 2. installation script: https://github.com/neovim/neovim/blob/master/INSTALL.md#linux
-- nvim --version
-- :checkhealth (will show if neovim detected config file)
-- append `export XDG_CONFIG_HOME=/root/.config` to .bashrc file, if config is located at: /root/.config/nvim/init.lua
--    verify path using `echo $XDG_CONFIG_HOME`
--    neovim will look for $XDG_CONFIG_HOME=/nvim/init.lua
--    :help config, default path: ~/.config/nvim/init.lua

-- requirements:
--    treesitter, harpoon, telescope, mason needs c compiler such as gcc,
--       on ubuntu install compilers with: `sudo apt install build-essential`
--       on nixos install `gcc` package
--    tsserver needs npm to install packages
--       on ubuntu install nodejs,npm through nvm: https://nodejs.org/en/download/package-manager
--    https://github.com/BurntSushi/ripgrep for telescope
--    eslint_d :Mason -> eslint_d -> i
--    sudo apt install luarocks
--    for more     :checkhealth -> /error\c 
