-- create a path to where the `lazy.nvim` plugin will be stored. `vim.fn.stdpath("data")` returns the standard path for Neovim's data directory, and `.. "/lazy/lazy.nvim"` appends `/lazy/lazy.nvim` to that path.
-- by default "data" directory resided at `~/.local/share/nvim/data`
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- checks if the `lazy.nvim` plugin already exists at the `lazypath`. `vim.loop.fs_stat` returns `nil` if the file or directory does not exist.
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

-- add the `lazy.nvim` plugin to the runtime path (`rtp`). The `prepend` method adds the path at the beginning of the `rtp`, so Neovim will look for plugins in `lazy.nvim` before looking in other directories.
vim.opt.rtp:prepend(lazypath)


-- load the `lazy.nvim` plugin and calls its `setup` function. The argument `"mahesh.plugins"` is the module where your plugins are defined. The `lazy.nvim` plugin will handle loading these plugins when they are needed, rather than loading them all at startup.
-- require("lazy").setup("mahesh.plugins")
require("lazy").setup({ {import = "mahesh.plugins"}, {import = "mahesh.plugins.lsp"}})
