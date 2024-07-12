return {
  "ricardoramirezr/php-use-sort.nvim",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  ft = "php",
  opts = {
    order_by = "length",
    order = "asc",
    autocmd = true,
    rm_unused = true,
  },
  config = function(opts)
    require("php-use-sort").setup(opts)
    vim.keymap.set("n", "<leader>su", ":PhpUseSort<CR>", {
      desc = "Sort PHP use lines by length",
      silent = true,
    })
  end,
}
