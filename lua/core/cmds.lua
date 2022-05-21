local M = {}
local vim = vim
local fn = require("lib").fn

local bufcmd = function(bufnr, name, command, opts)
  opts = opts or {}
  vim.api.nvim_buf_create_user_command(bufnr, name, command, opts)
end

M.lsp = function(bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
  bufcmd(bufnr, "LspDeclaration", vim.lsp.buf.declaration)
  bufcmd(bufnr, "LspDefinition", vim.lsp.buf.definition)
  bufcmd(bufnr, "LspTypeDefinition", vim.lsp.buf.type_definition)
  bufcmd(bufnr, "LspReferences", vim.lsp.buf.references)
  bufcmd(bufnr, "LspRename", vim.lsp.buf.rename)
  bufcmd(bufnr, "LspHover", vim.lsp.buf.hover)
  bufcmd(bufnr, "LspSignatureHelp", vim.lsp.buf.signature_help)
  bufcmd(bufnr, "LspImplementation", vim.lsp.buf.implementation)
  bufcmd(bufnr, "LspCodeAction", vim.lsp.buf.code_action)
  -- bufcmd(bufnr, "LspCodeLens", vim.lsp.buf.code_lens)
  bufcmd(bufnr, "LspDiagnosticsFloat", vim.diagnostic.open_float)
  bufcmd(bufnr, "LspDiagnosticGoToNext", function()
    vim.diagnostic.goto_next({ border = "rounded" })
  end)
  bufcmd(bufnr, "LspDiagnosticGoToPrevious", function()
    vim.diagnostic.goto_prev({ border = "rounded" })
  end)
  bufcmd(bufnr, "LspSetLoclist", vim.diagnostic.setloclist)
  bufcmd(bufnr, "LspFormat", function()
    vim.lsp.buf.format({ async = true })
  end)
end

M.autocmds = function()
  fn.augroup("MiscAutocmds")(function(autocmd)
    autocmd("TermOpen", { pattern = "*" }, function()
      vim.cmd("setlocal statusline= listchars= nonumber norelativenumber")
      vim.cmd("startinsert")
    end)
    autocmd("TermClose", { pattern = "*" }, function()
      vim.cmd([[call feedkeys("\<cr>")"]])
    end)
    autocmd("VimResized", { pattern = "*" }, function()
      vim.cmd("tabdo wincmd =")
    end)
  end)
end

M.init = function(self)
  self.autocmds()
end

return M
