local M = {}
local lsp_config = require("lsp.config")

local signature_cfg = require("lsp.lsp-signature")
local signature_ok, signature = pcall(require, "lsp_signature")

local clangd_ok, clangd = pcall(require, "clangd_extensions.config")
if clangd_ok then
  clangd.setup({
    extensions = { inlay_hints = { only_current_line = true, show_variable_name = true } },
  })
end

local function lsp_highlight_document(client)
  if lsp_config.document_highlight == false then
    return
  end
  if client.resolved_capabilities.document_highlight then
    Autocmd("lsp_document_highlight", {
      [[CursorHold <buffer> lua vim.lsp.buf.document_highlight()]],
      [[CursorMoved <buffer> lua vim.lsp.buf.clear_references()]],
      [[CursorHold,CursorHoldI <buffer> lua vim.diagnostic.open_float(0, { scope = "line" })]],
    }, true, true)
  end
end

local function lsp_code_lens_refresh(client)
  if lsp_config.code_lens_refresh == false then
    return
  end
  if client.resolved_capabilities.code_lens then
    Autocmd("lsp_document_codelens", {
      [[InsertLeave <buffer> lua vim.lsp.codelens.refresh()]],
      [[InsertLeave <buffer> lua vim.lsp.codelens.display()]],
      [[BufEnter ++once <buffer> lua require("vim.lsp.codelens").refresh()]],
      [[BufWritePost,CursorHold <buffer> lua require("vim.lsp.codelens").refresh()]]
    }, true, true)
  end
end

local function add_lsp_buffer_keybindings(bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc') -- Enable completion triggered by <c-x><c-o>
  local mappings = {
    normal_mode = "n",
    insert_mode = "i",
    visual_mode = "v",
  }
  local ok, wk = pcall(require, "which-key")
  if ok then
    -- Remap using which_key
    for mode_name, mode_char in pairs(mappings) do
      wk.register(lsp_config.buffer_mappings[mode_name],{
          mode = mode_char,
          prefix = "g",
          buffer = bufnr,
          silent = true, -- use `silent` when creating keymaps
          noremap = true, -- use `noremap` when creating keymaps
          nowait = true, -- use `nowait` when creating keymaps
        })
    end
  end
end

function M.common_capabilities()
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
  local formatters = require("lsp.null-ls.formatters")
  local client_filetypes = client.config.filetypes or {}
  for _, filetype in ipairs(client_filetypes) do
    if #vim.tbl_keys(formatters.list_registered(filetype)) > 0 then
      vim.notify("Formatter overriding detected. Disabling formatting capabilities for " .. client.name)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
    end
  end
end

function M.common_on_exit(_, _)
  if lsp_config.document_highlight then
    DisableAugroup("lsp_document_highlight")
  end
  if lsp_config.code_lens_refresh then
    DisableAugroup("lsp_document_codelens")
  end
end

function M.common_on_init(client, bufnr)
  if lsp_config.on_init_callback then
    lsp_config.on_init_callback(client, bufnr)
    vim.notify("Called lsp.on_init_callback")
    return
  end
  select_default_formater(client)
end

function M.common_on_attach(client, bufnr)
  if signature_ok then
    signature.on_attach(signature_cfg, bufnr)
  end

  if lsp_config.on_attach_callback then
    lsp_config.on_attach_callback(client, bufnr)
    vim.notify("Called lsp.on_attach_callback")
  end
  lsp_highlight_document(client)
  lsp_code_lens_refresh(client)
  add_lsp_buffer_keybindings(bufnr)
end

local function bootstrap_nlsp(opts)
  opts = opts or {}
  local lsp_settings_status_ok, lsp_settings = pcall(require, "nlspsettings")
  if lsp_settings_status_ok then
    lsp_settings.setup(opts)
  end
end

function M.get_common_opts()
  return {
    on_attach = M.common_on_attach,
    on_init = M.common_on_init,
    on_exit = M.common_on_exit,
    capabilities = M.common_capabilities(),
  }
end

function M.setup()
  local lsp_status_ok, _ = pcall(require, "lspconfig")
  if not lsp_status_ok then
    return
  end

  for _, sign in ipairs(lsp_config.diagnostics.signs.values) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = sign.name })
  end

  require("lsp.handlers").setup()

  if not IsDirectory(lsp_config.templates_dir) then
    require("lsp.templates").generate_templates()
  end

  bootstrap_nlsp({
    config_home = Path(vim.fn.stdpath("config"), "lsp-settings"),
    append_default_schemas = true,
  })

  require("lsp.null-ls").setup()

  function M.enable_format_on_save()
    autocmd("format_on_save",
      "BufWritePre * lua vim.lsp.buf.formatting()"
    )
    vim.notify("Enabled format on save")
  end

  function M.disable_format_on_save()
    M.remove_augroup("format_on_save")
    vim.notify("Disabled format on save")
  end

  function M.toggle_format_on_save()
    if vim.fn.exists "#format_on_save#BufWritePre" == 0 then
      M.enable_format_on_save()
    else
      M.disable_format_on_save()
    end
  end

  function M.remove_augroup(name)
    if vim.fn.exists("#" .. name) == 1 then
      vim.cmd("au! " .. name)
    end
  end

  vim.cmd([[command! Format execute "lua vim.lsp.buf.formatting()"]])
  vim.cmd([[command! LspToggleAutoFormat execute 'lua require("user.lsp.handlers").toggle_format_on_save()']])
end

return M
