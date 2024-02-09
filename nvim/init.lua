-- ░░░░░░░░░░░░░░░░░░░░░░░░░░░
-- ░░█▀█░█▀▀░█▀█░█░█░▀█▀░█▄█░░
-- ░░█░█░█▀▀░█░█░▀▄▀░░█░░█░█░░
-- ░░▀░▀░▀▀▀░▀▀▀░░▀░░▀▀▀░▀░▀░░
-- ░░░░░░░░░░░░░░░░░░░░░░░░░░░


-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '


vim.o.guifont = "CartographCF Nerd Font:h13"


-- Install package manager
--    https://github.com/folke/lazy.nvim
--    `:help lazy.nvim.txt` for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system {
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable', -- latest stable release
    lazypath,
  }
end
vim.opt.rtp:prepend(lazypath)

-- ░█▀█░█░░░█░█░█▀▀░▀█▀░█▀█░█▀▀░
-- ░█▀▀░█░░░█░█░█░█░░█░░█░█░▀▀█░
-- ░▀░░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░
-- NOTE: You can configure plugins using the `config` key.
--
--  You can also configure plugins after the setup call,
--    as they will be available in your neovim runtime.
require('lazy').setup({
  -- NOTE: First, some plugins that don't require any configuration

  -- Git related plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  -- NOTE: This is where your plugins related to LSP can be installed.
  --  The configuration is done below. Search for lspconfig to find it below.
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      { 'j-hui/fidget.nvim',       tag = 'legacy', opts = {} },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },
  },
  -- ░█▀█░█░█░▀█▀░█▀█░█▀▀░█▀█░█▄█░█▀█░█░░░█▀▀░▀█▀░▀█▀░█▀█░█▀█░
  -- ░█▀█░█░█░░█░░█░█░█░░░█░█░█░█░█▀▀░█░░░█▀▀░░█░░░█░░█░█░█░█░
  -- ░▀░▀░▀▀▀░░▀░░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░░▀░░▀▀▀░▀▀▀░▀░▀░
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
  },

  -- Useful plugin to show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  {
    -- Adds git related signs to the gutter, as well as utilities for managing changes
    'lewis6991/gitsigns.nvim',
    opts = {
      -- See `:help gitsigns.txt`
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = '[G]o to [P]revious Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk, { buffer = bufnr, desc = '[G]o to [N]ext Hunk' })
        vim.keymap.set('n', '<leader>ph', require('gitsigns').preview_hunk, { buffer = bufnr, desc = '[P]review [H]unk' })
      end,
    },
  },

  -- ░▀█▀░█▀█░█▀▄░█▀▀░█▀█░▀█▀░░░░░█▀▄░█░░░█▀█░█▀█░█░█░█░░░▀█▀░█▀█░█▀▀░
  -- ░░█░░█░█░█░█░█▀▀░█░█░░█░░▄▄▄░█▀▄░█░░░█▀█░█░█░█▀▄░█░░░░█░░█░█░█▀▀░
  -- ░▀▀▀░▀░▀░▀▀░░▀▀▀░▀░▀░░▀░░░░░░▀▀░░▀▀▀░▀░▀░▀░▀░▀░▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░
  {
    -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    opts = {
      show_trailing_blankline_indent = false,
    },
    config = function()
      require("ibl").setup({
        indent = { highlight = highlight, char = "" },
        whitespace = {
          highlight = {
            "CursorColumn",
            "Whitespace",
          },
          remove_blankline_trail = false,
        },
        scope = { enabled = false },
      })
    end
  },

  -- ░█▀▀░█▀█░█▄█░█▄█░█▀▀░█▀█░▀█▀░░░░█▀█░█░█░▀█▀░█▄█░
  -- ░█░░░█░█░█░█░█░█░█▀▀░█░█░░█░░░░░█░█░▀▄▀░░█░░█░█░
  -- ░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀░▀░▀░░▀░░▀░░▀░▀░░▀░░▀▀▀░▀░▀░
  {
    'numToStr/Comment.nvim',
    opts = {
      toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        ---Block-comment toggle keymap
        block = 'gbc',
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
      },
    },
  },

  -- ░█▀▀░▀█▀░█▀█░█▀▄░█▀▀░█▀▄░
  -- ░█▀▀░░█░░█░█░█░█░█▀▀░█▀▄░
  -- ░▀░░░▀▀▀░▀░▀░▀▀░░▀▀▀░▀░▀░
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      -- Fuzzy Finder Algorithm which requires local dependencies to be built.
      -- Only load if `make` is available. Make sure you have the system
      -- requirements installed.
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- NOTE: If you are having trouble with this installation,
        --       refer to the README for telescope-fzf-native for more instructions.
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
    },
  },
  -- ░▀█▀░█▀▄░█▀▀░█▀▀░█▀▀░▀█▀░▀█▀░▀█▀░█▀▀░█▀▄░
  -- ░░█░░█▀▄░█▀▀░█▀▀░▀▀█░░█░░░█░░░█░░█▀▀░█▀▄░
  -- ░░▀░░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░░▀░░░▀░░▀▀▀░▀░▀░
  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    build = ':TSUpdate',
  },

  -- NOTE: Next Step on Your Neovim Journey: Add/Configure additional "plugins" for kickstart
  --       These are some example plugins that I've included in the kickstart repository.
  --       Uncomment any of the lines below to enable them.
  -- require 'kickstart.plugins.autoformat',
  -- require 'kickstart.plugins.debug',

  -- NOTE: The import below can automatically add your own plugins, configuration, etc from `lua/custom/plugins/*.lua`
  --    You can use this folder to prevent any conflicts with this init.lua if you're interested in keeping
  --    up-to-date with whatever is in the kickstart repo.
  --    Uncomment the following line and add your plugins to `lua/custom/plugins/*.lua` to get going.
  --
  --    For additional information see: https://github.com/folke/lazy.nvim#-structuring-your-plugins
  { import = 'plugins' },
}, {})

