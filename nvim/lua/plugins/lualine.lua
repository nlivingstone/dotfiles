local colours = {
    
    cyan   = '#79dac8',
    black  = '#080808',
    white  = '#FFFFFF',
    red    = '#ff5189',
    violet = '#d183e8',
    grey   = '#303030',

    none = "NONE",
  bg_dark = "#1f2335",
  bg = "#24283b",
  bg_highlight = "#292e42",
  terminal_black = "#414868",

  blue = "#7aa2f7",
  cyan = "#7dcfff",
  magenta = "#bb9af7",

  purple = "#9d7cd8",
  orange = "#ff9e64",
  green = "#9ece6a",

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
              a = { fg = colours.black, bg = colours.blue },
              b = { fg = colours.white, bg = colours.bg_highlight },
              c = { fg = colours.none, bg = colours.none },
              x = { fg = colours.none, bg = colours.none },
              y = { fg = colours.none, bg = colours.none },
              z = { fg = colours.blue, bg = colours.bg_highlight },
          },

          insert = { a = { fg = colours.black, bg = colours.green } },
          visual = { a = { fg = colours.black, bg = colours.orange } },
          replace = { a = { fg = colours.black, bg = colours.red } },
          terminal = { a = { fg = colours.black, bg = colours.red } },

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
          { 'mode', separator = { left = '', right = '' }},
        },
        lualine_b = { 
            {
                'filename',
                separator = { left = '', right = '' }
            }, {
                'branch'
            },{ 
                'fileformat' 
            }
        },
        lualine_c = {}, 
        lualine_x = {},
        lualine_y = {},
        lualine_z = {
            {
                'filetype',
                colored = true,   -- Displays filetype icon in color if set to true
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