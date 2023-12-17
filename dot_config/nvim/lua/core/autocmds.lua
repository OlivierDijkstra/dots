local group = vim.api.nvim_create_augroup("FileOpenChecks", {
  clear = true
})

local not_allowed_files = { "nofile", "help", "terminal", "quickfix", "prompt", "lspinfo" }

vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
  group = group,
  callback = function(args)
    local buftype = vim.api.nvim_get_option_value("buftype", {
      buf = args.buf
    })
    local filetype = vim.api.nvim_buf_get_option(args.buf, "filetype")

    -- Print the filetype to the terminal
    if not (vim.fn.expand "%" == "" or vim.tbl_contains(not_allowed_files, buftype) or filetype == "") then
      vim.api.nvim_exec_autocmds("User", {
        pattern = "FileOpened"
      })
    end
  end
})

vim.api.nvim_create_autocmd({ "BufRead", "BufWinEnter", "BufNewFile" }, {
  group = group,
  callback = function(args)
    local buftype = vim.api.nvim_get_option_value("buftype", {
      buf = args.buf
    })
    local filetype = vim.api.nvim_buf_get_option(args.buf, "filetype")
    if not (vim.fn.expand "%" == "" or vim.tbl_contains(not_allowed_files, buftype) or filetype == "") then
      if filetype == "lua" then
        vim.api.nvim_exec_autocmds("User", {
          pattern = "LuaFileOpened"
        })
      end
    end
  end
})
