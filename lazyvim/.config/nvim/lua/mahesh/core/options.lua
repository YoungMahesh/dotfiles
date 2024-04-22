-- file explorer appearance in tree format
-- vim.cmd() runs vim script in lua file
-- netrw is built-in neovim file explorer
vim.cmd("let g:netrw_liststyle = 3")

local opt = vim.opt

-- relativenumber considers current line as 0 and tells distance up or down of other lines from current line
-- this helps in movement such as to move the fourth line above - 4k, move to 4th line below - 4j
opt.relativenumber = true

-- due to 'relativenumber' option, current line is shown as 0, show actual line number for current line
opt.number = true

-- tabs & indentation
opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
opt.shiftwidth = 2 -- 2 spaces for indent width
opt.expandtab = true -- expand tab to spaces
opt.autoindent = true -- copy indent from current line when starting new one

opt.wrap = false -- do not wrap lines

-- search settings
opt.ignorecase = true -- ignore case (e.g. "c" can be equal to "C") when searching
opt.smartcase = true -- if you include mixed case in your search, assumes you want case sensitive

-- opt.cursorline = true  -- underline the line on which cursor is present

-- enable various colorschemes such as tokyonight
-- need true color terminal like iterm2 or alacritty for working of colorschemes
opt.termguicolors = true
opt.background = "dark" -- choose "dark" mode if colorscheme supports dark-mode
opt.signcolumn = "yes" -- show sign columns so that text doesn't shift

-- backspace
opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
opt.splitright = true -- split vertical window to right
opt.splitbelow = true -- split horizontal window to bottom