-- ░█▀▀░█▀▀░▀█▀░▀█▀░▀█▀░█▀█░█▀▀░░░█▀█░█▀█░▀█▀░▀█▀░█▀█░█▀█░█▀▀░
-- ░▀▀█░█▀▀░░█░░░█░░░█░░█░█░█░█░░░█░█░█▀▀░░█░░░█░░█░█░█░█░▀▀█░
-- ░▀▀▀░▀▀▀░░▀░░░▀░░▀▀▀░▀░▀░▀▀▀░░░▀▀▀░▀░░░░▀░░▀▀▀░▀▀▀░▀░▀░▀▀▀░
-- [[ Setting options ]]
-- See `:help vim.o`
-- NOTE: You can change these options as you wish!

-- Set highlight on search
vim.o.hlsearch = false

-- Make line numbers default
vim.wo.number = true

-- Set line number width
vim.o.numberwidth = 1

-- Set line height
vim.o.linespace = 0

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
-- Remove this option if you want your OS clipboard to remain independent.
-- See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- ░█▀▄░█▀█░█▀▀░▀█▀░█▀▀░░░█░█░█▀▀░█░█░█▄█░█▀█░█▀█░█▀▀░
-- ░█▀▄░█▀█░▀▀█░░█░░█░░░░░█▀▄░█▀▀░░█░░█░█░█▀█░█▀▀░▀▀█░
-- ░▀▀░░▀░▀░▀▀▀░▀▀▀░▀▀▀░░░▀░▀░▀▀▀░░▀░░▀░▀░▀░▀░▀░░░▀▀▀░
-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- ░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀░░░▀█▀░█▀▀░█░░░█▀▀░█▀▀░█▀▀░█▀█░█▀█░█▀▀░
-- ░█░░░█░█░█░█░█▀▀░░█░░█░█░░░░█░░█▀▀░█░░░█▀▀░▀▀█░█░░░█░█░█▀▀░█▀▀░
-- ░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░░░░▀░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░░░▀▀▀░
-- See `:help telescope` and `:help telescope.setup()`
require('telescope').setup {
  defaults = {
    winblend = 50,
    mappings = {
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      },
    },
  },
  pickers = {
    find_files = {
      -- `hidden = true` will still show the inside of `.git/` as it's not `.gitignore`d.
      theme = "dropdown",
      find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
    },
  },
  extensions = {
    file_browser = {
      hijack_netrw = true,
      hidden = true
    },
    workspaces = {
      -- keep insert mode after selection in the picker, default is false
      keep_insert = false,
    }
  }
}
-- ░▀█▀░█▀▀░█░░░█▀▀░█▀▀░█▀▀░█▀█░█▀█░█▀▀░
-- ░░█░░█▀▀░█░░░█▀▀░▀▀█░█░░░█░█░█▀▀░█▀▀░
-- ░░▀░░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀░░░▀▀▀░
-- ░█▀▀░█░█░▀█▀░█▀▀░█▀█░█▀▀░▀█▀░█▀█░█▀█░█▀▀░
-- ░█▀▀░▄▀▄░░█░░█▀▀░█░█░▀▀█░░█░░█░█░█░█░▀▀█░
-- ░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀░▀░▀▀▀░
-- Enable auto-session, if installed
pcall(require('telescope').load_extension, "session-lens")
-- Enable telescope-file-browser, if installed
pcall(require('telescope').load_extension, 'file_browser')
-- Enable telescope-workspaces, if installed
pcall(require('telescope').load_extension, 'workspaces')
-- Enable telescope fzf native, if installed
pcall(require('telescope').load_extension, 'fzf')

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<D-f>', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    previewer = false,
  })
