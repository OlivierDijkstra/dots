require "core"

-- [[ Package Manager Installation ]]
-- Install package manager
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn
      .system { 'git', 'clone', '--filter=blob:none', 'https://github.com/folke/lazy.nvim.git', '--branch=stable', -- latest stable release
        lazypath }
end
vim.opt.rtp:prepend(lazypath)

-- [[ Plugin Requires ]]
require('plugins')

require('plugins.maps.telescope')
require('plugins.maps.bufferline')
require('plugins.maps.nvim-tree')
require('plugins.maps.spectre')

vim.cmd.colorscheme('vesper')