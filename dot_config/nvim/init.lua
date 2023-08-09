-- [[ General Settings ]]
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.completeopt = 'menuone,noselect'
vim.o.termguicolors = true

-- [[ Miscellaneous ]]
-- Copilot fix
vim.g.copilot_assume_mapped = true

-- [[ Leader Key Configuration ]]
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- [[ Package Manager Installation ]]
-- Install package manager
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

-- [[ Plugin Requires ]]
require('plugins')
require('maps')

-- [[ Nvim-Tree Settings ]]
-- Recommended nvim-tree settings
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1
-- Auto close nvim-tree when it's the last buffer
vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and require("nvim-tree.utils").is_nvim_tree_buf() then
      vim.cmd "quit"
    end
  end
})

-- [[ Custom Filetypes ]]
vim.cmd([[
augroup custom_filetypes
  autocmd!
  autocmd BufRead,BufNewFile *rc setfiletype julia
augroup END
]])

-- [[ Telescope Configuration ]]
-- Configuration in ./lua/telescope.lua
require('telescope-config')

-- [[ Treesitter Configuration ]]
-- Configuration in ./lua/treesitter.lua
require('treesitter-config')

-- [[ LSP Settings ]]
-- Configuration in ./lua/lsp/
require('lsp-config.lsp')

-- [[ Neovim Lua Configuration ]]
require('neodev').setup()

-- [[ nvim-cmp Configuration ]]
-- Configuration in ./lua/cmp.lua
require('cmp-config')
