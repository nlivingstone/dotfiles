return {
  "smjonas/inc-rename.nvim",
  config = function()
    require("inc_rename").setup({
      cmd_name = "Inc Rename",
      vim.keymap.set("n", "<leader>rn", ":IncRename ")
    })
  end,
}
