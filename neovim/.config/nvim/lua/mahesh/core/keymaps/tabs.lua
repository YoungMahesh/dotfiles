local keymap = vim.keymap
keymap.set("n", "to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
--keymap.set("n", "tx", "<cmd>w<cr><cmd>tabclose<cr>", { desc = "save changes and close current tab" })
--keymap.set('n', '<C-w>', "<cmd>tabclose<cr><cmd>tabp<cr>", { noremap = true, silent = true, nowait = true, desc = 'Close current tab' })
--keymap.set('n', "tc", "<cmd>tabclose<cr><cmd>tabp<cr>", { desc = 'Close current tab' })
keymap.set('n', "tc", function()
    if #vim.api.nvim_list_tabpages() == 1 then
        vim.cmd('quit')
    else
        vim.cmd('tabclose')
        vim.cmd('tabp')
    end
end, { desc = 'Close current tab, quit if last tab' })
keymap.set("n", "tn", "<cmd>tabn<cr>", { desc = "Go to next tab" })
keymap.set("n", "tp", "<cmd>tabp<cr>", { desc = "Go to previous tab" })
keymap.set("n", "tt", "<cmd>tabnew %<cr>", { desc = "Open current buffer in new tab" })
keymap.set("n", "tl", "<cmd>tabmove -1<cr>", { desc = "move current tab to left" })
keymap.set("n", "tr", "<cmd>tabmove +1<cr>", { desc = "move current tab to right" })
-- let curpos = getcurpos() -- get cursor position,  call setpos(".", curpos) -- move cursor to original position
-- :%bd -- closes all buffers, e# - opens the alternate file (which will be your current buffer)
-- bd# -- removes the alternate buffer from the buffer list, 
-- normal! zz -- bring curosr to the center of screen
keymap.set('n', 'tq',
  ':let curpos = getcurpos() | %bd | e# | bd# | call setpos(".", curpos) | normal! zz<cr>',
  { noremap = true, silent = true, desc = 'close all tabs except current' }
)

-- Function to close all buffers except current one
--local function close_other_buffers()
--    -- Store current buffer number
--    local current = vim.api.nvim_get_current_buf()
--    -- Store cursor position
--    local curpos = vim.api.nvim_win_get_cursor(0)
--    
--    -- Get list of all buffers
--    local buffers = vim.api.nvim_list_bufs()
--    
--    -- Close all buffers except current one
--    for _, buf in ipairs(buffers) do
--        if buf ~= current and vim.api.nvim_buf_is_valid(buf) then
--            vim.api.nvim_buf_delete(buf, { force = true })
--        end
--    end
--    
--    -- Restore cursor position
--    vim.api.nvim_win_set_cursor(0, curpos)
--end
--
---- Map tq to the function
--vim.keymap.set('n', 'tq', close_other_buffers, { noremap = true, silent = true })

-- 2gt -> switch to 2nd tab, 4gt -> switch to 4th tab, etc
