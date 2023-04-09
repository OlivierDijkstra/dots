require('lazy').setup({
  -- Git plugins
  'github/copilot.vim',
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Icons
  'nvim-tree/nvim-web-devicons',

  -- Detect tabstop and shiftwidth automatically
  'tpope/vim-sleuth',

  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      { 'j-hui/fidget.nvim', opts = {} },

      -- Additional lua configuration for vim files and functions
      'folke/neodev.nvim',
    },
  },

  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip', 'onsails/lspkind-nvim' },
  },

  -- Show you pending keybinds.
  { 'folke/which-key.nvim', opts = {} },
  {
    -- Adds git releated signs to the gutter, as well as utilities for managing changes
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
    },
  },

  {
    -- Theme
    'projekt0n/github-nvim-theme',
    tag = 'v0.0.7',
    config = function()
      require('github-theme').setup({
        theme_style = 'dark_default',
        dark_sidebar = false,
      })
    end
  },

  {
    -- Statusline
    'nvim-lualine/lualine.nvim',
    opts = {
      options = {
        icons_enabled = true,
        component_separators = '',
        section_separators = '',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = { 'branch' },
        lualine_c = {
          {
            'diagnostics',
            sources = { 'nvim_lsp' },
            sections = { 'error', 'warn', 'info', 'hint' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            colored = true,
            -- always_visible = true,
          }
        },
        lualine_x = { 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' }
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- "leader+/" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    opts = {
      toggler = {
        line = '<leader>/',
      },
      opleader = {
        line = '<leader>/',
      }
    }
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('telescope').load_extension('projects')
    end
  },

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

  {
    -- Project manager
    "ahmedkhalf/project.nvim",
    config = function()
      require('project_nvim').setup {

      }
    end
  },

  -- File explorer
  {
    'nvim-tree/nvim-tree.lua',
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {}
    end,
  },

  -- Bufferline to show open buffers
  {
    'akinsho/bufferline.nvim',
    version = "v3.*",
    config = function()
      require("bufferline").setup {
        options = {
          diagnostics = "nvim_lsp",
        }
      }
    end,
  },

  {
    -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
    },
    config = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  },

  {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup {}
    end,
  },
  {
    'windwp/nvim-ts-autotag',
    config = function()
      require('nvim-ts-autotag').setup {}
    end,
  },

  {
    -- Start screen customizer
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'
      dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
      }
      dashboard.section.buttons.val = {
        dashboard.button('1', '  Open file tree (<Leader>t)', ':NvimTreeToggle<CR>'),
        dashboard.button('2', '  Find files (<Leader>ff)', ':Telescope find_files<CR>'),
        dashboard.button('3', '  Find current word (<Leader>fc)',
          [[<cmd>lua require('telescope.builtin').grep_string({search = vim.fn.expand('<cword>')})<CR>]]),
        dashboard.button('4', '  Find word (<Leader>f)', ':Telescope live_grep<CR>'),
        dashboard.button('5', '  Quit (q)', ':quit<CR>'),
        dashboard.button('6', '  Open project (<Leader>fp)', ':Telescope projects<CR>'),
        dashboard.button('7', '  Update plugins', ':Lazy update<CR>'),
      }
      local handle = io.popen('fortune')
      local fortune = handle:read('*a')
      handle:close()
      dashboard.section.footer.val = fortune
      alpha.setup(dashboard.opts)
    end
  },

  -- Lazygit caller
  'kdheepak/lazygit.nvim',
}, {})