end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<D-p>', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
vim.keymap.set("n", "<leader>ss", require("auto-session.session-lens").search_session, { noremap = true, })

-- ░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀░░░▀█▀░█▀▄░█▀▀░█▀▀░█▀▀░▀█▀░▀█▀░▀█▀░█▀▀░█▀▄░
-- ░█░░░█░█░█░█░█▀▀░░█░░█░█░░░░█░░█▀▄░█▀▀░█▀▀░▀▀█░░█░░░█░░░█░░█▀▀░█▀▄░
-- ░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░░░░▀░░▀░▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░░▀░░░▀░░▀▀▀░▀░▀░
-- [[ Configure Treesitter ]]
-- See `:help nvim-treesitter`
require('nvim-treesitter.configs').setup {
  -- Add languages to be installed here that you want installed for treesitter
  ensure_installed = { 'markdown', 'php', 'go', 'lua', 'rust', 'javascript', 'vimdoc', 'vim', 'html', 'vue', 'css' },

  -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
  auto_install = true,
  sync_install = true,
  ignore_install = {},
  modules = {},
  highlight = { enable = true },
  indent = { enable = true },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = '<c-space>',
      node_incremental = '<c-space>',
      scope_incremental = '<c-s>',
      node_decremental = '<M-space>',
    },
  },
  textobjects = {
    select = {
      enable = true,
      lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ['aa'] = '@parameter.outer',
        ['ia'] = '@parameter.inner',
        ['af'] = '@function.outer',
        ['if'] = '@function.inner',
        ['ac'] = '@class.outer',
        ['ic'] = '@class.inner',
      },
    },
    move = {
      enable = true,
      set_jumps = true, -- whether to set jumps in the jumplist
      goto_next_start = {
        [']m'] = '@function.outer',
        [']]'] = '@class.outer',
      },
      goto_next_end = {
        [']M'] = '@function.outer',
        [']['] = '@class.outer',
      },
      goto_previous_start = {
        ['[m'] = '@function.outer',
        ['[['] = '@class.outer',
      },
      goto_previous_end = {
        ['[M'] = '@function.outer',
        ['[]'] = '@class.outer',
      },
    },
    swap = {
      enable = true,
      swap_next = {
        ['<leader>a'] = '@parameter.inner',
      },
      swap_previous = {
        ['<leader>A'] = '@parameter.inner',
      },
    },
  },
}

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- ░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀░░░█░░░█▀▀░█▀█░
-- ░█░░░█░█░█░█░█▀▀░░█░░█░█░░░█░░░▀▀█░█▀▀░
-- ░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░░░▀▀▀░▀▀▀░▀░░░
-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
  -- NOTE: Remember that lua is a real programming language, and as such it is possible
  -- to define small helper and utility functions so you don't have to repeat yourself
  -- many times.
  --
  -- In this case, we create a function that lets us more easily define mappings specific
  -- for LSP related items. It sets the mode, buffer and description for us each time.
  local nmap = function(keys, func, desc)
    if desc then
      desc = 'LSP: ' .. desc
    end

    vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
  end

  nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
  nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

  nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
  nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
  nmap('gI', vim.lsp.buf.implementation, '[G]oto [I]mplementation')
  nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
  nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
  -- nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

  -- See `:help K` for why this keymap
  nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
  nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')

  -- Lesser used LSP functionality
  nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
  nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
  nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
  nmap('<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, '[W]orkspace [L]ist Folders')

  -- Create a command `:Format` local to the LSP buffer
  vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
    vim.lsp.buf.format()
  end, { desc = 'Format current buffer with LSP' })
