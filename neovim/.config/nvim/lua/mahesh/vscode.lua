-- neovim for vscode: (asvetliakov.vscode-neovim)[https://github.com/vscode-neovim/vscode-neovim?tab=readme-ov-file#neovim-configuration]
local vscode = require('vscode')
local keymap = vim.keymap

-------------- save, format file ------------------------
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

------------- file explorer ---------------
-- [default file manipulation](https://github.com/vscode-neovim/vscode-neovim?tab=readme-ov-file#explorer-file-manipulation-bindings)
--  a[newFile], A[new folder], d[deleteFile], r[renameFile], x[cut], p[paste], y[copy]

-- [default explorer navigation](https://github.com/vscode-neovim/vscode-neovim?tab=readme-ov-file#explorerlist-navigation-bindings)
--  zm[collapseAll], gg[focusFirst], G[focusLast], j[down], k[up], h[focusParentFolder], enter[open file/folder]

------------------- tab switch -------------------
keymap.set("n", "<tab>", function()
  vscode.call('workbench.action.quickOpenPreviousRecentlyUsedEditorInGroup')
  vscode.call('workbench.action.acceptSelectedQuickOpenItem')
end, { desc = "Toggle current, previous recently used edtor" })
 keymap.set("n", "tn", function()
   vscode.call('workbench.action.nextEditor')
 end, { desc = "Go to next tab" })
keymap.set("n", "tp", function()
  vscode.call('workbench.action.previousEditor')
end, { desc = "Go to next tab" })
keymap.set("n", "tl", function()
  vscode.call('workbench.action.moveEditorLeftInGroup')
end, { desc = "Move tab to left" })
keymap.set("n", "tr", function()
  vscode.call('workbench.action.moveEditorRightInGroup')
end, { desc = "Move tab to right" })
keymap.set("n", "tt", function()
  vscode.call('workbench.action.pinEditor')
end, { desc = "pin current tab" })
keymap.set("n", "tu", function()
  vscode.call('workbench.action.unpinEditor')
end, { desc = "unpin current tab" })
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

----------------- bookmarks ---------------------
-- https://marketplace.visualstudio.com/items?itemName=alefragnani.Bookmarks
--    https://github.com/alefragnani/vscode-bookmarks
keymap.set('n', 'mm', function()
  vscode.call('bookmarks.toggle')
end, {desc = 'toggle bookmark'})
keymap.set('n', 'ml', function()
  vscode.call('bookmarks.listFromAllFiles')
end, {desc = 'list bookmarks'})
keymap.set('n', 'mn', function()
  vscode.call('bookmarks.jumpToNext')
end, {desc = 'next bookmark'})
keymap.set('n', 'mp', function()
  vscode.call('bookmarks.jumpToPrevious')
end, {desc = 'previous bookmark'})

-------------- vscode native folding -------------------
-- neovim's built-in folding does not affect vscode text, hence we are calling vscode's fold function to natively fold
-- built-in 'j', 'k' does not recognize this fold, hence use half-page up/down to move above/below fold
keymap.set("n", "zc", function()
  vscode.call('editor.fold')
end, { desc = "fold code snippet" })
keymap.set("n", "zo", function()
  vscode.call('editor.unfold')
end, { desc = "unfold code snippet" })

-- move over vscode folds
-- as we are using folding from vscode, neovim is unware when we move through folding, which leads to 
-- fold-open when we use default neovim keybinding to move up, down
-- hence use vscode keybinding for up and down movement


-- keymap.set({'n', 'v', 'x'}, 'j', function()
-- problem: if you select few lines in visual mode by pressing 'j', and then when you press 'k' instead of moving one line up, 
--    it moves to one line up from where selection started
--   vscode.call('cursorDown')
-- end, { desc = 'move down' })
--keymap.set({'n', 'v', 'x'}, 'k', function()
--  vscode.call('cursorUp')
--end, { desc = 'move up' })
--
--keymap.set({'v'}, 'j', function()
--  vscode.call('cursorDownSelect')
--end, { desc = 'move down select' })
-- x for visual-block mode keybinding
--keymap.set({'v'}, 'k', function()
--  -- problem: expected to move selection-cursor  'up', but it moves cursor 'left,up,right'
--  vscode.call('cursorUpSelect')
--end, { desc = 'move up select' })
--
--keymap.set({'x'}, 'j', function()
--  vscode.call('cursorColumnSelectDown')
--end, { desc = 'move down to select column' })
--keymap.set({'x'}, 'k', function()
--  vscode.call('cursorColumnSelectUp')
--end, { desc = 'move down to select column' })

--------------- git -----------------------
keymap.set({'n'}, 'go', function()
  vscode.call('git.openChange')
end, { desc = 'open git changes' })

-------------- references ------------------
keymap.set({'n'}, '<leader>lr', function()
  vscode.call('editor.action.goToReferences')
end, { desc = 'open references' })

