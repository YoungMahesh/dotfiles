-- :help :term
-- :term

vim.keymap.set('n', 'st', function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd('J')
  vim.api.nvim_win_set_height(0, 10)
end, {desc = 'open terminal'})

--vim.api.nvim_create_autocmd('TermOpen', {
--  group = vim.api.nvim_create_augroup('custom-term-open', {clear = true}),
--  callback= function()
--  end
--})
