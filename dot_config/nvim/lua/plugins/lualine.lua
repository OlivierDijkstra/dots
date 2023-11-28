return {
    'nvim-lualine/lualine.nvim',
    event = 'VimEnter',
    config = function()
        local lua_line = require('lualine')
        local utils = require('core.utils')

        lua_line.setup({
            theme = 'auto',
            options = {
                icons_enabled = true,
                component_separators = '',
                section_separators = ''
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch' },
                lualine_c = { {
                    'diagnostics',
                    sections = { 'error', 'warn', 'info', 'hint' },
                    symbols = {
                        error = utils.symbols.Error,
                        warn = utils.symbols.Warn,
                        info = utils.symbols.Info,
                        hint = utils.symbols.Hint
                    },
                    colored = true
                    -- always_visible = true,
                } },
                lualine_x = { 'filetype' },
                lualine_y = {},
                lualine_z = {}
            }
        })
    end
}
