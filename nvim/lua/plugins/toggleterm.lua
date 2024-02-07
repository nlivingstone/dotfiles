-- ░▀█▀░█▀█░█▀▀░█▀▀░█░░░█▀▀░▀█▀░█▀▀░█▀▄░█▄█░░░░█▀█░█░█░▀█▀░█▄█░░
-- ░░█░░█░█░█░█░█░█░█░░░█▀▀░░█░░█▀▀░█▀▄░█░█░░░░█░█░▀▄▀░░█░░█░█░░
-- ░░▀░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░░▀░░▀▀▀░▀░▀░▀░▀░▀░░▀░▀░░▀░░▀▀▀░▀░▀░░

return {
    'akinsho/toggleterm.nvim',
    version = "*",
    config = function()
        require('toggleterm').setup({
            open_mapping = '<leader>tt',
            insert_mappings = true,
            terminal_mappings = true,
            close_on_exit = true,
            auto_scroll = true,
            shade_terminals = false,
            shading_factor = false,
            direction = 'float',   -- 'vertical', 'horizontal', 'tab', 'float'
            float_opts = {
                border = 'curved', -- 'single', 'double', 'shadow', 'curved'
                winblend = 0,
                title_pos = 'center',
            },
        })
    end
}
