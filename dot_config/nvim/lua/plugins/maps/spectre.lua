local keymap = vim.keymap.set

keymap('v', '<leader>r',
    '<CR>:lua require("spectre").open({ search_text = vim.fn.expand("<cword>"), cwd = vim.fn.expand("%:p:h"), is_close = true })<CR>',
    {
        desc = '[R]eplace and find on current file',
        silent = true
    })
keymap('v', '<leader>R',
    '<CR>:lua require("spectre").open({ search_text = vim.fn.expand("<cword>"), cwd = "", is_close = true })<CR>', {
    desc = '[R]eplace and find on all files',
    silent = true
})

