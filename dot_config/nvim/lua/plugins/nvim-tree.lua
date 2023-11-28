return { {
    'nvim-tree/nvim-tree.lua',
    version = "*",
    -- lazy = true,
    cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeFocus", "NvimTreeFindFileToggle" },
    event = "User DirOpened",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("nvim-tree").setup {
            -- Telescope projects integration
            sync_root_with_cwd = true,
            respect_buf_cwd = true,
            update_focused_file = {
                enable = true,
                update_root = true
            },
            --
            git = {
                enable = true,
                ignore = false,
                show_on_dirs = true,
                show_on_open_dirs = true,
                timeout = 200
            },
            actions = {
                use_system_clipboard = true,
                change_dir = {
                    enable = true,
                    global = false,
                    restrict_above_cwd = false
                },
                expand_all = {
                    max_folder_discovery = 300,
                    exclude = {}
                },
                file_popup = {
                    open_win_config = {
                        col = 1,
                        row = 1,
                        relative = "cursor",
                        border = "shadow",
                        style = "minimal"
                    }
                },
                open_file = {
                    quit_on_open = true,
                    resize_window = false,
                    window_picker = {
                        enable = true,
                        picker = "default",
                        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                        exclude = {
                            filetype = { "notify", "lazy", "qf", "diff", "fugitive", "fugitiveblame" },
                            buftype = { "nofile", "terminal", "help" }
                        }
                    }
                },
                remove_file = {
                    close_window = true
                }
            },
            tab = {
                sync = {
                    open = true,
                    close = true
                }
            }
        }
    end
} }
