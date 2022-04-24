-- local global = require("core.global")
local M = {}

function M.symbols_outline()
	require("symbols-outline").setup({
    highlight_hovered_item = true,
    show_guides = true,
    auto_preview = false,
    position = "right",
    width = 30,
    show_numbers = false,
    show_relative_numbers = false,
    show_symbol_details = true,
    keymaps = { -- These keymaps can be a string or a table for multiple keys
      close = { "<Esc>", "q" },
      goto_location = "<Cr>",
      focus_location = "o",
      hover_symbol = "<C-space>",
      toggle_preview = "K",
      rename_symbol = "r",
      code_actions = "a",
    },
    lsp_blacklist = {},
    symbol_blacklist = {},
		preview_bg_highlight = "Float",
    symbols = {
      File = { icon = "", hl = "CmpItemKindFile" },
      Module = { icon = "", hl = "CmpItemKindModule" },
      Namespace = { icon = "", hl = "CmpItemKindModule" },
      Package = { icon = "", hl = "CmpItemKindModule" },
      Class = { icon = " ", hl = "CmpItemKindClass" },
      Method = { icon = "", hl = "CmpItemKindMethod" },
      Property = { icon = "ﰠ", hl = "CmpItemKindProperty" },
      Field = { icon = "ﰠ", hl = "CmpItemKindField" },
      Constructor = { icon = "", hl = "CmpItemKindConstructor" },
      Enum = { icon = "練 ", hl = "CmpItemKindEnum" },
      Interface = { icon = "", hl = "CmpItemKindInterface" },
      Function = { icon = "", hl = "CmpItemKindFunction" },
      Variable = { icon = "", hl = "CmpItemKindVariable" },
      Constant = { icon = " ", hl = "CmpItemKindConstant" },
      String = { icon = "", hl = "TSString" },
      Number = { icon = "", hl = "TSNumber" },
      Boolean = { icon = "蘒", hl = "TSBoolean" },
      Array = { icon = "", hl = "TSKeyword" },
      Object = { icon = "", hl = "TSKeyword" },
      Key = { icon = "", hl = "CmpItemKeyword" },
      Null = { icon = "NULL", hl = "TSKeyword" },
      EnumMember = { icon = "", hl = "CmpItemKindEnumMember" },
      Struct = { icon = "", hl = "CmpItemKindStruct" },
      Event = { icon = "", hl = "CmpItemKindEvent" },
      Operator = { icon = "", hl = "CmpItemKindOperator" },
      TypeParameter = { icon = "", hl = "CmpItemKindTypeParameter" },
    },
	})
end

function M.nvim_treesitter()
  local ok, ts = pcall(require, "nvim-treesitter.configs")
  if not ok then
    return
  end
  ts.setup({
    ensure_installed = {}, --"all", -- one of "all" or a list of languages
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
      -- use_languagetree = true,
      enable = true, -- false will disable the whole extension
      -- disable = { "css", "html" }, -- list of language that will be disabled
      disable = { "css", "latex" }, -- list of language that will be disabled
      additional_vim_regex_highlighting = true,
    },
    indent = {
      enable = {
        "javascriptreact",
      },
      disable = { "css", "yaml" },
    },
    playground = {
      enable = true,
      disable = {},
      updatetime = 25,
      persist_queries = false,
      keybindings = {
        toggle_query_editor = "o",
        toggle_hl_groups = "i",
        toggle_injected_languages = "t",
        toggle_anonymous_nodes = "a",
        toggle_language_display = "I",
        focus_language = "f",
        unfocus_language = "F",
        update = "R",
        goto_node = "<cr>",
        show_help = "?",
      },
    },
    autopairs = {
      enable = true,
    },
    autotag = {
      enable = true,
      disable = { "xml" },
    },
    rainbow = {
      enable = true,
      extended_mode = true, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      colors = {
        "#d7dae0",
        "#4cd1e0",
        "#f0a45d",
        "#de73ff",
        "#4aa5f0",
        "#a5e075",
      },
      disable = { "html" },
    },
    context_commentstring = {
      enable = true,
      config = {
        -- Languages that have a single comment style
        typescript = "// %s",
        css = "/* %s */",
        scss = "/* %s */",
        html = "<!-- %s -->",
        svelte = "<!-- %s -->",
        vue = "<!-- %s -->",
        json = "",
        javascriptreact = {
          style_element = "{/*%s*/}",
        },
      },
    },
    textobjects = {
      swap = {
        enable = false,
        -- swap_next = textobj_swap_keymaps,
      },
      -- move = textobj_move_keymaps,
      select = {
        enable = false,
        -- keymaps = textobj_sel_keymaps,
      },
    },
    textsubjects = {
      enable = false,
      keymaps = {
        ["."] = "textsubjects-smart",
        [";"] = "textsubjects-big" },
    },
  })
end

