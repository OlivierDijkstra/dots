-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Map q to quit
vim.keymap.set('n', 'q', '<cmd>q<CR>', { desc = 'Quit' })

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

-- [[ Spectre ]]
vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").open()<CR>', {
  desc = "Open [S]earch"
})
vim.keymap.set('n', '<leader>sc', '<cmd>lua require("spectre").open_file_search()<CR>', {
  desc = "[S]earch [C]urrent file"
})
vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
  desc = "[S]earch [W]ord"
})
vim.keymap.set('n', '<leader>swc', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
  desc = "[S]earch [W]ord in [C]urrent file"
})


-- [[ LazyGit ]]
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { desc = '[L]azy [G]it' })

-- [[ LPS ]]
vim.keymap.set('n', '<leader>p', '<cmd>lua vim.lsp.buf.format { async = true }<CR>',
  { desc = '[P]rettier, or use :Format' })

-- [[ Telescope ]]
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>fh', function()
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
  })
end, { desc = '[F]ind [H]ere' })

vim.keymap.set('n', '<leader>ff', require('telescope.builtin').find_files, { desc = '[F]ind [F]iles' })
vim.keymap.set('n', '<leader>fw', require('telescope.builtin').live_grep, { desc = '[F]ind [W]ord' })
vim.keymap.set('n', '<leader>fp', ':Telescope projects<CR>', { desc = '[F]ind [P]rojects' })

-- [[ NvimTree ]]
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>', { desc = '[T]oggle NvimTree or [T]ree' })

-- [[ Bufferline ]]
for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, ':BufferLineGoToBuffer ' .. i .. '<CR>', { desc = 'Switch to buffer ' .. i })
end

vim.keymap.set('n', '<leader>x', ':NvimTreeClose | bd<CR>', { desc = '[X]it current buffer and close Nvim-Tree' })
