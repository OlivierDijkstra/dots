local keymap = vim.keymap.set
local nvim_set_keymap = vim.api.nvim_set_keymap
local nvim_create_augroup = vim.api.nvim_create_augroup
local nvim_create_autocmd = vim.api.nvim_create_autocmd

-- [[ Leader Key Configuration ]]
vim.g.mapleader = ','
vim.g.maplocalleader = ','

-- [[ Basic Keymaps ]]
-- Keymaps for a better default experience
-- Disable space key
keymap({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Map 'q' to quit
keymap('n', 'q', '<cmd>q<CR>', { desc = 'Quit' })

-- Remaps for dealing with word wrap
-- Move up a line, taking into account wrapped lines
keymap('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
-- Move down a line, taking into account wrapped lines
keymap('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remap '=' to '+' for easier line navigation
keymap('n', '=', '+', { silent = true })

-- Enhanced line navigation
-- Skip 5 lines upward with Shift + '-' in normal and visual modes
keymap({ 'n', 'v' }, '_', '5-', { silent = true })
keymap({ 'n', 'v' }, '<S-Up>', '5-', { silent = true })
-- Skip 5 lines downward with Shift + '=' in normal and visual modes
keymap({ 'n', 'v' }, '+', '5+', { silent = true })
keymap({ 'n', 'v' }, '<S-Down>', '5+', { silent = true })

-- Custom mappings for 'd' and 'D' to avoid clipboard interference
for _, key in pairs({ 'd', 'D' }) do
  nvim_set_keymap('n', key, '"_' .. key, { noremap = true, silent = true })
  nvim_set_keymap('v', key, '"_' .. key, { noremap = true, silent = true })
end

-- Duplicate line mappings
-- Duplicate current line below with Shift + Alt + Down
nvim_set_keymap('n', '<S-A-Down>', ':t.<CR>', { noremap = true, silent = true })
nvim_set_keymap('v', '<S-A-Down>', ':t.<CR>gv', { noremap = true, silent = true })
-- Duplicate current line above with Shift + Alt + Up
nvim_set_keymap('n', '<S-A-Up>', ':t-<CR>', { noremap = true, silent = true })
nvim_set_keymap('v', '<S-A-Up>', ':t-<CR>gv', { noremap = true, silent = true })

-- Unmap [ ] { } and ( ) in visual mode to avoid conflicts
for _, key in pairs({ '[', ']', '{', '}', '(', ')' }) do
  nvim_set_keymap('v', key, '<Nop>', { noremap = true, silent = true })
end

-- Visual selection wrapping mappings
for _, char in pairs({ "'", '"', '`', '[', ']', '(', ')', '{', '}' }) do
  keymap('x', char, '<Esc>`>a' .. char .. '<Esc>`<i' .. char .. '<Esc>', { silent = true })
end

-- [[ Highlight on Yank ]]
-- Create a group for yank highlight autocmd
local highlight_group = nvim_create_augroup('YankHighlight', { clear = true })
-- Set up an autocmd for highlighting yanked text
nvim_create_autocmd('TextYankPost', {
  callback = function() vim.highlight.on_yank() end,
  group = highlight_group,
  pattern = '*',
})

keymap('n', '<leader>x', '<cmd>bd<CR>', { silent = true, desc = 'Close buffer' })

keymap('n', '<leader>p', '<cmd>GuardFmt<CR>', { silent = true, desc = 'Format buffer' })

keymap('n', '<leader>lg', '<cmd>LazyGit<CR>', { silent = true, desc = 'Open LazyGit' })
