-- :help :term
-- :term

-- vim.keymap.set('n', 'st', function()
--   vim.cmd.vnew()
--   vim.cmd.term()
--   vim.cmd.wincmd('J')
--   vim.api.nvim_win_set_height(0, 10)
-- end, {desc = 'open terminal'})

vim.keymap.set('n', 'st', function()
    local dir = vim.fn.expand('%:p:h')
    vim.cmd('new')
    vim.fn.termopen(vim.o.shell, {
        cwd = dir,
    })
    vim.cmd('startinsert')
end, { desc = 'Open terminal' })


--vim.api.nvim_create_autocmd('TermOpen', {
--  group = vim.api.nvim_create_augroup('custom-term-open', {clear = true}),
--  callback= function()
--  end
--})
