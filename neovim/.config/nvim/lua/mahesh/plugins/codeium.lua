return {
  'Exafunction/codeium.vim',
  event = 'BufEnter',
  config = function()
    vim.g.codeium_enabled = false -- by default, codeium is disabled
    vim.g.codeium_disable_bindings = 1 -- disable default keybindings

    -- https://github.com/Exafunction/codeium.vim?tab=readme-ov-file#show-codeium-status-in-statusline
    -- to execute .vimrc code in .lua for neovim, you need to wrap that code with vim.cmd([[ ]])
    --vim.cmd([[
    --  set statusline+=\{…\}%3{codeium#GetStatusString()}
    --]])
    
    -- https://github.com/Exafunction/codeium.vim?tab=readme-ov-file#%EF%B8%8F-keybindings
    vim.keymap.set('i', '<c-o>', function () return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    vim.keymap.set('i', '<c-j>', function() return vim.fn['codeium#CycleCompletions'](1) end, { expr = true, silent = true, noremap = true })
    vim.keymap.set('i', '<c-k>', function() return vim.fn['codeium#CycleCompletions'](-1) end, { expr = true, silent = true, noremap = true })
    vim.keymap.set('i', '<c-x>', function() return vim.fn['codeium#Clear']() end, { expr = true, silent = true, noremap = true })
    vim.keymap.set('n', 'cc', function()
      vim.cmd('CodeiumEnable')
      vim.notify("Codeium enabled", vim.log.levels.INFO)
    end,  { remap = false })
  end,
}

