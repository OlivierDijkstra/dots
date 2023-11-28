local keymap = vim.keymap.set

keymap('n', '<leader>ff', require('telescope.builtin').find_files, {
    desc = '[F]ind [F]iles'
})

keymap('n', '<leader>fh', function()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        winblend = 10,
        previewer = false
    })
end, {
    desc = '[F]ind [H]ere'
})

keymap('n', '<leader>fs', require('telescope.builtin').lsp_document_symbols, {
    desc = '[F]ind [S]ymbols'
})

keymap('n', '<leader>fw', function()
    require('telescope').extensions.live_grep_args.live_grep_args()
end, {
    desc = '[F]ind [W]ord'
})

keymap('n', '<leader>fp', ':Telescope projects<CR>', {
    desc = '[F]ind [P]rojects'
})
