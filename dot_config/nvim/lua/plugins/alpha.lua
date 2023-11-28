return { {
    -- Start screen customizer
    'goolord/alpha-nvim',
    config = function()
        local alpha = require 'alpha'
        local dashboard = require 'alpha.themes.dashboard'
        dashboard.section.header.val = { "                                         _.oo.",
            "                 _.u[[/;:,.         .odMMMMMM'",
            "              .o888UU[[[/;:-.  .o@P^    MMM^",
            "             oN88888UU[[[/;::-.        dP^",
            "            dNMMNN888UU[[[/;:--.   .o@P^", "           ,MMMMMMN888UU[[/;::-. o@^",
            "           NNMMMNN888UU[[[/~.o@P^", "           888888888UU[[[/o@^-..",
            "          oI8888UU[[[/o@P^:--..", "       .@^  YUU[[[/o@^;::---..",
            "     oMP     ^/o@P^;:::---..", "  .dMMM    .o@^ ^;::---...",
            " dMMMMMMM@^`       `^^^^", "YMMMUP^", " ^^" }

        dashboard.section.buttons.val =
        { dashboard.button('1', '🌳 Open file tree (<Leader>t)', ':NvimTreeToggle<CR>'),
            dashboard.button('2', '📁 Find files (<Leader>ff)', ':Telescope find_files<CR>'),
            dashboard.button('3', '💬 Find word (<Leader>fw)',
                ':lua require("telescope").extensions.live_grep_args.live_grep_args()<CR>'),
            dashboard.button('4', '🚪 Quit (q)', ':quit<CR>'),
            dashboard.button('5', '📚 Open project (<Leader>fp)', ':Telescope projects<CR>'),
            dashboard.button('6', '🔄 Update plugins', ':Lazy update<CR>') }
        local handle = io.popen('fortune')
        local fortune = handle:read('*a')
        handle:close()
        dashboard.section.footer.val = fortune
        alpha.setup(dashboard.opts)
    end
} }
