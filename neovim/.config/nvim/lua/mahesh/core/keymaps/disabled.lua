local keymap = vim.keymap
-- accidental-execution: unexpected cmd execution due accidental delay between <leader> and other-kay
keymap.set("n", "s", "<Nop>", { noremap = true, desc = "remove key s" }) -- avoid accidental-execution (ss)
keymap.set("n", "x", "<Nop>", { noremap = true, desc = "remove key s" }) -- avoid accidental-execution (sx)
keymap.set("n", "T", "<Nop>", { noremap = true })                        -- used by tmux-config
keymap.set('n', 'cn', '<Nop>', { noremap = true })                       -- avoid accidental-execution (cn), `:help cn`

