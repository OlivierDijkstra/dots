lua << EOF
local mason = require('mason')
local lspconfig = require('mason-lspconfig')
local nvim_lsp = require('lspconfig')
local null_ls = require('null-ls')

-- Mason configuration

mason.setup({})

lspconfig.setup({
  automatic_installation = true 
})

-- Null-ls configuration

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,
    null_ls.builtins.diagnostics.eslint,
  }
})

-- Function to attach keybindings and completion when LSP starts
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

  -- Mappings
  local opts = { noremap=true, silent=true }
  buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
end

-- LSP servers configuration
nvim_lsp.tsserver.setup({
  on_attach = on_attach,
  filetypes = { 'typescript', 'typescriptreact' },
})

nvim_lsp.vls.setup({
  on_attach = on_attach,
})

nvim_lsp.tailwindcss.setup({
  on_attach = on_attach,
})
EOF
