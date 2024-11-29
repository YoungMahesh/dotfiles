return {
  'rmagatti/auto-session',
  config = function()
    -- Error: Error detected while processing VimEnter Autocommands for "*":
    --    auto-session ERROR: Error restoring session, disabling auto save.
    --    Set silent_restore = false in the config for a more detailed error message.
    --    Error: E184: No such user-defined command: ShFoldIfDoFor
    -- solution: clear sessions using _`rm -rf ~/.local/share/nvim/sessions/*`
    require("auto-session").setup {
      log_level = "error",
      auto_session_suppress_dirs = { "~/", "~/Downloads", "/" },
    }
  end
}
