local function spacer()
    return [[ ]]
end


return {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
        options = {
            theme = 'tokyonight',
            icons_enabled = true,
            disabled_filetypes = {
                'toggleterm',
                'neo-tree',
            },
            component_separators = '',
            section_separators = { left = '', right = '' },
        },
        sections = {

            lualine_a = {
                { 'mode', separator = { left = '', right = '' }, padding = { left = 1, right = 1 } },
            },
            lualine_b = {
                {
                    'windows'
                },
                {
                    'branch'
                }
            },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {
                {
                    'filetype',
                    colored = true, -- Displays filetype icon in color if set to true
                    icons_enabled = false,
                    separator = { left = '', right = '' },
                    padding = { left = 1, right = 1 }
                }
            },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        extensions = {},
    },
}
