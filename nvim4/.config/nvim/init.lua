-- installation
-- remove previous installation cache (taken from lazyvim installation script):
--	 mv ~/.local/share/nvim{,.bak}
--	 mv ~/.local/state/nvim{,.bak}
--	 mv ~/.cache/nvim{,.bak}
-- 1. download Tarball: https://github.com/neovim/neovim/releases/tag/v0.10.0
-- 2. installation script: https://github.com/neovim/neovim/blob/master/INSTALL.md#linux
-- nvim --version
-- :checkhealth
require("mahesh.core")
require("mahesh.lazy")
