local prettier_path = nil

local function find_prettier()
  if prettier_path then return prettier_path end

  local local_prettier = vim.fn.getcwd() .. '/node_modules/.bin/prettier'
  if vim.fn.executable(local_prettier) == 1 then
    prettier_path = local_prettier
  else
    prettier_path = 'prettier'
  end
  return prettier_path
end

local function format_buffer()
  vim.cmd('silent! write') -- save the current buffer

  local file_type = vim.bo.filetype
  local filename = vim.fn.expand('%:p')
  -- check file-type using ->  `:echo &filetype` or  `:LspInfo`
  local prettier_file_types = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'markdown', 'json' }
  if vim.tbl_contains(prettier_file_types, file_type) then

    local prettier_cmd = find_prettier()
    -- Format the file
    -- % refers to the current file name relative to the current working directory.
    -- %:p expands to the full (absolute) path of the current file, p == path
    local output = vim.fn.system(prettier_cmd .. ' --write ' .. vim.fn.shellescape(filename))

    -- handle error
    if vim.v.shell_error ~= 0 then
      vim.notify('Prettier encountered an error: ' .. output, vim.log.levels.ERROR)
      return
    end
  elseif vim.tbl_contains({'sql'}, file_type) then
  local sqlfmt = vim.fn.expand('~/.local/share/nvim/mason/bin/sql-formatter')
    local output = vim.fn.system(sqlfmt .. ' ' .. vim.fn.shellescape(filename) .. ' -o ' .. vim.fn.shellescape(filename))
    if vim.v.shell_error ~= 0 then
      vim.notify('sqlfmt encountered an error: ' .. output, vim.log.levels.ERROR)
      return
    end
  else
    vim.lsp.buf.format({ async = false, timeout_ms = 10000, formatting_options = { tabSize = 2, insertSpaces = true } })
  end
  vim.cmd('edit!') -- Reload the buffer
end

vim.keymap.set('n', '<leader>ff', function()
  format_buffer()
end, { desc = "Format current buffer with Prettier (TS/JS only)" })

return {}


-- install pip (package manager for python): sudo apt install python3 python3-pip -y
-- install autopep8 (formatter for python):

-------------------------- Format using Prettier -----------------------------------
-- install prettier globally: npm install -g prettier
-- format all files initially: prettier --write .
-- format spacific file: !prettier --write %, in neovim terminal '%' return path of current file
-- https://prettier.io/playground/
-- prettier does not put multiple function parameters on single line, even if they are few -> https://prettier.io/docs/en/option-philosophy
-- https://prettier.io/docs/en/options
