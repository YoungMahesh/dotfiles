local keymap = vim.keymap

--------------------------------- quickfix list ----------------------------------------
keymap.set("n", "cn", "<cmd>cn<CR>", { desc = "open next item in quickfix list" })
keymap.set("n", "cp", "<cmd>cp<CR>", { desc = "open previous item in quickfix list" })
keymap.set("n", "cl", "<cmd>ccl<CR>", { desc = "open previous item in quickfix list" })
--:copen " Open the quickfix window
--:ccl   " Close it
--:cw    " Open it if there are "errors", close it otherwise (some people prefer this)
--:[count]cn    " Go to the next error in the window, if count is given go to count-th next error
--:[count]cp    " Go to the previous error in the window, if count is given go to count-th previous error
--:cnf   " Go to the first error in the next file
--:[count]cc   " Go to error under cursor (if cursor is in quickfix window), if count is given go to count-th error
-- `Ctrl+w` to move to and out of quickfix list window
-- chistory     " Open all quickfix lists opened until now in current session
-- [count]chistory     " open count'th quickfix list from chistory-list

