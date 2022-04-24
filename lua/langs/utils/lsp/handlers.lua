local M = {}

local lsp_config = require("lsp.config")

function M.setup()
  local config = {
    virtual_text = lsp_config.diagnostics.virtual_text,
    signs = lsp_config.diagnostics.signs,
    underline = lsp_config.diagnostics.underline,
    update_in_insert = lsp_config.diagnostics.update_in_insert,
    severity_sort = lsp_config.diagnostics.severity_sort,
    float = lsp_config.diagnostics.float,
  }

  vim.diagnostic.config(config)
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, lsp_config.float)
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, lsp_config.float)
  vim.lsp.handlers["textDocument/definition"] = function(_, result)
    if not result or vim.tbl_isempty(result) then
      vim.notify("[LSP] Could not find definition")
      return
    end
    if vim.tbl_islist(result) then
      vim.lsp.util.jump_to_location(result[1], "utf-8")
    else
      vim.lsp.util.jump_to_location(result, "utf-8")
    end
  end

  vim.lsp.handlers['textDocument/publishDiagnostics'] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = true,
    update_in_insert = false,
    signs = {
      severity_limit = "Error",
    },
    underline = {
      severity_limit = "Warning",
    },
  })
  -- https://github.com/tjdevries/config_manager/blob/master/xdg_config/nvim/lua/tj/lsp/handlers.lua
  vim.lsp.handlers["window/showMessage"] = require("langs.global.utils.show_message")

  local params = vim.lsp.util.make_position_params()

  vim.lsp.buf_request(0, "textDocument/implementation", params, function(err, result, ctx, cfg)
    local bufnr = ctx.bufnr
    local ft = vim.api.nvim_buf_get_option(bufnr, "filetype")

    -- In go code, I do not like to see any mocks for impls
    if ft == "go" then
      local new_result = vim.tbl_filter(function(v)
        return not string.find(v.uri, "mock_")
      end, result)

      if #new_result > 0 then
        result = new_result
      end
    end

    vim.lsp.handlers["textDocument/implementation"](err, result, ctx, cfg)
    vim.cmd([[normal! zz]])
  end)
end

return M
