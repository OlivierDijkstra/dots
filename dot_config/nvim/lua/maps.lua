-- [[ Basic Keymaps ]]
-- Keymaps for better default experience
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Map q to quit
vim.keymap.set('n', 'q', '<cmd>q<CR>', { desc = 'Quit' })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Remap = to + so I don't have to press shift to go to the next line
vim.keymap.set('n', '=', '+', { silent = true })

-- Shift + - to go to the previous line but skip 5
vim.keymap.set({ 'n', 'v' }, '_', '5-', { silent = true })
-- Shift + = to go to the next line but skip 5
vim.keymap.set({ 'n', 'v' }, '+', '5+', { silent = true })

-- Shift + Up to go to the previous line but skip 5
vim.keymap.set({ 'n', 'v' }, '<S-Up>', '5-', { silent = true })
-- Shift + Down to go to the next line but skip 5
vim.keymap.set({ 'n', 'v' }, '<S-Down>', '5+', { silent = true })

-- Custom mappings for 'd' and 'D' to avoid affecting clipboard
vim.api.nvim_set_keymap('n', 'd', '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'D', '"_D', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'd', '"_d', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'D', '"_D', { noremap = true, silent = true })

-- Duplicate current line below with Shift + Alt + Down
vim.api.nvim_set_keymap('n', '<S-A-Down>', ':t.<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-A-Down>', ':t.<CR>gv', { noremap = true, silent = true })

-- Duplicate current line above with Shift + Alt + Up
vim.api.nvim_set_keymap('n', '<S-A-Up>', ':t-<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<S-A-Up>', ':t-<CR>gv', { noremap = true, silent = true })

-- First unmap [ ] { } and ( ) from visual mode so they don't get overwritten
vim.api.nvim_set_keymap('v', '[', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', ']', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '{', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '}', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '(', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', ')', '<Nop>', { noremap = true, silent = true })

-- Wrap visual selection with single quotes
vim.keymap.set('x', "'", '<Esc>`>a\'<Esc>`<i\'<Esc>', { silent = true })

-- Wrap visual selection with double quotes
vim.keymap.set('x', '"', '<Esc>`>a"<Esc>`<i"<Esc>', { silent = true })

-- Wrap visual selection in backticks
vim.keymap.set('x', '`', '<Esc>`>a`<Esc>`<i`<Esc>', { silent = true })

-- Wrap visual selection in brackets
vim.keymap.set('x', '[', '<Esc>`>a]<Esc>`<i[<Esc>', { silent = true })
vim.keymap.set('x', ']', '<Esc>`>a]<Esc>`<i[<Esc>', { silent = true })

-- Wrap visual selection in parentheses
vim.keymap.set('x', '(', '<Esc>`>a)<Esc>`<i(<Esc>', { silent = true })
vim.keymap.set('x', ')', '<Esc>`>a)<Esc>`<i(<Esc>', { silent = true })

-- Wrap visual selection in braces
vim.keymap.set('x', '{', '<Esc>`>a}<Esc>`<i{<Esc>', { silent = true })
vim.keymap.set('x', '}', '<Esc>`>a}<Esc>`<i{<Esc>', { silent = true })

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
local search_file_command =
':<C-u>NvimTreeClose<CR>:lua require("spectre").open({ search_text = vim.fn.expand("<cword>"), cwd = vim.fn.expand("%:p:h"), is_close = true })<CR>'
local search_all_command =
':<C-u>NvimTreeClose<CR>:lua require("spectre").open({ search_text = vim.fn.expand("<cword>"), cwd = "", is_close = true })<CR>'

vim.keymap.set('v', 's', search_file_command, { silent = true })
vim.keymap.set('v', 'S', search_all_command, { silent = true })

-- now for normal mode, use leader+s and leader+S, do the exact same commands
vim.keymap.set('n', '<leader>s', search_file_command, { silent = true })
vim.keymap.set('n', '<leader>S', search_all_command, { silent = true })

-- [[ LazyGit ]]
vim.keymap.set('n', '<leader>lg', ':LazyGit<CR>', { desc = '[L]azy [G]it' })

-- [[ LPS ]]
vim.keymap.set('n', 'k', '<cmd>lua vim.lsp.buf.hover()<CR>', { desc = 'Show [K]ind' })

vim.keymap.set('n', '<leader>p',
  '<cmd>lua vim.lsp.buf.format { async = true, filter = function(client) return client.name ~= "volar" end }<CR>',
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
-- vim.keymap.set('n', '<leader>fw', require('telescope.builtin').live_grep, { desc = '[F]ind [W]ord' })
vim.keymap.set('n', '<leader>fw', function()
  require('telescope').extensions.live_grep_args.live_grep_args()
end, { desc = '[F]ind [W]ord' })
vim.keymap.set('n', '<leader>fp', ':Telescope projects<CR>', { desc = '[F]ind [P]rojects' })
vim.keymap.set('n', '<leader>fs', require('telescope.builtin').lsp_document_symbols, { desc = '[F]ind [S]ymbols' })

local live_grep_args_shortcuts = require("telescope-live-grep-args.shortcuts")
vim.keymap.set("v", "fw", live_grep_args_shortcuts.grep_visual_selection)

-- [[ NvimTree ]]
vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>', { desc = '[T]oggle NvimTree or [T]ree' })

-- [[ Bufferline ]]
for i = 1, 9 do
  vim.keymap.set('n', '<leader>' .. i, ':BufferLineGoToBuffer ' .. i .. '<CR>', { desc = 'Switch to buffer ' .. i })
end

vim.keymap.set('n', '<leader>x', ':NvimTreeClose | bd<CR>', { desc = '[X]it current buffer and close Nvim-Tree' })
