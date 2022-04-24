local M = {}
local icons = GetIcons()

local signature_cfg = require("packages.nvim-lspconfig.lsp-signature")
local signature_ok, signature = pcall(require, "lsp_signature")

local nvim_status_ok, nvim_status = pcall(require, "lsp-status")
local status = require("packages.nvim-lspconfig.lsp_status")
status.activate()

local clangd_ok, clangd = pcall(require, "clangd_extensions.config")
if clangd_ok then
  clangd.setup({
      extensions = { inlay_hints = { only_current_line = true, show_variable_name = true } },
    })
end

-- vim.api.nvim_command 'hi link LightBulbFloatWin YellowFloat'
-- vim.api.nvim_command 'hi link LightBulbVirtualText YellowFloat'

M.setup = function()
  local signs = {
    { name = "DiagnosticSignError", text = icons.diagnostics.Error },
    { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
    { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
    { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
  }

  for _, sign in ipairs(signs) do
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
  end

  vim.diagnostic.config({
    -- disable virtual text
    virtual_text = false,
    -- show signs
    signs = {
      active = signs,
    },
    update_in_insert = true,
    underline = true,
    severity_sort = true,
    float = {
      focusable = true,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
    },
  })

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

  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "rounded",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "rounded",
  })

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
  vim.lsp.handlers["window/showMessage"] = require("packages.nvim-lspconfig.extensions.show_message")

  local params = vim.lsp.util.make_position_params()

  vim.lsp.buf_request(0, "textDocument/implementation", params, function(err, result, ctx, config)
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

    vim.lsp.handlers["textDocument/implementation"](err, result, ctx, config)
    vim.cmd [[normal! zz]]
  end)
end

local function lsp_highlight_document(client)
  if client.resolved_capabilities.document_highlight then
    Autocmd("lsp_document_highlight", {
      [[CursorHold <buffer> lua vim.lsp.buf.document_highlight()]],
      [[CursorMoved <buffer> lua vim.lsp.buf.clear_references()]],
      [[CursorHold,CursorHoldI <buffer> lua vim.diagnostic.open_float(0, { scope = "line" })]],
    }, true, true)
  end
  if client.resolved_capabilities.code_lens then
    Autocmd("lsp_document_codelens", {
    [[BufEnter ++once         <buffer> lua require("vim.lsp.codelens").refresh()]],
    [[BufWritePost,CursorHold <buffer> lua require("vim.lsp.codelens").refresh()]]
    }, true, true)
  end
end

local function lsp_keymaps(bufnr)
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc') -- Enable completion triggered by <c-x><c-o>
  pcall(function()
    require("which-key").register({
      ["<space>"] = {
        name = "LSP",
        ["K"] = { vim.lsp.buf.hover, "Hover" },
        ["k"] = { vim.lsp.buf.signature_help, "Signature Help" },
        ["D"] = { vim.lsp.buf.declaration, "Declaration" },
        ["d"] = { vim.lsp.buf.definition, "Definition" },
        ["R"] = { vim.lsp.buf.references, "References" },
        ["i"] = { vim.lsp.buf.implementation, "Implementation" },
        ["T"] = { vim.lsp.buf.type_definition, "Type Definition" },
        ["f"] = { vim.lsp.buf.formatting, "Formatting" },
        ["c"] = { vim.lsp.buf.code_action, "Code Action" },
        ["n"] = { vim.lsp.buf.rename, "Rename" },
        ["w"] = {
          name = "Workspace",
          ["a"] = { vim.lsp.buf.add_workspace_folder, "Add Workspace Folder" },
          ["r"] = { vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder" },
          ["l"] = { print(vim.inspect(vim.lsp.buf.list_workspace_folders())), "Print Workspace Folders" },
        },
      }
      },{
      mode = "n", -- NORMAL mode
      prefix = "g",
      buffer = bufnr, -- Global mappings. Specify a buffer number for buffer local mappings
      silent = true, -- use `silent` when creating keymaps
      noremap = true, -- use `noremap` when creating keymaps
      nowait = true, -- use `nowait` when creating keymaps
    })
  end)
  vim.cmd("command! Format execute 'lua vim.lsp.buf.formatting()'")
end


local filetype_attach = setmetatable({
  go = function(client)
    Autocmd("lsp_buf_format", {
      [[BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()]],
    }, true, true)
  end,
  rust = function()
    -- vim.cmd [[
    --   autocmd BufEnter,BufWritePost <buffer> :lua require('lsp_extensions.inlay_hints').request {aligned = true, prefix = " » "}
    -- ]]
    Autocmd("lsp_buf_format", {
      [[BufWritePre <buffer> :lua vim.lsp.buf.formatting_sync()]]
    }, true, true)
  end,
}, {
  __index = function()
    return function() end
  end,
})


M.on_attach = function(client, bufnr)
  if nvim_status_ok then
    nvim_status.on_attach(client)
  end
  if signature_ok then
    signature.on_attach(signature_cfg, bufnr)
  end

  if client.name == "tsserver" or client.name == "html" or client.name == "jdt.ls" then
    client.resolved_capabilities.document_formatting = false
  end

  if client.name == "jdt.ls" then
    require("jdtls").setup_dap { hotcodereplace = "auto" }
    require("jdtls.dap").setup_dap_main_class_configs()
    vim.lsp.codelens.refresh()
  end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
  -- Attach any filetype specific options to the client
  local filetype = vim.api.nvim_buf_get_option(0, "filetype")
  filetype_attach[filetype](client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = vim.tbl_deep_extend("keep", capabilities, nvim_status.capabilities)
capabilities.textDocument.codeLens = { dynamicRegistration = false }
capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)
-- TODO: check if this is the problem.
capabilities.textDocument.completion.completionItem.insertReplaceSupport = false

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

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

vim.cmd([[command! LspToggleAutoFormat execute 'lua require("user.lsp.handlers").toggle_format_on_save()']])

return M
