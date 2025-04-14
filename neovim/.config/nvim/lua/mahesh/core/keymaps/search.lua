-- related: ../options.lua#search

---------------------- ->search ---------------------------------
-- 1) search text by typing ->   /<search-text>  -> in normal mode
--    append \c to make search case-insensitive
-- 2) search hovered word, line, group-of-words ->  type `*` in normal mode
-- move through search results -> enter, after this use `n` or `N` to move through search-results

vim.keymap.set('n', 'n', 'nzz', {desc='n = next-result, zz = cursor at center of screen'})
vim.keymap.set('n', 'N', 'Nzz')
-- x for visual mode, v for visual-block mode, n for normal mode

vim.keymap.set('v', '/', "\"fy/\\V<C-R>f<CR>", { desc = 'Search highlighted text in current buffer' } )

---------------------- ->search and replace (single page) ---------------------------------
--
-- replace a word within a selected text (selected using v, V, Ctrl+v)
--    type `:` -> `s/<old-word>/<new-word>` -> enter
--      `:'<,'>` appears automatically when you press `:` in Visual mode - it indicates the range of the visual selection
-- Trick 1 - one word at a time (:help /)
--    1. search word with -> /<word><cr>
--    2. type `cw` (change word) -> type new word -> Esc
--    3. move to next word by typing `n`
--    4. if you want to change word, type `.` which will follow previous process, else type `n` to move to the next word
-- Trick 2 (:help %), (:help s)
--    search and replace all lines: `:%s/<search-word>/<replace-word>/g` 
--        %s=substitute, g=global
--        replace `~/` with `@/`:   1) `:%s/\~\/` search for ~/, we need escape both ~ and /
--                                  2) `:%s/\~\//@\//g` here additional code is `/@\//g` where `/` boundary between search and replace
--                                 `/@\/` defines replacement text as @/    `/@\//g` defines do this globally

--  ----------- -> store search results in quickfix list ----------------
--  Single File
--    :vimgrep /pattern/ %
--
--  Multiple File
--    search in telescope -> Ctrl+q -> will send search results to quickfix list

--  -------------- search and replace (multiple pages)
--  -> following things does not work with with special characters like ~ or /
--      just open zed with `zed .` in path -> Ctrl+Shift+f to search in all files -> replace-one (to verify changes) -> replace all -> exit
--  1. store search results in quickfix list
--  2. execute ->   :cfdo %s/<text-to-remove>/<text-to-add>/g | update | bd
--    reference -> cfdo == execute in each file in quickfix list, %s == substitute, 
--    update == save modified buffer (else we need to write all changes), bd == delete buffer (to free ram)
--    :help cfdo, :help %, :help s, :help update, :help bd 
--
