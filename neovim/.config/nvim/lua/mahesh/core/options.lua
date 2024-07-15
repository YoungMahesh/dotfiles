-- https://neovim.io/doc/user/options.html
-- https://neovim.io/doc/user/quickref.html#option-list
local opt = vim.opt
-- :echo <variable-name> -- check current value of variable name
-- :echo &<option-name>  -- check current value of option name
-- :echo &tabstop
-- :set foldmethod? -- check current value of option - foldmethod
-- :set foldmethod=syntax -- change value of option - foldmethod

opt.clipboard:append("unnamedplus") -- use system clipboard as default register

opt.tabstop = 2                     -- Tab character width (2 spaces)
opt.shiftwidth = 2                  -- Indentation size (2 spaces)

-- without expandtab when you copy code from neovim, paste into another editor, another editor will show more spaces/indentation than what you see in neovim
opt.expandtab = true  -- Show tabs as spaces

opt.autoindent = true -- copy indent from current line when starting new one

opt.number = true

opt.wrap = false

-- incremental-search: highlight text 'while typing' search text with :/<search-text>
opt.incsearch = true

-- NOTE: unlike lua-plugins changes in this file does not reflect across all session immediately when you restart nvim, don't know why for now
opt.foldmethod = 'indent' -- :set foldmethod=syntax,manual,indent

-- by default, all folds are closed, to keep all folds open when we open new file :set foldenable!
opt.foldenable = false

----------------------- does not work --------------------------------------------------
-- :h fold-foldlevel 			:h foldlevel
-- high foldlevel is needed to keep all folds open by default
-- opt.foldlevel = 100 -- :h
