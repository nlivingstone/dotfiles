-- ░▀█▀░█▀█░█░█░█░█░█▀█░█▀█░▀█▀░█▀▀░█░█░▀█▀░░░░█▀█░█░█░▀█▀░█▄█░░
-- ░░█░░█░█░█▀▄░░█░░█░█░█░█░░█░░█░█░█▀█░░█░░░░░█░█░▀▄▀░░█░░█░█░░
-- ░░▀░░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀░▀░░▀░░▀░░▀░▀░░▀░░▀▀▀░▀░▀░░

return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function()
    -- Config
    vim.cmd.colorscheme 'tokyonight-night'
  end,
}
