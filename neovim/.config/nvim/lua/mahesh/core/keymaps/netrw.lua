---------------------- ->netrw keybindings ---------------------------------
-- change Vim's current directory to match the directory you're browsing in Netrw, helps during copy-file
-- vim.g.netrw_keepdir = 0  -- cannot use as harpoon, telescope shows files only in current directory once netrw is opened
-- %          - create new file
-- d          - create new directory
-- R          - rename path/file
-- D          - delete
-- delete non-empty directory: mf(mark directory) -> mx(apply shell commands to marked files) -> rm -rf <enter>
-- move file: mt(mark target directory) -> mf(mark file) -> mc(copy marked file to target directory)
-- copy file in same directory: mt(go outside and mark current directory) -> mf(come inside and mark file) -> mc(copy file) -> you will get prompt for name of the file
--
-- % (current file), %:h (directory of current file)
-- copy file to parent-directory ->  :!cp % %:h/..
--   pressing <TAB> opens list of files in current directory, you can directory put full path with -> :!cp <Tab>


--vim.api.nvim_create_autocmd("FileType", {
--  pattern = "netrw",
--  callback = function()
--    local opts = { noremap = true, silent = true, buffer = true }
--
--
--    -- Remap 't' to do nothing
--    --vim.keymap.set('n', 't', '<Nop>', opts)
--
--    -- Remap 'o' to open in new tab
--    vim.keymap.set("n", "o", "t", opts)
--  end
--})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "netrw",
  callback = function()
    local opts = { noremap = true, silent = true, buffer = true }
    
    -- Disable 't' key
    vim.keymap.set("n", "t", "<Nop>", opts)
    
    -- Assign 't' functionality to 'o'
    vim.keymap.set("n", "o", function()
      -- Get the current file/directory name
      local file = vim.fn.expand("<cfile>")
      
      -- Get the current directory
      local dir = vim.fn.expand("%:p:h")
      
      -- Construct the full path
      local full_path = vim.fn.fnamemodify(dir .. "/" .. file, ":p")
      
      -- Open in a new tab
      vim.cmd("tabnew " .. vim.fn.fnameescape(full_path))
      
      -- If it's a directory, explore it
      if vim.fn.isdirectory(full_path) == 1 then
        vim.cmd("Explore")
      end
    end, opts)
  end
})