end

-- Enable the following language servers
--  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
--
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
  phpactor = {
    filetypes = { 'php' }
  },
  volar = {
    filetypes = { 'javascript', 'vue', 'json' },
  },
  tailwindcss = {
    filetypes = { "aspnetcorerazor", "astro", "astro-markdown", "blade", "clojure", "django-html", "htmldjango", "edge", "eelixir", "elixir", "ejs", "erb", "eruby", "gohtml", "gohtmltmpl", "haml", "handlebars", "hbs", "html", "html-eex", "heex", "jade", "leaf", "liquid", "markdown", "mdx", "mustache", "njk", "nunjucks", "php", "razor", "slim", "twig", "css", "less", "postcss", "sass", "scss", "stylus", "sugarss", "javascript", "javascriptreact", "reason", "rescript", "typescript", "typescriptreact", "vue", "svelte" }
  },
  emmet_ls = {
    filetypes = { 'php', 'html', 'vue' }
  },
  -- pyright = {},
  -- rust_analyzer = {},
  -- tsserver = {},
  -- html = { filetypes = { 'html', 'twig', 'hbs'} },

  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
      filetypes = (servers[server_name] or {}).filetypes,
    }
  end
}

-- ░█▀█░█░█░▀█▀░█▄█░░░░░█▀▀░█▄█░█▀█░
-- ░█░█░▀▄▀░░█░░█░█░▄▄▄░█░░░█░█░█▀▀░
-- ░▀░▀░░▀░░▀▀▀░▀░▀░░░░░▀▀▀░▀░▀░▀░░░
-- [[ Configure nvim-cmp ]]
-- See `:help cmp`
local cmp = require 'cmp'
local luasnip = require 'luasnip'
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup {}

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete {},
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_locally_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.locally_jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  },
  sources = {
    { name = 'nvim_lsp' },
    { name = 'luasnip' },
  },
}


-- ░█▀█░█▀▀░█▀█░█░█░▀█▀░█▀▄░█▀▀░░░█▀▀░█▀█░█▀█░█▀▀░▀█▀░█▀▀░
-- ░█░█░█▀▀░█░█░▀▄▀░░█░░█░█░█▀▀░░░█░░░█░█░█░█░█▀▀░░█░░█░█░
-- ░▀░▀░▀▀▀░▀▀▀░░▀░░▀▀▀░▀▀░░▀▀▀░░░▀▀▀░▀▀▀░▀░▀░▀░░░▀▀▀░▀▀▀░

