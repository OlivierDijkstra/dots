local opt = vim.opt
local o = vim.o
local wo = vim.wo
local g = vim.g

require('core.maps')
require('core.autocmds')

-- [[ Editor Behavior ]]
-- Set number of spaces for a tab character
opt.tabstop = 2
-- Set number of spaces to use for each step of (auto)indent
opt.shiftwidth = 2
-- Convert tabs to spaces
opt.expandtab = true
-- Automatically indent new lines
opt.smartindent = true
-- Automatically indent new lines (legacy option)
opt.autoindent = true
-- Use smart tab behavior (insertion/deletion)
opt.smarttab = true
-- Shorten messages returned when running commands
opt.shortmess:append("FWx")

-- [[ Search and Case Sensitivity ]]
-- Do not highlight all matches for a search
o.hlsearch = false
-- Ignore case in search patterns
o.ignorecase = true
-- Override 'ignorecase' if search pattern contains upper case
o.smartcase = true

-- [[ User Interface ]]
-- Show line numbers
wo.number = true
-- Enable mouse support
o.mouse = 'a'
-- Use the system clipboard for copy/paste
o.clipboard = 'unnamedplus'
-- Always display the sign column
wo.signcolumn = 'yes'
-- Enable true color support
o.termguicolors = true
opt.termguicolors = true
-- Do not wrap lines
o.wrap = false
-- Highlight the current line
o.cursorline = true

-- [[ Performance and Timeout Settings ]]
-- Set the delay for displaying the swap file message
o.updatetime = 250
-- Use key timeout for mappings and key codes
o.timeout = true
-- Length of time to wait for a mapped sequence
o.timeoutlen = 300

-- [[ Completion ]]
-- Set completion menu behavior
o.completeopt = 'menuone,noselect'

-- [[ File Handling ]]
-- Make wrapped lines visually indented
o.breakindent = true
-- Enable persistent undo
o.undofile = true

-- [[ Miscellaneous ]]
-- Copilot specific setting to avoid key mapping issues
g.copilot_assume_mapped = true
