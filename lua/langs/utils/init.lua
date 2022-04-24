local lsp_installer_servers = require "nvim-lsp-installer.servers"
local global = require "core.global"

local M = {}

function M.setup_lsp(server_name, start_fn)
  local ok, server = lsp_installer_servers.get_server(server_name)
  if ok then
    server:on_ready(start_fn)
    if not server:is_installed() then
      server:install()
    end
  else
    vim.notify("Error starting lsp server " .. server_name)
  end
end

M.config_diagnostic = {
  virtual_text = false,
  update_in_insert = true,
  underline = true,
  severity_sort = true,
}

local function sign_define(name, icon)
  vim.fn.sign_define("DiagnosticSign" .. name, {
    texthl = "DiagnosticSignError",
    text = icon,
    numhl = "DiagnosticDefault" .. name,
  })
end

M.setup_diagnostic = function(custom_conf_diagnostic)
  local local_conf_diagnostic
  if custom_conf_diagnostic ~= nil then
    local_conf_diagnostic = custom_conf_diagnostic
  else
    local_conf_diagnostic = M.conf_diagnostic
  end
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
      vim_diag.set(namespace, bufnr, diagnostics, local_conf_diagnostic)
      if not vim.api.nvim_buf_is_loaded(bufnr) then
        return
      end
      sign_define("Error", "")
      sign_define("Warn", "")
      sign_define("Hint", "")
      sign_define("Info", "")
      vim_diag.show(namespace, bufnr, diagnostics, local_conf_diagnostic)
    end
  end
end

function M.document_highlight(client)
  if client.resolved_capabilities.document_highlight then
    global.fn.autocmd("LspHighlight", {
      [[CursorHold <buffer> lua vim.lsp.buf.document_highlight()]],
      [[CursorMoved <buffer> lua vim.lsp.buf.clear_references()]],
      [[CursorHold,CursorHoldI <buffer> lua vim.diagnostic.open_float(0, { scope = "line" })]],
    }, true, true)
    -- global.fn.autocmd("LspHighlight", {
    -- 	[[CursorHold *.* silent! :lua vim.lsp.buf.document_highlight()]],
    -- 	[[CursorMoved *.* silent! :lua vim.lsp.buf.clear_references()]]
    -- }, true)

    -- vim.api.nvim_command("augroup LspHighlight")
    -- vim.api.nvim_command("autocmd CursorHold *.* silent! :lua vim.lsp.buf.document_highlight()")
    -- vim.api.nvim_command("autocmd CursorMoved *.* silent! :lua vim.lsp.buf.clear_references()")
    -- vim.api.nvim_command("augroup END")
  end
end

-- function M.code_lens_refresh(client)
--   if client.resolved_capabilities.code_lens then
--     Autocmd("lsp_document_codelens", {
--       [[InsertLeave <buffer> lua vim.lsp.codelens.refresh()]],
--       [[InsertLeave <buffer> lua vim.lsp.codelens.display()]],
--       [[BufEnter ++once <buffer> lua require("vim.lsp.codelens").refresh()]],
--       [[BufWritePost,CursorHold <buffer> lua require("vim.lsp.codelens").refresh()]]
--     }, true, true)
--   end
-- end

M.document_formatting = function(client)
  if client.resolved_capabilities.document_formatting then
    global.fn.autocmd("LspFormat", {
      [[BufWritePre *.* silent! :lua vim.lsp.buf.formatting_seq_sync()]],
    }, true)
    -- vim.api.nvim_command("augroup LspFormat")
    -- vim.api.nvim_command("autocmd BufWritePre *.* silent! :lua vim.lsp.buf.formatting_seq_sync()")
    -- vim.api.nvim_command("augroup END")
  end
end

M.get_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  }
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    capabilities = cmp_nvim_lsp.update_capabilities(capabilities)
  end
  return capabilities
end

M.toggle_virtual_text = function()
  if global.virtual_text == "no" then
    local config_diagnostic = {
      virtual_text = {
        prefix = "",
        spacing = 4,
      },
      update_in_insert = true,
      underline = true,
      severity_sort = true,
    }
    M.setup_diagnostic(config_diagnostic)
    if vim.api.nvim_buf_get_option(0, "modifiable") then
      vim.cmd "w"
    end
    global.virtual_text = "yes"
  else
    M.setup_diagnostic()
    if vim.api.nvim_buf_get_option(0, "modifiable") then
      vim.cmd "w"
    end
    global.virtual_text = "no"
  end
end

return M
