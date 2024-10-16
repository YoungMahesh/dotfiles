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

