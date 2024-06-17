return {
    'tomiis4/BufferTabs.nvim',
    dependencies = {
        'nvim-tree/nvim-web-devicons', -- optional
    },
    lazy = false,
    config = function()
        require('buffertabs').setup({
            border = 'rounded',
            padding = 0,
            icons = true,
            display = 'row',
            horizontal = 'left',
            vertical = 'bottom',
            timeout = 2000,
        })
    end
}
