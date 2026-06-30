
local keymap = vim.keymap

-- Copy absolute directory path
keymap.set("n", "<leader>cd", '<cmd>let @+ = expand("%:p:h")<CR>', { desc = "Copy absolute directory" })

-- Copy absolute path
keymap.set("n", "<leader>cf", '<cmd>let @+ = expand("%:p")<CR>', { desc = "Copy absolute path" })
