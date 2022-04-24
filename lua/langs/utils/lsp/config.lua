local skipped_servers = {
  "angularls",
  "ansiblels",
  "ccls",
  "csharp_ls",
  "cssmodules_ls",
  "denols",
  "ember",
  "emmet_ls",
  "eslint",
  "eslintls",
  "golangci_lint_ls",
  "graphql",
  "jedi_language_server",
  "ltex",
  "ocamlls",
  "phpactor",
  "psalm",
  "pylsp",
  "quick_lint_js",
  "rome",
  "reason_ls",
  "scry",
  "solang",
  "solidity_ls",
  "sorbet",
  "sourcekit",
  "sourcery",
  "spectral",
  "sqlls",
  "sqls",
  "stylelint_lsp",
  "tailwindcss",
  "tflint",
  "verible",
  "vuels",
}

local skipped_filetypes = { "markdown", "rst", "plaintext" }
local icons = GetIcons()

local cfg = {
  templates_dir = Path(vim.fn.stdpath("data"), "site", "after",  "ftplugin"),
  diagnostics = {
    signs = {
      active = true,
      values = {
        { name = "DiagnosticSignError", text = icons.diagnostics.Error },
        { name = "DiagnosticSignWarn", text = icons.diagnostics.Warning },
        { name = "DiagnosticSignHint", text = icons.diagnostics.Hint },
        { name = "DiagnosticSignInfo", text = icons.diagnostics.Information },
      },
    },
    virtual_text = true,
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
          t.message = string.format("%s [%s]", t.message, code):gsub("1. ", "")
        end
        return t.message
      end,
    },
  },
  document_highlight = true,
  code_lens_refresh = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
  },
  on_attach_callback = nil,
  on_init_callback = nil,
  automatic_servers_installation = true,
  automatic_configuration = {
    ---@usage list of servers that the automatic installer will skip
    skipped_servers = skipped_servers,
    ---@usage list of filetypes that the automatic installer will skip
    skipped_filetypes = skipped_filetypes,
  },
  buffer_mappings = {
    normal_mode = {
      ["<space>"] = {
        name = "LSP",
        ["p"] = { [[<cmd>lua require("lsp.extensions.peek").Peek('definition')<CR>]], "Peek definition" },
        ["l"] = {
          [[<cmd>lua require("lsp.handlers").show_line_diagnostics()<CR>]],
          "Show line diagnostics",
        },
        ["K"] = { vim.lsp.buf.hover, "Hover" },
        ["k"] = { vim.lsp.buf.signature_help, "Show Signature Help" },
        ["D"] = { vim.lsp.buf.declaration, "Goto Declaration" },
        ["d"] = { vim.lsp.buf.definition, "Goto Definition" },
        ["R"] = { vim.lsp.buf.references, "Goto References" },
        ["i"] = { vim.lsp.buf.implementation, "Goto Implementation" },
        ["T"] = { vim.lsp.buf.type_definition, "Goto Type Definition" },
        ["f"] = { vim.lsp.buf.formatting, "Formatting" },
        ["c"] = { vim.lsp.buf.code_action, "Code Action" },
        ["n"] = { vim.lsp.buf.rename, "Rename" },
        ["w"] = {
          name = "Workspace",
          ["a"] = { vim.lsp.buf.add_workspace_folder, "Add Workspace Folder" },
          ["r"] = { vim.lsp.buf.remove_workspace_folder, "Remove Workspace Folder" },
          ["l"] = { [[<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>]], "Print Workspace Folders" },
        }
      },
    },
    insert_mode = {},
    visual_mode = {},
  },
  null_ls = {
    setup = {},
    config = {},
  }
}

return cfg
