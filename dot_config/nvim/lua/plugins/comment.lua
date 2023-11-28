return { {
    'numToStr/Comment.nvim',
    event = "User FileOpened",
    dependencies = { 'nvim-ts-context-commentstring' },
    config = function()
        require('Comment').setup({
            toggler = {
                line = '<leader>/'
            },
            opleader = {
                line = '<leader>/'
            },
            pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook()
        })
    end
}, {
    'nvim-ts-context-commentstring',
    lazy = true
} }
