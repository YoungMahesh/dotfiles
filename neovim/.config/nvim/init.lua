-- installation/upgrade, `nvim --version`: 0.9.5 -> 0.10.1 (on 26-august-2024)
-- do not move to new version until it becomes 3 month old, as plugins may not be compatible with new version
-- remove previous installation cache (taken from lazyvim installation script):
--	 mv ~/.local/share/nvim{,.bak}
--	 mv ~/.local/state/nvim{,.bak}
--	 mv ~/.cache/nvim{,.bak}
-- 1. download Tarball: https://github.com/neovim/neovim/releases/tag/v0.10.0
-- 2. installation script: https://github.com/neovim/neovim/blob/master/INSTALL.md#linux
-- nvim --version
-- :checkhealth
-- :help config, default path: ~/.config/nvim/init.lua 
-- define config path: export $XDG_CONFIG_HOME=<path-name>, neovim will look for $XDG_CONFIG_HOME=/nvim/init.lua

-- requirements:
-- treesitter, mason needs c compiler such as gcc, 
--    on ubuntu install compilers with: `sudo apt install build-essential`
--    on nixos install `gcc` package
-- tsserver needs npm to install packages
-- https://github.com/BurntSushi/ripgrep for telescope
-- eslint_d :Mason -> eslint_d -> i

require("mahesh.core")

local username = os.getenv("USER")
if username == "mahesh" then
  -- load plugins
  require("mahesh.lazy")
end
