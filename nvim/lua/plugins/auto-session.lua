-- ░█▀█░█░█░▀█▀░█▀█░░░░░█▀▀░█▀▀░█▀▀░█▀▀░▀█▀░█▀█░█▀█░░
-- ░█▀█░█░█░░█░░█░█░▄▄▄░▀▀█░█▀▀░▀▀█░▀▀█░░█░░█░█░█░█░░
-- ░▀░▀░▀▀▀░░▀░░▀▀▀░░░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░░

return {
  'rmagatti/auto-session',
  config = function()
    require("auto-session").setup {
      log_level = "error",
      auto_session_enable_last_session = vim.loop.cwd() == "/",
      auto_session_last_session_dir = '',
      auto_session_root_dir = vim.fn.stdpath('data') .. "/sessions/",
      auto_session_enabled = true,
      auto_restore_enabled = true,
      session_lens = {
        -- If load_on_setup is set to false, one needs to eventually call `require("auto-session").setup_session_lens()` if they want to use session-lens.
        buftypes_to_ignore = {}, -- list of buffer types what should not be deleted from current session
        load_on_setup = true,
        theme_conf = { border = true },
        previewer = false,
      },
    }
  end
}
