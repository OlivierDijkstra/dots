-- plugins.lua
local function load_plugin_config(name)
  local status_ok, plugin_config = pcall(require, 'plugins/' .. name)
  if not status_ok then
    print("Error loading plugin config for " .. name)
    return {}
  end
  return plugin_config
end

require('lazy').setup({
  -- Theme
  load_plugin_config('catppuccin'),

  -- Logging
  load_plugin_config('notify'),

  -- LSP
  load_plugin_config('lspconfig'),
  load_plugin_config('mason'),
  load_plugin_config('nvim-cmp'),

  -- Core
  load_plugin_config('plenary'),
  load_plugin_config('treesitter'),

  -- UI
  load_plugin_config('lualine'),
  load_plugin_config('nvim-tree'),
  load_plugin_config('which_key'),
  load_plugin_config('telescope'),
  load_plugin_config('spectre'),
  load_plugin_config('alpha'),
  load_plugin_config('bufferline'),
  {
    "typicode/bg.nvim",
    lazy = false
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true
  },



  -- Utils
  {
    'github/copilot.vim',
    lazy = true,
    event = 'User FileOpened'
  },
  load_plugin_config('comment'),
  load_plugin_config('autopairs'),
  load_plugin_config('illuminate'),
  load_plugin_config('barbecue'),
  load_plugin_config('project'),
  load_plugin_config('guard'),
  {
    'tpope/vim-sleuth',
    lazy = true,
    event = 'User FileOpened'
  },
  {
    'windwp/nvim-ts-autotag',
  },
  {
    "kdheepak/lazygit.nvim",
    cmd = "LazyGit",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },
}, {
  ui = {
    size = { width = 0.6, height = 0.6 },
    border = 'rounded'
  },
  git = {
    timeout = 9000
  }
})
