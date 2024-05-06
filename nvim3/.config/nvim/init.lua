-- neovim automatically load this file ~/.config/nvim/init.lua file, all other .lua files need to be imported here (using require ""), to be able to work with neovim
-- lua-directory: neovim by default adds ~/.config/nvim/lua directory in paths, hence if we have ~/.config/nvim/lua/mahesh, then we can import it as "mahesh" directly
-- init.lua: in require("mahesh.core"), neovim checks first for i) lua/mahesh/core.lua, if not found it checks for ii) lua/mahesh/core/init.lua
require("mahesh.core") -- import all config from lua/mahesh/core directory to this file

-- type neovim-cmd `:Lazy` to view lazyvim plugins table
require("mahesh.lazy")
