lua <<EOF
require("lspsaga").setup({
  ui = {
    title = true,
    border = "rounded",
    winblend = 0,
    expand = "",
    collapse = "",
    code_action = "💡",
    incoming = " ",
    outgoing = " ",
    hover = ' ',
    kind = {},
  },
})
EOF