if vim.g.neovide then
  -- ░█▄█░█▀█░█▀▀░█▀█░█▀▀░░░█▀█░█▀█░█░░░█░█░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
  -- ░█░█░█▀█░█░░░█░█░▀▀█░░░█░█░█░█░█░░░░█░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
  -- ░▀░▀░▀░▀░▀▀▀░▀▀▀░▀▀▀░░░▀▀▀░▀░▀░▀▀▀░░▀░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
  -- ░█▀▄░█░░░█░█░█▀▄░░░▀█▀░█▀▄░█▀█░█▀█░█▀▀░█▀█░█▀█░█▀▄░█▀█░█▀█░█▀▀░█░█░
  -- ░█▀▄░█░░░█░█░█▀▄░░░░█░░█▀▄░█▀█░█░█░▀▀█░█▀▀░█▀█░█▀▄░█▀█░█░█░█░░░░█░░
  -- ░▀▀░░▀▀▀░▀▀▀░▀░▀░░░░▀░░▀░▀░▀░▀░▀░▀░▀▀▀░▀░░░▀░▀░▀░▀░▀░▀░▀░▀░▀▀▀░░▀░░
  vim.g.neovide_transparency = 0.90
  vim.g.neovide_window_blurred = true

  -- ░█▀▀░█░░░█▀█░█▀█░▀█▀░▀█▀░█▀█░█▀▀░░░█▀▄░█░░░█░█░█▀▄░
  -- ░█▀▀░█░░░█░█░█▀█░░█░░░█░░█░█░█░█░░░█▀▄░█░░░█░█░█▀▄░
  -- ░▀░░░▀▀▀░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀░▀▀▀░░░▀▀░░▀▀▀░▀▀▀░▀░▀░
  vim.g.neovide_floating_blur_amount_x = 10.0
  vim.g.neovide_floating_blur_amount_y = 10.0

  -- ░█▀▀░█░░░█▀█░█▀█░▀█▀░▀█▀░█▀█░█▀▀░░░█▀▀░█░█░█▀█░█▀▄░█▀█░█░█░
  -- ░█▀▀░█░░░█░█░█▀█░░█░░░█░░█░█░█░█░░░▀▀█░█▀█░█▀█░█░█░█░█░█▄█░
  -- ░▀░░░▀▀▀░▀▀▀░▀░▀░░▀░░▀▀▀░▀░▀░▀▀▀░░░▀▀▀░▀░▀░▀░▀░▀▀░░▀▀▀░▀░▀░
  vim.g.neovide_floating_shadow = false
  vim.g.neovide_floating_z_height = 10
  vim.g.neovide_light_angle_degrees = 45
  vim.g.neovide_light_radius = 20

  -- ░█▀█░█▀█░█▀▄░█▀▄░▀█▀░█▀█░█▀▀░
  -- ░█▀▀░█▀█░█░█░█░█░░█░░█░█░█░█░
  -- ░▀░░░▀░▀░▀▀░░▀▀░░▀▀▀░▀░▀░▀▀▀░
  vim.g.neovide_padding_top = 5
  vim.g.neovide_padding_bottom = 5
  vim.g.neovide_padding_right = 5
  vim.g.neovide_padding_left = 5

  -- ░█▀▀░█░█░█▀▄░█▀▀░█▀█░█▀▄░░░█▀█░█▀█░▀█▀░█▄█░█▀█░▀█▀░▀█▀░█▀█░█▀█░
  -- ░█░░░█░█░█▀▄░▀▀█░█░█░█▀▄░░░█▀█░█░█░░█░░█░█░█▀█░░█░░░█░░█░█░█░█░
  -- ░▀▀▀░▀▀▀░▀░▀░▀▀▀░▀▀▀░▀░▀░░░▀░▀░▀░▀░▀▀▀░▀░▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀░▀░
  vim.g.neovide_cursor_vfx_mode = "railgun"
  vim.g.neovide_cursor_vfx_opacity = 300.0
  vim.g.neovide_cursor_vfx_particle_density = 10.0
  vim.g.neovide_cursor_vfx_particle_speed = 20.0
  vim.g.neovide_cursor_vfx_particle_lifetime = 2.0
  vim.g.neovide_cursor_vfx_particle_phase = 100.0 -- Railgun specific
  vim.g.neovide_cursor_vfx_particle_curl = 0.0    -- Railgun specific
  vim.g.neovide_cursor_animation_length = 0.05
  vim.g.neovide_cursor_animate_in_insert_mode = true
  vim.g.neovide_cursor_animate_command_line = true

  -- ░█▀█░█▀▀░█▀█░█░█░▀█▀░█▀▄░█▀▀░░░█░█░█▀▀░█░█░█▀▄░▀█▀░█▀█░█▀▄░▀█▀░█▀█░█▀▀░█▀▀
  -- ░█░█░█▀▀░█░█░▀▄▀░░█░░█░█░█▀▀░░░█▀▄░█▀▀░░█░░█▀▄░░█░░█░█░█░█░░█░░█░█░█░█░▀▀█
  -- ░▀░▀░▀▀▀░▀▀▀░░▀░░▀▀▀░▀▀░░▀▀▀░░░▀░▀░▀▀▀░░▀░░▀▀░░▀▀▀░▀░▀░▀▀░░▀▀▀░▀░▀░▀▀▀░▀▀▀
  vim.keymap.set("n", "<D-w>", ":bd<CR>")         -- CMD + W: Quit current tab normal mode
  vim.keymap.set("i", "<D-w>", "<ESC>:bd<CR>")    -- CMD + W: Quit current tab insert mode
  vim.keymap.set({ "n", "v" }, '<D-s>', ':w<CR>') -- CMD + S: Save normal + visual mode
  vim.keymap.set('i', '<D-s>', '<C-o>:w<CR>')     -- CMD + S: Save insert mode
  vim.keymap.set('v', '<D-c>', '"+y')             -- CMD + C: Copy in visual mode
  vim.keymap.set('v', '<D-x>', 'x')               -- CMD + X: Cut in visual mode
  vim.keymap.set("n", '<D-x>', 'dd')              -- CMD + X: Cut in normal mode
  vim.keymap.set("i", '<D-x>', '<C-o>dd')         -- CMD + X: Cut insert mode
  vim.keymap.set({ "n", "v" }, '<D-v>', '"+P')    -- CMD + V: Paste normal + visual mode
  vim.keymap.set('!', '<D-v>', '<C-r><C-r>+')     -- CMD + V: Paste command mode
  vim.keymap.set('i', '<D-v>', '<C-o>"+P')        -- CMD + V: Paste insert mode

  -- ░█▀▀░█▀▀░█░░░█▀▀░█▀▀░▀█▀░▀█▀░█▀█░█▀█░
  -- ░▀▀█░█▀▀░█░░░█▀▀░█░░░░█░░░█░░█░█░█░█░
  -- ░▀▀▀░▀▀▀░▀▀▀░▀▀▀░▀▀▀░░▀░░▀▀▀░▀▀▀░▀░▀░
  vim.keymap.set({ 'i', 'n' }, '<S-Left>', 'v<Left>')   -- Shift+Left Select in the corresponding direction.
  vim.keymap.set({ 'i', 'n' }, '<S-Right>', 'v<Right>') -- Shift+Right Select in the corresponding direction.
  vim.keymap.set({ 'i', 'n' }, '<S-Up>', 'v<Up>')       -- Shift+Up Select in the corresponding direction.
  vim.keymap.set({ 'i', 'n' }, '<S-Down>', 'v<Down>')   -- Shift+Down Select in the corresponding direction.
  vim.keymap.set('v', '<S-Left>', '<Left>')             -- Shift+Left Select in the corresponding direction.
  vim.keymap.set('v', '<S-Right>', '<Right>')           -- Shift+Right Select in the corresponding direction.
  vim.keymap.set('v', '<S-Up>', '<Up>')                 -- Shift+Up Select in the corresponding direction.
  vim.keymap.set('v', '<S-Down>', '<Down>')             -- Shift+Down Select in the corresponding direction.
