-- https://github.com/williamboman/nvim-lsp-installer
-- vim.lsp.set_log_level("debug")
local ok, lsp_installer = pcall(require,"nvim-lsp-installer")
if not ok then
  return
end
-- Include the servers you want to have installed by default below
-- local servers = {
--   "bashls",
--   "pyright",
--   "vuels",
--   "yamlls",
-- }
-- for _, name in pairs(servers) do
--   local server_is_found, server = lsp_installer.get_server(name)
--   if server_is_found and not server:is_installed() then
--     print("Installing " .. name)
--     server:install()
--   end
-- end

local function common_capabilities()
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

local function common_on_attach(client, bufnr)
  local aerial_ok, aerial = pcall(require, "aerial")
  if aerial_ok then
    aerial.on_attach(client, bufnr)
  end

  local keys = require("conf.keys")
  keys.lsp(client, bufnr)
  require("langs.handlers").setup()
end

lsp_installer.on_server_ready(function(server)
  -- Specify the default options which we'll use to setup all servers
  local opts = {
    on_attach = common_on_attach,
    capabilities = common_capabilities(),
  }

  if server.name == "sumneko_lua" then
    local sumneko_opts = require "langs.providers.sumneko_lua"
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end
  -- might cause installation of all severs?
  -- if not server:is_installed() then
  --   vim.notify("Installing " .. server.name)
  --   server:install()
  -- end
  server:setup(opts)
end)
