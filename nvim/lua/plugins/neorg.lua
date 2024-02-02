return {
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.defaults"] = {}, -- Loads default behaviour
          ["core.concealer"] = {
            config = {
              icons = {
                todo = {
                  urgent = {
                    icon = ""
                  },
                  pending = {
                    icon = ""
                  }
                }

              }
            }
          },                  -- Adds pretty icons to your documents
          ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
              workspaces = {
                notes = "~/Notes",
              },
              default_workspace = "notes"
            },
          },
        },
      }
    end,
  },
}
