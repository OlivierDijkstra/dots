-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

-- [[ LPS ]]
vim.keymap.set('n', '<leader>p', '<cmd>Format<CR>', { desc = '[P]rettier, or use :Format' })

-- [[ Telescope ]]
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>fh', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[F]ind [H]ere' })

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fc', require('telescope.builtin').grep_string, { desc = '[F]ind [C]urrent' })
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').live_grep, { desc = '[F]ind [S]tring' })

-- [[ NvimTree ]]
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>', { desc = '[T]oggle NvimTree or [T]ree' })

-- [[ Bufferline ]]
for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, ':BufferLineGoToBuffer ' .. i .. '<CR>', { desc = 'Switch to buffer ' .. i })
end
vim.keymap.set('n', '<leader>x', ':bd<CR>', { desc = '[X]it current buffer' })