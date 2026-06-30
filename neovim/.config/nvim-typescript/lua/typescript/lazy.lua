-- default setup for lazy: https://github.com/folke/lazy.nvim?tab=readme-ov-file#-installation
-- :Lazy  => view lazyvim plugins
-- :checkhealth lazy => get health, version
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)
vim.opt.runtimepath:prepend(vim.fn.expand("~/.config/nvim-common"))
require("lazy").setup({
    { import = "typescript.plugins" },
    { import = "common.plugins" }
})
