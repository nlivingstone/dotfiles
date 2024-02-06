return {
  "stevearc/conform.nvim",
  lazy = true,
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        vue = { "rustywind" },
        php = { "rustywind", "phpcsfixer", "blade-formatter" },
        css = { "prettierd" },
      },
      ft_parsers = {
            javascript = "babel",
            javascriptreact = "babel",
            typescript = "typescript",
            typescriptreact = "typescript",
            vue = "vue",
            css = "css",
            scss = "scss",
            less = "less",
            html = "html",
            json = "json",
            jsonc = "json",
            yaml = "yaml",
            markdown = "markdown",
            ["markdown.mdx"] = "mdx",
            graphql = "graphql",
            handlebars = "glimmer",
      },
      format_on_save = {
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      },
      notify_on_error = true,
      formatters = {
        phpcsfixer = {
          command = "/Users/neil/.local/share/nvim/mason/bin/php-cs-fixer",
          args = {
            "fix",
            "$FILENAME"
          },
          stdin = false,
        }
      }
    })
  end,
}
