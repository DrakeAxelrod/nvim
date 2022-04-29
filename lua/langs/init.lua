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

function Conditional_Document_Highlight(id)
  local client_ok, method_supported = pcall(function()
    return vim.lsp.get_client_by_id(id).resolved_capabilities.document_highlight
  end)
  if not client_ok or not method_supported then
    return
  end
  vim.lsp.buf.document_highlight()
end

local function enable_lsp_document_highlight(client_id)
  define_augroups({
    lsp_document_highlight = {
      {
        "CursorHold",
        "<buffer>",
        string.format("lua Conditional_Document_Highlight(%d)", client_id),
      },
      {
        "CursorMoved",
        "<buffer>",
        "lua vim.lsp.buf.clear_references()",
      },
    },
  }, true)
end

local function enable_code_lens_refresh()
  define_augroups({
    lsp_code_lens_refresh = {
      {
        "InsertLeave ",
        "<buffer>",
        "lua vim.lsp.codelens.refresh()",
      },
      {
        "InsertLeave ",
        "<buffer>",
        "lua vim.lsp.codelens.display()",
      },
    },
  }, true)
end

local function enable_format_on_save(opts)
  local fmd_cmd = string.format(":silent lua vim.lsp.buf.formatting_sync({}, %s)", opts.timeout)
  define_augroups({
    format_on_save = { { "BufWritePre", opts.pattern, fmd_cmd } },
  }, true)
  vim.notify("enabled format-on-save")
end

local function disable_format_on_save()
  disable_augroup("format_on_save")
  vim.notify("disabled format-on-save")
end

local function toggle_format_on_save()
  if vim.fn.exists "#format_on_save#BufWritePre" == 0 then
    local opts = {
      pattern = "<buffer>",
      timeout = "1000",
    }
    enable_format_on_save(opts)
  else
    disable_format_on_save()
  end
end

local function disable_lsp_document_highlight()
  disable_augroup "lsp_document_highlight"
end

local function lsp_highlight_document(client)
  enable_lsp_document_highlight(client.id)
end

local function disable_code_lens_refresh()
  disable_augroup("lsp_code_lens_refresh")
end

local function lsp_code_lens_refresh(client)
  if client.resolved_capabilities.code_lens then
    enable_code_lens_refresh()
  end
end

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

local function select_default_formater(client)
  if client.name == "null-ls" or not client.resolved_capabilities.document_formatting then
    return
  end
  vim.notify("Checking for formatter overriding for " .. client.name)
  local formatters = require "lvim.lsp.null-ls.formatters"
  local client_filetypes = client.config.filetypes or {}
  for _, filetype in ipairs(client_filetypes) do
    if #vim.tbl_keys(formatters.list_registered(filetype)) > 0 then
      vim.notify("Formatter overriding detected. Disabling formatting capabilities for " .. client.name)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
    end
  end
end

local function common_on_exit(_, _)
    disable_lsp_document_highlight()
    disable_code_lens_refresh()
end

local function common_on_init(client, bufnr)
  if lvim.lsp.on_init_callback then
    lvim.lsp.on_init_callback(client, bufnr)
    vim.notify("Called lsp.on_init_callback")
    return
  end
  -- select_default_formater(client)
end

local function common_on_attach(client, bufnr)
  local aerial_ok, aerial = pcall(require, "aerial")
  if aerial_ok then
    aerial.on_attach(client, bufnr)
  end

  require("langs.handlers").setup()
  lsp_highlight_document(client)
  lsp_code_lens_refresh(client)
  local keys = require("conf.keys")
  keys.lsp(client, bufnr)
end

lsp_installer.on_server_ready(function(server)
  -- Specify the default options which we'll use to setup all servers
  local opts = {
    on_attach = common_on_attach,
    on_init = common_on_init,
    on_exit = common_on_exit,
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
