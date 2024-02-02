return {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
        require("telescope").load_extension('file_browser')
        vim.keymap.set('n', '<D-b>', ":Telescope file_browser<CR>", { noremap = true })
    end
}
