return { {
    'akinsho/bufferline.nvim',
    version = "v3.*",
    event = "User FileOpened",
    config = function()
        require("bufferline").setup {
            options = {
                diagnostics = "nvim_lsp"
            }
        }
    end
} }
