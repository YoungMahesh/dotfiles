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
  local file_type = vim.bo.filetype
  -- check file-type using ->  `:echo &filetype` or  `:LspInfo`
  local prettier_file_types = { 'typescript', 'javascript', 'typescriptreact', 'javascriptreact', 'markdown' }
  if not vim.tbl_contains(prettier_file_types, file_type) then
    vim.lsp.buf.format({ async = false, timeout_ms = 10000, formatting_options = { tabSize = 2, insertSpaces = true } })
    return
  end

  -- format using prettier
  -- install prettier globally: npm install -g prettier
  -- format all files initially: prettier --write .
  -- format spacific file: !prettier --write %, in neovim terminal '%' return path of current file
  -- https://prettier.io/playground/
  -- prettier does not put multiple function parameters on single line, even if they are few -> https://prettier.io/docs/en/option-philosophy
  -- https://prettier.io/docs/en/options
  -- below is logic to format through keymap
  -- Get the current buffer content
  local bufnr2 = vim.api.nvim_get_current_buf()
  local lines = vim.api.nvim_buf_get_lines(bufnr2, 0, -1, false)
  local content = table.concat(lines, '\n')

  local prettier_cmd = find_prettier()

  -- Run Prettier on the content
  local prettier_output = vim.fn.system(
    prettier_cmd .. ' --stdin-filepath ' .. vim.fn.shellescape(vim.fn.expand('%')),
    content)

  local output = vim.fn.systemlist(
    prettier_cmd .. ' --stdin-filepath ' .. vim.fn.shellescape(vim.fn.expand('%')),
    content)
  if vim.v.shell_error ~= 0 then
    local errmsg = table.concat(output, '\n')
    vim.notify('Prettier encountered an error: ' .. errmsg, vim.log.levels.ERROR)
    return
  end

  -- Replace buffer content with formatted content
  local formatted_lines = vim.split(prettier_output, '\n')
  vim.api.nvim_buf_set_lines(bufnr2, 0, -1, false, formatted_lines)

  --vim.notify('Buffer formatted', vim.log.levels.INFO)
end

vim.keymap.set('n', '<leader>ff', function()
  format_buffer()
end, { desc = "Format current buffer with Prettier (TypeScript/JavaScript only)" })

return {}
