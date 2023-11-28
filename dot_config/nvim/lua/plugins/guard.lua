return {
  {
    "nvimdev/guard.nvim",
    -- Builtin configuration, optional
    dependencies = {
      "nvimdev/guard-collection",
    },
    config = function()
      local ft = require('guard.filetype')

      -- Assuming you have guard-collection
      ft('typescript,javascript,typescriptreact'):fmt('prettier'):lint('eslint')
      ft('vue'):fmt('prettier'):lint('eslint')

      -- Call setup() LAST!
      require('guard').setup({
        -- the only options for the setup function
        fmt_on_save = false,
        -- Use lsp if no formatter was defined for this filetype
        lsp_as_default_formatter = true,
      })
    end,
  }
}
