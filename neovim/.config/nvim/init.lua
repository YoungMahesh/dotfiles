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
-- treesitter, harpoon, telescope, mason needs c compiler such as gcc,
--    on ubuntu install compilers with: `sudo apt install build-essential`
--    on nixos install `gcc` package
-- tsserver needs npm to install packages
--    on ubuntu install nodejs,npm through nvm: https://nodejs.org/en/download/package-manager
-- https://github.com/BurntSushi/ripgrep for telescope
-- eslint_d :Mason -> eslint_d -> i

require("mahesh.core")
require("mahesh.disabled")


if vim.g.vscode then
  local vscode = require('vscode')
  local keymap = vim.keymap

  -- neovim for vscode: (asvetliakov.vscode-neovim)[https://github.com/vscode-neovim/vscode-neovim?tab=readme-ov-file#neovim-configuration]
  keymap.set('n', '<leader>ff', function()
    vscode.call('editor.action.formatDocument')
  end, { desc = "Format document" })

  -- tab switch
  keymap.set("n", "tn", function()
    vscode.call('workbench.action.nextEditor')
  end, { desc = "Go to next tab" })
  keymap.set("n", "tp", function()
    vscode.call('workbench.action.previousEditor')
  end, { desc = "Go to next tab" })
  keymap.set("n", "<C-w>", function()
    vscode.call('workbench.action.closeActiveEditor')
  end, { desc = "close current file", nowait = true })

  -- fold
  keymap.set("n", "zc", function()
    vscode.call('editor.fold')
  end, { desc = "fold code snippet" })
  keymap.set("n", "zo", function()
    vscode.call('editor.unfold')
  end, { desc = "unfold code snippet" })
  -- as we are using folding from vscode, neovim is unware when we move through folding, which leads to fold-open when we use default
  --  keybinding, hence use vscode keybinding for up and down movement
  keymap.set('n', 'j', function()
    vscode.call('cursorDown')
  end, { desc = 'move down' })
  keymap.set('n', 'k', function()
    vscode.call('cursorUp')
  end, { desc = 'move down' })
else
  require("mahesh.lazy")
end

--local username = os.getenv("USER")
--if username == "mahesh" then
--  -- load plugins
--  require("mahesh.lazy")
--end