end

-- Allow clipboard copy paste in neovim
-- vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true })
-- vim.api.nvim_set_keymap('!', '<D-v>', '<C-R><C-O>+', { noremap = true, silent = true })

-- ░█▀█░█▀█░█░█░▀█▀░█▀▀░█▀█░▀█▀░█▀▀░░░█▀▄░█░█░█▀▀░█▀▀░█▀▀░█▀▄░█▀▀░
-- ░█░█░█▀█░▀▄▀░░█░░█░█░█▀█░░█░░█▀▀░░░█▀▄░█░█░█▀▀░█▀▀░█▀▀░█▀▄░▀▀█░
-- ░▀░▀░▀░▀░░▀░░▀▀▀░▀▀▀░▀░▀░░▀░░▀▀▀░░░▀▀░░▀▀▀░▀░░░▀░░░▀▀▀░▀░▀░▀▀▀░
vim.keymap.set('n', '<D-Right>', ':bnext<CR>') -- CMD + Right: Go to next buffer
vim.keymap.set('n', '<D-Left>', ':bprev<CR>')  -- CMD + Left: Go to previous buffer

-- ░█▀▀░█░░░▀█▀░█▀█░█▀▄░█▀█░█▀█░█▀▄░█▀▄░
-- ░█░░░█░░░░█░░█▀▀░█▀▄░█░█░█▀█░█▀▄░█░█░
-- ░▀▀▀░▀▀▀░▀▀▀░▀░░░▀▀░░▀▀▀░▀░▀░▀░▀░▀▀░░
-- Prevent copy, cut and delete motions from overwriting system clipboard
vim.keymap.set({ 'v', 'n' }, 'c', '"_c', { noremap = true, silent = true })
vim.keymap.set({ 'v', 'n' }, 'd', '"_d', { noremap = true, silent = true })

