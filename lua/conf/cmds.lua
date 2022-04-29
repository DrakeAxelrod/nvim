local legendary = prequire("legendary")
if not legendary then
  return
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
  if vim.fn.exists("#format_on_save#BufWritePre") == 0 then
    local opts = {
      pattern = "<buffer>",
      timeout = "1000",
    }
    enable_format_on_save(opts)
  else
    disable_format_on_save()
  end
end

legendary.bind_commands({
  { ":EnableFormatOnSave", enable_format_on_save, description = "Enable format on save" },
  { ":DisableFormatOnSave", disable_format_on_save, description = "Disable format on save" },
  { ":ToggleFormatOnSave", toggle_format_on_save, description = "Toggle format on save" },
  { ":LspAddToWorkspaceFolder", vim.lsp.buf.add_workspace_folder, description = "Add to workspace folder" },
  { ":LspListWorkspaceFolders", vim.lsp.buf.list_workspace_folders, description = "List workspace folders" },
  { ":LspRemoveWorkspaceFolder", vim.lsp.buf.remove_workspace_folder, description = "Remove workspace folder" },
  { ":LspWorkspaceSymbol", vim.lsp.buf.workspace_symbol, description = "Workspace symbol" },
  { ":LspDocumentSymbol", vim.lsp.buf.document_symbol, description = "Document symbol" },
  { ":LspReferences", vim.lsp.buf.references, description = "References" },
  { ":LspClearReferences", vim.lsp.buf.clear_references, description = "Clear references" },
  { ":LspCodeAction", vim.lsp.buf.code_action, description = "Code action" },
  { ":LspRangeCodeAction", vim.lsp.buf.range_code_action, description = "Range code action" },
  { ":LspCodeLensRefresh", vim.lsp.codelens.refresh, description = "Code lens refresh" },
  { ":LspCodeLensRun", vim.lsp.codelens.run, description = "Code lens run" },
  { ":LspDeclaration", vim.lsp.buf.declaration, description = "Declaration" },
  { ":LspDefinition", vim.lsp.buf.definition, description = "Definition" },
  { ":LspTypeDefinition", vim.lsp.buf.type_definition, description = "Type definition" },
  { ":LspDocumentHighlight", vim.lsp.buf.document_highlight, description = "Document highlight" },
  { ":LspImplementation", vim.lsp.buf.implementation, description = "Implementation" },
  { ":LspIncomingCalls", vim.lsp.buf.incoming_calls, description = "Incoming" },
  { ":LspOutgoingCalls", vim.lsp.buf.outgoing_calls, description = "Outgoing" },
  { ":LspFormatting", vim.lsp.buf.formatting, description = "Formatting" },
  { ":LspRangeFormatting", vim.lsp.buf.range_formatting, description = "Range formatting" },
  { ":LspFormattingSync", vim.lsp.buf.formatting_sync, description = "Formatting sync" },
  { ":LspHover", vim.lsp.buf.hover, description = "Hover" },
  { ":LspRename", vim.lsp.buf.rename, description = "Rename" },
  { ":LspSignatureHelp", vim.lsp.buf.signature_help, description = "Signature help" },
})

legendary.bind_autocmds({
  {
    { "BufWinEnter" },
    ":checktime",
    opts = { pattern = "*" }
  },
  {
    { "FileType" },
    [[:nnoremap <silent> <buffer> q :close<CR>]],
    opts = {
      pattern = { "qf", "help", "man", "null-ls-info", "lspinfo", "lsp-installer" },
    },
  },
  {
    { "FileType" },
    [[:set nobuflisted]],
    opts = {
      pattern = { "qf" },
    },
  },
  {
    { "FileType" },
    function()
       vim.b.miniindentscope_disable = true
       vim.b.minicursorword_disable = true
    end,
    opts = {
      pattern = { "starter", "Telescope", "aerial", "NvimTree", "man", "help", "qf" },
    },
  },
  -- {
  --   { "BufEnter" },
  --   function()
  --     local bufname = vim.api.nvim_buf_get_name(0)
  --     if bufname == "" then
  --       vim.opt.laststatus = 0
  --       vim.opt.laststatus = 0
  --     else
  --       vim.opt.laststatus = 3
  --       vim.opt.showtabline = 1
  --     end
  --   end,
  --   opts = { pattern = "*" }
  -- },
  {
    { "TermOpen" },
    function()
      vim.cmd([[:setlocal listchars= nonumber norelativenumber]])
      vim.cmd([[:startinsert]])
      vim.b.miniindentscope_disable = true
    end,
    opts = { pattern = "*" }
  },
  {
    { "TermClose" },
    [[:call feedkeys("\<cr>")]],
    opts = {
      pattern = "term://*",
    }
  },
  {
    { "VimResized" },
    [[:tabdo wincmd =]],
    opts = {
      pattern = "*",
    }
  },
  {
    { "TextYankPost" },
    [[:lua vim.highlight.on_yank({higroup = "Search", timeout = 300})]],
    opts = {
      pattern = "*",
    }
  }
})

-- nvim_set_option_value({name}, {value}, {*opts})
--                 Sets the value of an option. The behavior of this function
--                 matches that of :set: for global-local options, both the
--                 global and local value are set unless otherwise specified with
--                 {scope}.
--                 Parameters:
--                     {name}   Option name
--                     {value}  New option value
--                     {opts}   Optional parameters
--                              • scope: One of 'global' or 'local'. Analogous to
--                              ╎ :setglobal and :setlocal, respectively.

-- vim.api.nvim_add_user_command("command! MiniStarter :lua require("mini.starter").open()")
