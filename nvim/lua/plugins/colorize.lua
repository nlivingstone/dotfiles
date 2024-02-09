return {
  'NvChad/nvim-colorizer.lua',
  config = function()
    require('colorizer').setup({
      filetypes = {
        '*', -- Highlight all files, but customize some others.
      },
      user_default_options = { mode = "background", names = false, },
    })
  end

}
