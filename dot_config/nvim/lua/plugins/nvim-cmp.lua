return { {
    'hrsh7th/nvim-cmp',
    dependencies = { "cmp-nvim-lsp", "cmp_luasnip", "cmp-buffer", "cmp-path", "cmp-cmdline" },
    config = function()
        local cmp = require('cmp')

        cmp.setup({
            -- Always preselect the first item
            preselect = 'item',
            completion = {
                completeopt = 'menu,menuone,noinsert'
            },
            window = {
                completion = cmp.config.window.bordered(),
                documentation = cmp.config.window.bordered()
            },
            sources = { {
                name = 'nvim_lsp'
            }, {
                name = 'luasnip'
            } },
            mapping = cmp.mapping.preset.insert({
                -- Enter key confirms completion item
                ['<CR>'] = cmp.mapping.confirm({
                    select = false
                }),

                -- Ctrl + space triggers completion menu
                ['<C-Space>'] = cmp.mapping.complete()
            }),
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end
            }
        })
    end
}, {
    "hrsh7th/cmp-nvim-lsp",
    lazy = true
}, {
    "saadparwaiz1/cmp_luasnip",
    lazy = true
}, {
    "hrsh7th/cmp-buffer",
    lazy = true
}, {
    "hrsh7th/cmp-path",
    lazy = true
}, {
    "hrsh7th/cmp-cmdline",
    lazy = true
}, {
    "L3MON4D3/LuaSnip",
    config = function()
        require("luasnip.loaders.from_lua").lazy_load()
        require("luasnip.loaders.from_vscode").lazy_load()
    end,
    event = "InsertEnter",
    dependencies = { "friendly-snippets" }
}, {
    "rafamadriz/friendly-snippets",
    lazy = true
} }
