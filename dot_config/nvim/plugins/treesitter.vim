lua <<EOF
require'nvim-treesitter.configs'.setup {
				ensure_installed = {
								-- Should always be installed:
								"c",
								"lua",
								"vim",
								"vimdoc",
								"query",
								-- Optional:
                "markdown",
                "markdown_inline",
								"javascript",
								"typescript",
								"html",
								"css",
								"vue",
								"json"
				},
				indent = {
				        enable = true,
				},
				highlight = {
								enable = true,
                additional_vim_regex_highlighting = false,
				},
				autotag = {
				        enable = true,
				}
}
EOF
