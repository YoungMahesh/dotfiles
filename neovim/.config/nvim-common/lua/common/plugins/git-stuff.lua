return {
  {
    "tpope/vim-fugitive",
    -- :G # open fugitive editor, :0G for fullscreen
    -- :G pull
    -- inside fugitive-editor
    --  `g?` open help
    --  `=` to open changes
    --  `-` toggle staged<->unstaged
    --  `P` push commit
    --  `O` open file under cursor in new tab
    --  `cc` commit staged changes
    --  `ca` Amend the last commit and edit the message.
    --
    --  'cz?' stash help
    --  'czz' push file to stash
    --  'czp' pop file from stash
    --
    config = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "fugitive",
        callback = function()
          -- keymaps for fugitive buffer (to be consistant with global keymap)
          -- Use vim.cmd to create buffer-local mappings in fugitive buffer
          vim.cmd([[
            nmap <buffer> a <C-u>zz
            nnoremap <buffer> s <Nop>
            nmap <buffer> sx <cmd>xa<cr>
            nmap <buffer> p <cmd>Git push<cr>
          ]])
        end,
      })
      vim.keymap.set("n", "go", "<cmd>0G<cr>", { desc = 'open git status' })
      vim.keymap.set("n", "gl", "<cmd>0Git log<cr>", { desc = 'open git status' })
    end,
  },
}
