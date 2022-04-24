local M = {}

-- local lsp_config = require("lsp.config")

function M:setup()
  local status_ok, null_ls = pcall(require, "null-ls")
  if not status_ok then
    vim.notify("Missing null-ls dependency")
    return
  end

  local default_opts = require("lsp").get_common_opts()
  null_ls.setup(default_opts)
end

return M
