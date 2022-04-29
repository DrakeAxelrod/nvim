local M = {}

local cfg = {
  -- virtual_text = false,
  virtual_text = { prefix = "●", source = "always" },
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = {
    focusable = false,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
    format = function(d)
      local t = vim.deepcopy(d)
      local code = d.code or (d.user_data and d.user_data.lsp.code)
      if code then
        t.message = ("%s [%s]"):format( t.message, code):gsub("1. ", "")
      end
      return t.message
    end,
  },
}

function M.setup()
  vim.diagnostic.config(cfg)
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, cfg.float)
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, cfg.float)
end

function M.show_line_diagnostics()
  cfg.scope = "line"
  return vim.diagnostic.open_float(0, cfg)
end

return M
