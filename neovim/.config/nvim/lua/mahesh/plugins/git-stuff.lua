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
      vim.keymap.set("n", "go", "<cmd>0G<cr>", {desc = 'open git status'})
      vim.keymap.set("n", "gl", "<cmd>0Git log<cr>", {desc = 'open git status'})
    end,
  },
  --{
  --  "lewis6991/gitsigns.nvim",
  --  config = function()
  --    -- .setup() is required
  --    require('gitsigns').setup {
  --      on_attach = function(bufnr)
  --        local gitsigns = require('gitsigns')

  --        local function map(mode, l, r, opts)
  --          opts = opts or {}
  --          opts.buffer = bufnr
  --          vim.keymap.set(mode, l, r, opts)
  --        end

  --        -- Navigation
  --        --map('n', ']c', function()
  --        --  if vim.wo.diff then
  --        --    vim.cmd.normal({ ']c', bang = true })
  --        --  else
  --        --    gitsigns.nav_hunk('next')
  --        --  end
  --        --end)
  --        --map('n', '[c', function()
  --        --  if vim.wo.diff then
  --        --    vim.cmd.normal({ '[c', bang = true })
  --        --  else
  --        --    gitsigns.nav_hunk('prev')
  --        --  end
  --        --end)

  --        -- Actions
  --        map('n', '<leader>hs', gitsigns.stage_hunk) -- <leader>ha is booked for harpoon-add
  --        map('n', '<leader>hr', gitsigns.reset_hunk)
  --        --map('v', '<leader>hs', function() gitsigns.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
  --        --map('v', '<leader>hr', function() gitsigns.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
  --        --map('n', '<leader>hS', gitsigns.stage_buffer)
  --        map('n', '<leader>hu', gitsigns.undo_stage_hunk)
  --        --map('n', '<leader>hR', gitsigns.reset_buffer)
  --        map('n', '<leader>hp', gitsigns.preview_hunk)
  --        map('n', '<leader>hi', gitsigns.preview_hunk_inline)
  --        --map('n', '<leader>hb', function() gitsigns.blame_line { full = true } end)
  --        --map('n', '<leader>tb', gitsigns.toggle_current_line_blame)
  --        map('n', '<leader>hd', gitsigns.diffthis)
  --        --map('n', '<leader>hD', function() gitsigns.diffthis('~') end)
  --        --map('n', '<leader>td', gitsigns.toggle_deleted)

  --        -- Text object
  --        --map({ 'o', 'x' }, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
  --      end
  --    }
  --  end
  --}
}
