local keymap = vim.keymap
--------------------- `:help m` `help: mark`--------------------------------
-->m=markS
-- Map 'a-d to jump to mark position and center screen
-- string.byte() -> converts characters to their numeric ASCII/byte values, string.byte('a') == 97
-- string.char() -> converts numeric ASCII/byte values to characters, string.char(97) == 'a'
for mark = string.byte('a'), string.byte('d') do
  keymap.set('n', "'" .. string.char(mark), '`' .. string.char(mark) .. 'zz', {noremap = true, silent = true})
end

keymap.set("n", "ml", "<cmd>marks abcdefABCDEF<cr>", { desc = "show marks list from a to f" })
--keymap.set("n", "mm", "<cmd>marks ABCDE<cr>", { desc = "show marks list from a to f" })
-- `ma`: set mark a, `'a`: go to line of mark a, ``m`: go to position of mark, `['`: go to previous mark, `]'`: go to next mark
-- `:delm A` to delete mark A, `:delm a` to delete mark a
-- :marks: show all marks
-- keymap.set("n", "<leader>md", "<cmd>delmarks a-f<cr>", { desc = "delele marks from a to f" }) -- we rarely delete marks, hence no need to create shortcut for it
-- `:delm` delete all marks in current buffer, `:delm abc` delete mark a, mark b, mark c
-- `:delm A-Z` delete all global marks, `:delm 0-9` delete all numbered marks
