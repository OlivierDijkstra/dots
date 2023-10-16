require('lazy').setup({
  -- Git plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Copilot
  'github/copilot.vim',

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
      { 'j-hui/fidget.nvim', opts = {}, tag = "legacy" },

      -- Additional lua configuration for vim files and functions
      'folke/neodev.nvim',
    },
  },

  -- Inject LSP
  'jose-elias-alvarez/null-ls.nvim',

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
        untracked = { text = '' },
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
      })
    end
  },

  {
    -- Statusline
    'nvim-lualine/lualine.nvim',
    dependencies = { 'projekt0n/github-nvim-theme' },
    opts = {
      theme = 'github_dark_default',
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
            sections = { 'error', 'warn', 'info', 'hint' },
            symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
            colored = true,
            -- always_visible = true,
          }
        },
        lualine_x = { 'filetype' },
        lualine_y = {},
        lualine_z = {}
      },
    },
  },

  {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    tag = 'v2.20.8',
    opts = {
      char = '┊',
      show_trailing_blankline_indent = false,
    },
  },

  -- "leader+/" to comment visual regions/lines
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup({
        toggler = {
          line = '<leader>/',
        },
        opleader = {
          line = '<leader>/',
        },
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      })
    end
  },

  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        -- This will not install any breaking changes.
        -- For major updates, this must be adjusted manually.
        version = "^1.0.0",
      },
    },
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
      require("nvim-tree").setup {
        -- Telescope projects integration
        sync_root_with_cwd = true,
        respect_buf_cwd = true,
        update_focused_file = {
          enable = true,
          update_root = true
        },
        --
        tab = {
          sync = {
            open = true,
            close = true,
          }
        }
      }
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
      -- Extending numToStr/Comment.nvim to work with jsx/tsx
      'JoosepAlviste/nvim-ts-context-commentstring',
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
        dashboard.button('1', '🌳 Open file tree (<Leader>t)', ':NvimTreeToggle<CR>'),
        dashboard.button('2', '📁 Find files (<Leader>ff)', ':Telescope find_files<CR>'),
        -- dashboard.button('3', '💬 Find current word (<Leader>fc)',
        -- [[<cmd>lua require('telescope.builtin').grep_string({search = vim.fn.expand('<cword>')})<CR>]]),
        dashboard.button('3', '💬 Find word (<Leader>fw)',
          ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>'),
        dashboard.button('4', '🚪 Quit (q)', ':quit<CR>'),
        dashboard.button('5', '📚 Open project (<Leader>fp)', ':Telescope projects<CR>'),
        dashboard.button('6', '🔄 Update plugins', ':Lazy update<CR>'),
      }
      local handle = io.popen('fortune')
      local fortune = handle:read('*a')
      handle:close()
      dashboard.section.footer.val = fortune
      alpha.setup(dashboard.opts)
    end
  },

  -- LazyGit caller
  'kdheepak/lazygit.nvim',

  -- Auto background color
  { "typicode/bg.nvim",     lazy = false },

  -- Terminal toggler
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    opts = {
      size = 50,
      open_mapping = [[<c-j>]],
      hide_numbers = true,
      direction = 'vertical',
      shade_terminals = true,
    }
  },

  -- Winbar for to show file and code location, click to go to top
  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
    },
  },
--
  {
    'nvim-pack/nvim-spectre',
    config = function()
      require('spectre').setup({
        live_update = true,
        mapping = {
          ['replace_current'] = {
            map = 'r',
            cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
            desc = "Replace current selection only"
          },
          ['run_replace'] = {
            map = "R",
            cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
            desc = "replace all"
          },
          ['toggle_ignore_case'] = {
            map = "i",
            cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
            desc = "toggle ignore case"
          },
        }
      })
    end,
    opts = {
    }
  }
}, {})
