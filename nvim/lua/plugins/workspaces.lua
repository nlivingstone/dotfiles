return {
  "natecraddock/workspaces.nvim",
  config = function()
    require("telescope").load_extension('workspaces')
    vim.keymap.set('n', '<leader>ws', ":Telescope workspaces<CR>", { noremap = true, desc = "List [W]ork[S]paces" })
    require("workspaces").setup({
      cd_type = "global",
      hooks = {
        open = "Telescope file_browser",
      }
    })
  end
}
