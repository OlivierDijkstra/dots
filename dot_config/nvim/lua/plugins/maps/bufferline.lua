local keymap = vim.keymap.set

for i = 1, 9 do
    keymap('n', '<leader>' .. i, ':BufferLineGoToBuffer ' .. i .. '<CR>', {
        desc = 'Switch to buffer ' .. i
    })
end

keymap('n', '<leader>n', ':enew<CR>', {desc = 'New buffer'})
