local keymap = vim.keymap.set

keymap('n', '<leader>t', ':NvimTreeToggle<CR>', {
    desc = '[T]oggle NvimTree or [T]ree'
})