-- ░▀█▀░█▀█░█▀▄░█▀▀░█▀█░▀█▀░█▀█░▀█▀░▀█▀░█▀█░█▀█░
-- ░░█░░█░█░█░█░█▀▀░█░█░░█░░█▀█░░█░░░█░░█░█░█░█░
-- ░▀▀▀░▀░▀░▀▀░░▀▀▀░▀░▀░░▀░░▀░▀░░▀░░▀▀▀░▀▀▀░▀░▀░
vim.keymap.set("i", '<D-]>', '<ESC>>>i', { noremap = true, silent = true, desc = "Indent Right" }) -- Indent Right insert mode
vim.keymap.set("i", '<D-[>', '<ESC><<i', { noremap = true, silent = true, desc = "Indent Left" })  -- Indent Left insert mode
vim.keymap.set("n", '<D-]>', '>>', { noremap = true, silent = true, desc = "Indent Right" })       -- Indent Right normal mode
vim.keymap.set("n", '<D-[>', '<<', { noremap = true, silent = true, desc = "Indent Left" })        -- Indent Right normal mode
vim.keymap.set("v", '<D-]>', '>gv', { noremap = true, silent = true, desc = "Indent Right" })      -- Indent Right visual mode
vim.keymap.set("v", '<D-[>', '<gv', { noremap = true, silent = true, desc = "Outdent Left" })      -- Indent Left visual mode


-- Open current dir in finder
-- Source: https://dx13.co.uk/articles/2023/04/08/neovim-reveal-in-finder/
vim.api.nvim_create_user_command('Finder',
  function()
    local path = vim.api.nvim_buf_get_name(0)
    os.execute('open -R ' .. path)
  end,
  {}
)


-- Helper function to get operating system
-- Source: https://gist.github.com/Zbizu/43df621b3cd0dc460a76f7fe5aa87f30
vim.api.nvim_create_user_command('GetOS',
  function()
    function GetOS()
      local osname
      -- ask LuaJIT first
      if jit then
        return jit.os
      end

      -- Unix, Linux variants
      local fh, err = assert(io.popen("uname -o 2>/dev/null", "r"))
      if fh then
        osname = fh:read()
      end

      return osname or "Windows"
    end

    -- return GetOS()
    vim.print(GetOS());
  end,
  {}
)


-- The line beneath this is called `modeline`. See `:help modeline`
-- vim: ts=2 sts=2 sw=2 et
