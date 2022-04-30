local M = {}
local icons = require("lib.icons")
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

M.setup_diagnostic = function()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = function(_, result, ctx)
    local uri = result.uri
    local bufnr = vim.uri_to_bufnr(uri)
    if not bufnr then
      return
    end
    local diagnostics = result.diagnostics
    local ok, vim_diag = pcall(require, "vim.diagnostic")
    if ok then
      for i, diagnostic in ipairs(diagnostics) do
        local rng = diagnostic.range
        diagnostics[i].lnum = rng["start"].line
        diagnostics[i].end_lnum = rng["end"].line
        diagnostics[i].col = rng["start"].character
        diagnostics[i].end_col = rng["end"].character
      end
      local namespace = vim.lsp.diagnostic.get_namespace(ctx.client_id)
      vim_diag.set(namespace, bufnr, diagnostics, cfg)
      if not vim.api.nvim_buf_is_loaded(bufnr) then
        return
      end
      vim.fn.sign_define("DiagnosticSignError", {
        texthl = "DiagnosticSignError",
        text = icons.diagnostics.error,
        numhl = "DiagnosticSignError",
      })
      vim.fn.sign_define("DiagnosticSignWarn", {
        texthl = "DiagnosticSignWarn",
        text = icons.diagnostics.warn,
        numhl = "DiagnosticSignWarn",
      })
      vim.fn.sign_define("DiagnosticSignHint", {
        texthl = "DiagnosticSignHint",
        text = icons.diagnostics.hint,
        numhl = "DiagnosticSignHint",
      })
      vim.fn.sign_define("DiagnosticSignInfo", {
        texthl = "DiagnosticSignInfo",
        text = icons.diagnostics.info,
        numhl = "DiagnosticSignInfo",
      })
      vim_diag.show(namespace, bufnr, diagnostics, cfg)
    end
  end
end
function M.setup()
  vim.diagnostic.config(cfg)
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, cfg.float)
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, cfg.float)
  M.setup_diagnostic()
end

function M.show_line_diagnostics()
  cfg.scope = "line"
  return vim.diagnostic.open_float(0, cfg)
end

-- M.toggle_virtual_text = function(virtual_text)
--   if virtual_text == "no" then
--     local config_diagnostic = {
--       virtual_text = {
--         prefix = "",
--         spacing = 4,
--       },
--       update_in_insert = true,
--       underline = true,
--       severity_sort = true,
--     }
--     M.setup_diagnostic(config_diagnostic)
--     if vim.api.nvim_buf_get_option(0, "modifiable") then
--       vim.cmd("w")
--     end
--     virtual_text = "yes"
--   else
--     M.setup_diagnostic()
--     if vim.api.nvim_buf_get_option(0, "modifiable") then
--       vim.cmd("w")
--     end
--     virtual_text = "no"
--   end
-- end

return M
