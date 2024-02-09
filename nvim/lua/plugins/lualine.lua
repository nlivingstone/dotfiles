local colours = {

    bg_dark = "#1f2335",
    bg = "#24283b",
    bg_highlight = "#292e42",
    terminal_black = "#414868",
    fg = "#c0caf5",
    fg_dark = "#a9b1d6",
    fg_gutter = "#3b4261",
    dark3 = "#545c7e",
    comment = "#565f89",
    dark5 = "#737aa2",
    blue0 = "#3d59a1",
    blue = "#7aa2f7",
    cyan = "#7dcfff",
    blue1 = "#2ac3de",
    blue2 = "#0db9d7",
    blue5 = "#89ddff",
    blue6 = "#b4f9f8",
    blue7 = "#394b70",
    magenta = "#bb9af7",
    magenta2 = "#ff007c",
    purple = "#9d7cd8",
    orange = "#ff9e64",
    yellow = "#e0af68",
    green = "#9ece6a",
    green1 = "#73daca",
    green2 = "#41a6b5",
    teal = "#1abc9c",
    red = "#f7768e",
    red1 = "#db4b4b",

}

local function spacer()
    return [[ ]]
end


return {
    -- Set lualine as statusline
    'nvim-lualine/lualine.nvim',
    -- See `:help lualine.txt`
    opts = {
        options = {
            theme = {
                normal = {
                    a = { fg = colours.bg_dark, bg = colours.blue },
                    b = { fg = colours.blue, bg = colours.bg },
                    c = { fg = colours.none, bg = colours.none },
                    x = { fg = colours.none, bg = colours.none },
                    y = { fg = colours.none, bg = colours.none },
                    z = { fg = colours.blue, bg = colours.bg_highlight },
                },

                insert = {
                    a = { fg = colours.bg_dark, bg = colours.red },
                    b = { fg = colours.red, bg = colours.bg },
                    c = { fg = colours.none, bg = colours.none },
                    x = { fg = colours.none, bg = colours.none },
                    y = { fg = colours.none, bg = colours.none },
                    z = { fg = colours.blue, bg = colours.bg_highlight },
                },
                visual = {
                    a = { fg = colours.bg_dark, bg = colours.orange },
                    b = { fg = colours.orange, bg = colours.bg },
                    c = { fg = colours.none, bg = colours.none },
                    x = { fg = colours.none, bg = colours.none },
                    y = { fg = colours.none, bg = colours.none },
                    z = { fg = colours.blue, bg = colours.bg_highlight },
                },
                replace = {
                    a = { fg = colours.bg_dark, bg = colours.red },
                    b = { fg = colours.white, bg = colours.bg },
                    c = { fg = colours.none, bg = colours.none },
                    x = { fg = colours.none, bg = colours.none },
                    y = { fg = colours.none, bg = colours.none },
                    z = { fg = colours.blue, bg = colours.bg_highlight },
                },
                command = {
                    a = { fg = colours.bg_dark, bg = colours.green },
                    b = { fg = colours.green, bg = colours.bg },
                    c = { fg = colours.none, bg = colours.none },
                    x = { fg = colours.none, bg = colours.none },
                    y = { fg = colours.none, bg = colours.none },
                    z = { fg = colours.blue, bg = colours.bg_highlight },
                },

                inactive = {
                    a = { fg = colours.white, bg = colours.none },
                    b = { fg = colours.white, bg = colours.none },
                    c = { fg = colours.black, bg = colours.none },
                },
            },
            component_separators = '',
            section_separators = { left = '', right = '' },
        },
        sections = {

            lualine_a = {
                { 'mode', separator = { left = '', right = '' } },
            },
            lualine_b = {
                {
                    'filename',
                    separator = { left = '', right = '' }
                },
                {
                    'branch'
                },
                {
                    'fileformat'
                }
            },
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = {
                {
                    'filetype',
                    colored = true,    -- Displays filetype icon in color if set to true
                    icon_only = false, -- Display only an icon for filetype
                    icon = { align = 'left' },
                    separator = { left = '', right = '' },
                    padding = { left = 0, right = 0 }
                }
            },
        },
        inactive_sections = {
            lualine_a = { 'filename' },
            lualine_b = {},
            lualine_c = {},
            lualine_x = {},
            lualine_y = {},
            lualine_z = { 'location' },
        },
        tabline = {},
        extensions = {},
    },
}
