local opt = vim.opt

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

opt.tabstop = 2 -- spaces for tabs
opt.shiftwidth = 2 -- spaces for indent width
--opt.expandtab = true -- expand tab to spaces
--opt.autoindent = true -- copy indent from current line when starting new one

opt.number = true

opt.wrap = false

-- incremental-search: highlight text 'while typing' search text with :/<search-text>
opt.incsearch = true