function M.nvim_lspconfig()
  local ok, _ = pcall(require, "lspconfig")
  if not ok then
    return
  end
	require("langs.utils").setup_diagnostic()
	require("langs.diagnosticls").init_diagnosticls()
	-- LSP buf
	vim.cmd("command! LspAddToWorkspaceFolder lua vim.lsp.buf.add_workspace_folder()")
	vim.cmd("command! LspListWorkspaceFolders lua vim.lsp.buf.list_workspace_folders()")
	vim.cmd("command! LspRemoveWorkspaceFolder lua vim.lsp.buf.remove_workspace_folder()")
	vim.cmd("command! LspWorkspaceSymbol lua vim.lsp.buf.workspace_symbol()")
	vim.cmd("command! LspDocumentSymbol lua vim.lsp.buf.document_symbol()")
	vim.cmd("command! LspReferences lua vim.lsp.buf.references()")
	vim.cmd("command! LspClearReferences lua vim.lsp.buf.clear_references()")
	vim.cmd("command! LspCodeAction lua vim.lsp.buf.code_action()")
	vim.cmd("command! LspRangeCodeAction lua vim.lsp.buf.range_code_action()")
	vim.cmd("command! LspCodeLensRefresh lua vim.lsp.codelens.refresh()")
	vim.cmd("command! LspCodeLensRun lua vim.lsp.codelens.run()")
	vim.cmd("command! LspDeclaration lua vim.lsp.buf.declaration()")
	vim.cmd("command! LspDefinition lua vim.lsp.buf.definition()")
	vim.cmd("command! LspTypeDefinition lua vim.lsp.buf.type_definition()")
	vim.cmd("command! LspDocumentHighlight lua vim.lsp.buf.document_highlight()")
	vim.cmd("command! LspImplementation lua vim.lsp.buf.implementation()")
	vim.cmd("command! LspIncomingCalls lua vim.lsp.buf.incoming_calls()")
	vim.cmd("command! LspOutgoingCalls lua vim.lsp.buf.outgoing_calls()")
	vim.cmd("command! LspFormatting lua vim.lsp.buf.formatting()")
	vim.cmd("command! LspRangeFormatting lua vim.lsp.buf.range_formatting()")
	vim.cmd("command! LspFormattingSync lua vim.lsp.buf.formatting_sync()")
	vim.cmd("command! LspHover lua vim.lsp.buf.hover()")
	vim.cmd("command! LspRename lua vim.lsp.buf.rename()")
	vim.cmd("command! LspSignatureHelp lua vim.lsp.buf.signature_help()")
	-- LSP diagnostic
	vim.cmd("command! LspGoToNext lua require('langs.utils.diagnostics').goto_next()")
	vim.cmd("command! LspGoToPrev lua require('langs.utils.diagnostics').goto_prev()")
	-- Virtual text toggle
	vim.cmd("command! LspVirtualTextToggle lua require('langs.utils').toggle_virtual_text()")
end

function M.nvim_lsp_installer()
  local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
  if not ok then
    return
  end
	lsp_installer.settings({
		ui = {
			icons = {
				server_installed = "",
				server_pending = "",
				server_uninstalled = "",
			},
		},
	})
end

function M.fidget()
  local ok, fidget = pcall(require, "fidget")
  if not ok then
    return
  end
  fidget.setup({
    text = {
        spinner = "pipe", -- animation shown when tasks are ongoing
        done = "✔", -- character shown when all tasks are complete
        commenced = "Started", -- message shown when task starts
        completed = "Completed", -- message shown when task completes
      },
      align = {
        bottom = true, -- align fidgets along bottom edge of buffer
        right = true, -- align fidgets along right edge of buffer
      },
      timer = {
        spinner_rate = 125, -- frame rate of spinner animation, in ms
        fidget_decay = 2000, -- how long to keep around empty fidget, in ms
        task_decay = 1000, -- how long to keep around completed task, in ms
      },
      window = {
        relative = "win", -- where to anchor, either "win" or "editor"
        blend = 0, -- &winblend for the window
        zindex = nil, -- the zindex value for the window
      },
      fmt = {
        leftpad = true, -- right-justify text in fidget box
        stack_upwards = true, -- list of tasks grows upwards
        max_width = 0, -- maximum width of the fidget box
        fidget = -- function to format fidget title
        function(fidget_name, spinner)
          return string.format("%s %s", spinner, fidget_name)
        end,
        task = -- function to format each task line
        function(task_name, message, percentage)
          return string.format(
            "%s%s [%s]",
            message,
            percentage and string.format(" (%s%%)", percentage) or "",
            task_name
          )
        end,
      },
      sources = { -- Sources to configure
        ['*'] = { -- Name of source
          ignore = false, -- Ignore notifications from this source
        },
      },
      debug = {
        logging = false, -- whether to enable logging, for debugging
        strict = false, -- whether to interpret LSP strictly
      },
  })
  -- vim.cmd([[highlight FidgetTitle ctermfg=110 guifg=#6cb6eb]])
  -- vim.cmd([[highlight FidgetBackground ctermfg=110 guifg=#6cb6eb]])
end

return M
