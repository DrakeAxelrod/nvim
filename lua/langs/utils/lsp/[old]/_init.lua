local has_lsp, lspconfig = pcall(require, "lspconfig")
if not has_lsp then
  return
end

require("packages.nvim-lspconfig.lsp-installer")
require("packages.nvim-lspconfig.handlers").setup()
require("packages.nvim-lspconfig.null-ls")