local preferred_servers = {
  python = "pyright",
  javascript = "tsserver",
  typescript = "tsserver",
  typescriptreact = "tsserver",
  vue = "volar",
  css = "cssls",
  html = "html",
  json = "jsonls",
  lua = "lua_ls"
  -- Add more mappings as needed
}

local tailwind_filetypes = {
  css = true,
  html = true,
  javascript = true,
  typescript = true,
  vue = true
  -- Add more file types as needed
}

local tailwind_config_files = { "tailwind.config.js", "tailwind.config.ts", "tailwind.config.cjs", "tailwind.js",
  "tailwind.ts", "tailwind.cjs" }

return { {
  'williamboman/mason.nvim',
  lazy = true,
  cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
  event = 'User FileOpened'
}, {
  'williamboman/mason-lspconfig.nvim',
  lazy = true,
  cmd = { "LspInstall", "LspUninstall" },
  event = 'User FileOpened',
  dependencies = { 'mason.nvim' },
  config = function()
    local utils = require('core.utils')
    local lspconfig = require('lspconfig')

    local default_setup = function(server)
      lspconfig[server].setup({
        capabilities = lsp_capabilities
      })
    end

    require('mason').setup({})
    require('mason-lspconfig').setup({
      ensure_installed = { 'eslint' },
      handlers = { default_setup }
    })

    local server_mappings = require('mason-lspconfig.mappings.server')
    local registry = require('mason-registry')

    local function get_servers_by_filetype(filetype)
      local filetype_mappings = require("mason-lspconfig.mappings.filetype")
      local server_mappings = require('mason-lspconfig.mappings.server')
      local registry = require('mason-registry')

      local servers = filetype_mappings[filetype]
      if not servers then
        return nil
      end

      local available_servers = {}
      for _, lsp_name in pairs(servers) do
        available_servers[lsp_name] = true
      end

      local installed_servers = {}
      for lsp_name, _ in pairs(available_servers) do
        local pkg_name = server_mappings.lspconfig_to_package[lsp_name]
        if pkg_name then
          local pkg = registry.get_package(pkg_name)
          if pkg:is_installed() then
            installed_servers[lsp_name] = true
          end
        end
      end

      return installed_servers
    end

    local function ensure_lsp_server(filetype)
      if filetype == "" then
        return
      end

      local is_tailwind_project = utils.file_exists_in_project(tailwind_config_files)

      if tailwind_filetypes[filetype] and is_tailwind_project then
        -- determine if we have already installed tailwindcss
        local tailwindcss_installed = false
        local installed_servers = get_servers_by_filetype(filetype)
        for lsp_name, _ in pairs(installed_servers) do
          if lsp_name == "tailwindcss" then
            tailwindcss_installed = true
          end
        end

        if not tailwindcss_installed then
          -- install tailwindcss
          local pkg_name = server_mappings.lspconfig_to_package["tailwindcss"]
          if pkg_name then
            local pkg = registry.get_package(pkg_name)
            if not pkg:is_installed() then
              require("mason-lspconfig.install").install(pkg):once('closed', function()
                vim.schedule(function()
                  default_setup("tailwindcss")
                end)
              end)
            end
          end
        end
      end

      local preferred_server_name = preferred_servers[filetype]

      -- If no preferred server is defined, check available servers
      if not preferred_server_name then
        local installed_servers = get_servers_by_filetype(filetype) or {} -- Ensure it's a table

        if vim.tbl_count(installed_servers) == 0 then
          vim.schedule(function()
            -- vim.cmd("LspInstall")
            vim.notify("No LSP server is installed for " .. filetype .. ". Please run :LspInstall to install one.",
              vim.log.levels.WARN)
          end)
          return
        end
      end

      -- Install preferred server if not installed
      local server_mappings = require('mason-lspconfig.mappings.server')
      local registry = require('mason-registry')
      local pkg_name = server_mappings.lspconfig_to_package[preferred_server_name]

      if pkg_name then
        local pkg = registry.get_package(pkg_name)
        if not pkg:is_installed() then
          require("mason-lspconfig.install").install(pkg):once('closed', function()
            vim.schedule(function()
              default_setup(preferred_server_name)
            end)
          end)
        end
      end
    end

    -- Ensure that the LSP server is installed when opening a file
    vim.api.nvim_create_autocmd("User", {
      pattern = "FileOpened",
      group = group,
      callback = function()
        local filetype = vim.bo.filetype
        ensure_lsp_server(filetype)
      end
    })
  end
} }
