local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  return
end

-- TODO: add something to installer later
-- require("lspconfig").motoko.setup {}
-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
  local opts = {
    on_attach = require("lsp.handlers").on_attach,
    capabilities = require("lsp.handlers").capabilities,
  }

  if server.name == "jsonls" then
    local jsonls_opts = require("packages.nvim-lspconfig.settings.jsonls")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "yaml" then
    local jsonls_opts = require("packages.nvim-lspconfig.settings.yaml")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "tsserver" then
    local jsonls_opts = require("packages.nvim-lspconfig.settings.tsserver")
    opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
  end

  if server.name == "clangd" then
    local clangd_opts = require("packages.nvim-lspconfig.settings.clangd")
    opts = vim.tbl_deep_extend("force", clangd_opts, opts)
  end

  if server.name == "sumneko_lua" then
    local sumneko_opts = require("packages.nvim-lspconfig.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

  if server.name == "pyright" then
    local pyright_opts = require("packages.nvim-lspconfig.settings.pyright")
    opts = vim.tbl_deep_extend("force", pyright_opts, opts)
  end

  -- This setup() function is exactly the same as lspconfig's setup function.
  -- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
  server:setup(opts)
end)
