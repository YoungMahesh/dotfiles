return {
	"nvim-tree/nvim-tree.lua",
	dependencies = "nvim-tree/nvim-web-devicons",
	config = function()
		local nvimtree = require("nvim-tree")

		-- recommended settings from nvim-tree documentation
		-- https://github.com/nvim-tree/nvim-tree.lua?tab=readme-ov-file#setup
		vim.g.loaded_netrw = 1
		vim.g.loaded_netrwPlugin = 1

		-- https://github.com/nvim-tree/nvim-tree.lua?tab=readme-ov-file#custom-mappings
		local function my_on_attach(bufnr)
			local api = require("nvim-tree.api")
			local function opts(desc)
				return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
			end

			-- default mappings
			api.config.mappings.default_on_attach(bufnr)

			-- custom mappings
			-- <CR> == carriage return == Enter
			vim.keymap.set("n", "<CR>", api.node.open.tab, opts("Open: New tab"))
		end

		nvimtree.setup({
			on_attach = my_on_attach,
			view = {
				width = 35,
				-- relativenumber = true,
			},

			-- change folder arrow icons
			renderer = {
				indent_markers = {
					enable = true,
				},
				icons = {
					glyphs = {
						folder = {
							arrow_closed = "", -- arrow when folder is closed
							arrow_open = "", -- arrow when folder is open
						},
					},
				},
			},

			-- disable window_picker for explorer to work well with window splits
			actions = {
				open_file = {
					window_picker = {
						enable = false,
					},
				},
			},
			filters = {
				custom = { ".DS_Store" },
			},
			git = {
				ignore = false,
			},
		})

		local keymap = vim.keymap
		-- ->e == explorer, all nvim-tree commands: https://github.com/nvim-tree/nvim-tree.lua/blob/master/doc/nvim-tree-lua.txt
		-- 'n', 'q', {desc = 'close file explorer'}
		keymap.set("n", "<leader>ee", "<cmd>NvimTreeFindFile<CR>", { desc = "Open file explorer on current file" })
		keymap.set("n", "<leader>ex", "<cmd>NvimTreeClose<CR>", { desc = "Close file explorer" })
	end,
}
