return { {
    'rcarriga/nvim-notify',
    config = function()
        local notify = require('notify')

        notify.setup({
            render = 'minimal',
        })

        vim.notify = notify
    end
} }
