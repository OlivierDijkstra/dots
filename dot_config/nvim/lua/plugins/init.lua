return {{
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
        require "configs.conform"
    end
}, {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    lazy = true
}, {
    "nvim-telescope/telescope-live-grep-args.nvim",
    lazy = true,
    version = "^1.0.0"
}, {
    "typicode/bg.nvim",
    lazy = false
}, {
    'github/copilot.vim',
    lazy = true,
    event = 'User FileOpened'
}}
