-- neovim for vscode: (asvetliakov.vscode-neovim)[https://github.com/vscode-neovim/vscode-neovim?tab=readme-ov-file#neovim-configuration]
local vscode = require('vscode')
local keymap = vim.keymap

keymap.set('n', 'ss', function()
  vscode.call('workbench.action.files.save')
end, {desc = 'save file'})
keymap.set('n', '<leader>ff', function()
  vscode.call('editor.action.formatDocument')
end, { desc = "format current file" })

--keymap.set('n', '<leader>fv', function()
--  vscode.call('workbench.view.explorer')
--end, { desc = "format current file" })
--keymap.set('n', 'go', function()
--  vscode.call('workbench.view.scm')
--end, {desc = 'git open'})

-- tab switch
keymap.set("n", "tn", function()
  vscode.call('workbench.action.nextEditor')
end, { desc = "Go to next tab" })
keymap.set("n", "tp", function()
  vscode.call('workbench.action.previousEditor')
end, { desc = "Go to next tab" })
keymap.set("n", "t;", function()
  vscode.call('workbench.action.closeActiveEditor')
end, { desc = "close current file" })
keymap.set("n", "tq", function()
  vscode.call('workbench.action.closeOtherEditors')
end, { desc = "close other files" })
-- for <c-w> use { nowait = true}
keymap.set("n", "to", function()
  vscode.call('workbench.action.files.newUntitledFile')
end, { desc = "close current file" })


-- fold
keymap.set("n", "zc", function()
  vscode.call('editor.fold')
end, { desc = "fold code snippet" })
keymap.set("n", "zo", function()
  vscode.call('editor.unfold')
end, { desc = "unfold code snippet" })
-- as we are using folding from vscode, neovim is unware when we move through folding, which leads to fold-open when we use default
--  keybinding, hence use vscode keybinding for up and down movement
keymap.set({'n', 'v'}, 'j', function()
  vscode.call('cursorDown')
end, { desc = 'move down' })
keymap.set({'n', 'v'}, 'k', function()
  vscode.call('cursorUp')
end, { desc = 'move down' })


keymap.set({'n'}, '<leader>lr', function()
  vscode.call('editor.action.goToReferences')
end, { desc = 'open references' })

