return { {
    'nvim-pack/nvim-spectre',
    event = 'VimEnter',
    config = function()
        require('spectre').setup({
            live_update = true,
            mapping = {
                ['replace_current'] = {
                    map = 'r',
                    cmd = "<cmd>lua require('spectre.actions').run_current_replace()<CR>",
                    desc = "Replace current selection only"
                },
                ['run_replace'] = {
                    map = "R",
                    cmd = "<cmd>lua require('spectre.actions').run_replace()<CR>",
                    desc = "replace all"
                },
                ['toggle_ignore_case'] = {
                    map = "I",
                    cmd = "<cmd>lua require('spectre').change_options('ignore-case')<CR>",
                    desc = "toggle ignore case"
                }
            }
        })
    end,
    opts = {}
} }
