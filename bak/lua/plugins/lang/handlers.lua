local config = require("plugins.lang.config")
local M = {}


M.capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  -- capabilities.textDocument.completion.completionItem.preselectSupport = true
  -- capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  -- capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  -- capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  -- capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  -- capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits"
    },
  }
  -- capabilities.textDocument.codeAction = {
  --   dynamicRegistration = false,
  --   codeActionLiteralSupport = {
  --     codeActionKind = {
  --       valueSet = {
  --         "",
  --         "quickfix",
  --         "refactor",
  --         "refactor.extract",
  --         "refactor.inline",
  --         "refactor.rewrite",
  --         "source",
  --         "source.organizeImports",
  --       },
  --     },
  --   },
  -- }
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  end

  return capabilities
end

M.setup = function()
  for _, sign in ipairs(config.signs.values) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  vim.diagnostic.config(config)

  local float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
  }

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, float)
  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, float)

  -- -- Jump directly to the first available definition every time.
  -- vim.lsp.handlers["textDocument/definition"] = function(_, result)
  --   if not result or vim.tbl_isempty(result) then
  --     print "[LSP] Could not find definition"
  --     return
  --   end

  --   if vim.tbl_islist(result) then
  --     vim.lsp.util.jump_to_location(result[1], "utf-8")
  --   else
  --     vim.lsp.util.jump_to_location(result, "utf-8")
  --   end
  -- end

end

return M
