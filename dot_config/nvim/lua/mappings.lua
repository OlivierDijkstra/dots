require "nvchad.mappings"

local map = vim.keymap.set

map("n", ";", ":", {
    desc = "CMD enter command mode"
})
map("i", "jk", "<ESC>")

-- [[ Basic Keymaps ]]
map({'n', 'v'}, '<Space>', '<Nop>', {
    silent = true
})

-- Map q to quit
map('n', 'q', '<cmd>q<CR>', {
    desc = 'Quit'
})

-- Remap = to + so I don't have to press shift to go to the next line
map('n', '=', '+', {
    silent = true
})

-- Shift + - to go to the previous line but skip 5
map({'n', 'v'}, '_', '5-', {
    silent = true
})
-- Shift + = to go to the next line but skip 5
map({'n', 'v'}, '+', '5+', {
    silent = true
})

-- Shift + Up to go to the previous line but skip 5
map({'n', 'v'}, '<S-Up>', '5-', {
    silent = true
})
-- Shift + Down to go to the next line but skip 5
map({'n', 'v'}, '<S-Down>', '5+', {
    silent = true
})

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', {
    clear = true
})
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*'
})

-- [[ Telescope ]]
map('n', '<leader>?', require('telescope.builtin').oldfiles, {
    desc = '[?] Find recently opened files'
})
map('n', '<leader>fh', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false
    })
end, {
    desc = '[F]ind [H]ere'
})

map('n', '<leader>ff', require('telescope.builtin').find_files, {
    desc = '[F]ind [F]iles'
})
map('n', '<leader>fw', function()
    require('telescope').extensions.live_grep_args.live_grep_args()
end, {
    desc = '[F]ind [W]ord'
})
map('n', '<leader>fs', require('telescope.builtin').lsp_document_symbols, {
    desc = '[F]ind [S]ymbols'
})

-- [[ NvimTree ]]
map('n', '<leader>t', ':NvimTreeToggle<CR>', {
    desc = '[T]oggle NvimTree or [T]ree'
})

-- -- [[ Bufferline ]]
-- for i = 1, 9 do
--   map('n', '<leader>' .. i, ':BufferLineGoToBuffer ' .. i .. '<CR>', { desc = 'Switch to buffer ' .. i })
-- end

-- map('n', '<leader>x', ':NvimTreeClose | bd<CR>', { desc = '[X]it current buffer and close Nvim-Tree' })
