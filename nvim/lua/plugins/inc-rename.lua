return {
  "smjonas/inc-rename.nvim",
  config = function()
    require("inc_rename").setup({
      cmd_name = "Inc Rename",
      vim.keymap.set("n", "<leader>rn", function()
        return ":IncRename " .. vim.fn.expand("<cword>")
      end, { expr = true })
    })
  end,
}
