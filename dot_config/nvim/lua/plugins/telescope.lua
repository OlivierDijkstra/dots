return { {
    'nvim-telescope/telescope.nvim',
    version = '*',
    dependencies = { "telescope-fzf-native.nvim", "telescope-live-grep-args.nvim" },
    lazy = true,
    cmd = "Telescope",
    config = function()
        local telescope = require('telescope')

        telescope.setup({
            theme = "dropdown",
            defaults = {
                vimgrep_arguments = { "rg", "--color=never", "--no-heading", "--with-filename", "--line-number",
                    "--column", "--smart-case", "--hidden" },
                file_ignore_patterns = {
                    "node_modules",
                    "dist",
                    "build",
                    "target",
                    "vendor",
                    "yarn.lock",
                    ".git",
                },
                prompt_prefix = " ",
                selection_caret = " ",
                entry_prefix = "    ",
                layout_strategy = nil,
                path_display = { "smart" },
                file_previewer = require('telescope.previewers').vim_buffer_cat.new,
                grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
                file_sorter = require('telescope.sorters').get_fuzzy_file,
                generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
                mappings = {
                    i = {
                        ['<C-u>'] = false,
                        ['<C-d>'] = false,
                        ["<S-Up>"] = function(prompt_bufnr)
                            for _ = 1, 5 do
                                require('telescope.actions').move_selection_previous(prompt_bufnr)
                            end
                        end,
                        ["<S-Down>"] = function(prompt_bufnr)
                            for _ = 1, 5 do
                                require('telescope.actions').move_selection_next(prompt_bufnr)
                            end
                        end
                    }
                }
            },
            pickers = {
                find_files = {
                    hidden = true
                }
            },
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case"        -- or "ignore_case" or "respect_case"
                }
                -- project = {
                --     sync_with_nvim_tree = true
                -- },
                -- live_grep_args = {
                --     auto_quoting = true
                -- }
            },
            winblend = 0,
            border = {}
        })

        telescope.load_extension('fzf')
        telescope.load_extension("live_grep_args")
        telescope.load_extension('projects')
    end
}, -- Fuzzy Finder Algorithm which requires local dependencies to be built.
    -- Only load if `make` is available. Make sure you have the system
    -- requirements installed.
    {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        lazy = true
    }, {
    "nvim-telescope/telescope-live-grep-args.nvim",
    lazy = true,
    version = "^1.0.0"
} }
