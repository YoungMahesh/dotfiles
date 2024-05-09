local opt = vim.opt

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

opt.tabstop = 2 -- spaces for tabs
opt.shiftwidth = 2 -- spaces for indent width
opt.number = true
opt.wrap = false


-- https://vimhelp.org/pi_netrw.txt.html
-- `netrw` is a built-in plugin in neovim for navigating file system and performing file operations
-- `g:` global variable
-- there are 5 liststyles (0-4)
-- 	0: thin (one file per line, no details)
-- 	1: long (detailed listing with file attributes)
-- 	2: wide (multiple files per line)
-- 	3: tree (tree-style listing)
-- 	4: quickfix (quickfix-style listing)
vim.cmd("let g:netrw_liststyle = 3")
