require('lsp-config.configuration')
local on_attach = require('lsp-config.setup')

-- Enable the following language servers & install automatically
local servers = {
  tsserver = {},
  volar = {},
  tailwindcss = {},
  julials = {},
  lua_ls = {
    Lua = {
      workspace = { checkThirdParty = false },
      telemetry = { enable = false },
    },
  },
}

local lspconfig = require('lspconfig')
local null_ls = require('null-ls')

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.prettier,

    null_ls.builtins.diagnostics.eslint.with({
      command = 'eslint',
      args = { '--stdin', '--fix-dry-run', '--format=json', '--stdin-filename', '$FILENAME' },
      filetypes = { 'javascript', 'typescript', 'javascriptreact', 'typescriptreact' }
    })
  },
})

lspconfig.tsserver.setup({
  filetypes = {"typescript", "typescriptreact", "typescript.tsx"},
  on_attach = function(client)
    local ts_utils = require("nvim-lsp-ts-utils")
    ts_utils.setup({ enable_formatting = true })
    ts_utils.setup_client(client)
  end,
})

lspconfig.volar.setup({
  filetypes = { 'vue' },
})

lspconfig.julials.setup({
  on_attach = on_attach,
  filetypes = { "julia", "rc" },
})

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- [[ Mason Configuration ]]
require('mason').setup()

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
  ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
  function(server_name)
    require('lspconfig')[server_name].setup {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = servers[server_name],
    }
  end,
}
