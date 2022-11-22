local M = {}
local lib = require "lib"
local fs = lib.fs
local fn = lib.fn
local vim = vim
local theme = require "theme"

M.setup = function()
  local signs = {

    { name = "DiagnosticSignError", text = theme.icons.diagnostics.error },
    { name = "DiagnosticSignWarn", text = theme.icons.diagnostics.warning },
    { name = "DiagnosticSignHint", text = theme.icons.diagnostics.hint },
    { name = "DiagnosticSignInfo", text = theme.icons.diagnostics.information },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  vim.diagnostic.config {
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
          t.message = ("%s [%s]"):format(t.message, code):gsub("1. ", "")
        end
        return t.message
      end,
    },
  }

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })
  -- Jump directly to the first available definition every time.
  vim.lsp.handlers["textDocument/definition"] = function(_, result)
    if not result or vim.tbl_isempty(result) then
      print "[LSP] Could not find definition"
      return
    end

    if vim.tbl_islist(result) then
      vim.lsp.util.jump_to_location(result[1], "utf-8")
    else
      vim.lsp.util.jump_to_location(result, "utf-8")
    end
  end

end

local function lsp_highlight_document(client, bufnr)
  if client.server_capabilities.documentHighlightProvider then
    -- fn.augroup("LspHighlight")(function(autocmd)
    --   autocmd("CursorHold", { buffer=bufnr }, vim.lsp.buf.document_highlight)
    --   autocmd("CursorMoved", { buffer=bufnr }, vim.lsp.buf.clear_references)
    -- end)
  end
end

M.common_on_attach = function(client, bufnr)
  local cmds = require "core.cmds"
  local aerial_ok, aerial = pcall(require, "aerial")
  if aerial_ok then
--    aerial.on_attach(client, bufnr)
  end
  require("copilot").setup {}
  cmds.lsp(bufnr)
  lsp_highlight_document(client)
end

M.common_capabilities = function()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.preselectSupport = true
  capabilities.textDocument.completion.completionItem.insertReplaceSupport = true
  capabilities.textDocument.completion.completionItem.labelDetailsSupport = true
  capabilities.textDocument.completion.completionItem.deprecatedSupport = true
  capabilities.textDocument.completion.completionItem.commitCharactersSupport = true
  capabilities.textDocument.completion.completionItem.tagSupport = { valueSet = { 1 } }
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities.textDocument.completion.completionItem.resolveSupport = {
    properties = { "documentation", "detail", "additionalTextEdits" },
  }
  capabilities.textDocument.codeAction = {
    dynamicRegistration = false,
    codeActionLiteralSupport = {
      codeActionKind = {
        valueSet = {
          "",
          "quickfix",
          "refactor",
          "refactor.extract",
          "refactor.inline",
          "refactor.rewrite",
          "source",
          "source.organizeImports",
        },
      },
    },
  }
  local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
  if status_ok then
    capabilities = cmp_nvim_lsp.default_capabilities(capabilities)
  end

  return capabilities
end

function M.enable_format_on_save()
  fn.augroup "LspFormatOnSave"(function(autocmd)
    autocmd("BufWritePre", { pattern = "*" }, function()
      vim.lsp.buf.format({ async = true })
    end)
  end)
  vim.notify "Enabled format on save"
end

function M.disable_format_on_save()
  if vim.fn.exists "#LspFormatOnSave" == 1 then
    vim.cmd "au! LspFormatOnSave"
  end
  vim.notify "Disabled format on save"
end

function M.toggle_format_on_save()
  if vim.fn.exists "#format_on_save#BufWritePre" == 0 then
    M.enable_format_on_save()
  else
    M.disable_format_on_save()
  end
end

vim.cmd [[ command! LspToggleAutoFormat execute 'lua require("plugins.lang.handlers").toggle_format_on_save()' ]]

return M
