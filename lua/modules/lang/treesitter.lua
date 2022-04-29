-- https://github.com/nvim-treesitter/nvim-treesitter
-- https://github.com/p00f/nvim-ts-rainbow
-- https://github.com/JoosepAlviste/nvim-ts-context-commentstring
return function()
  local ok, ts = pcall(require, "nvim-treesitter.configs")
  if not ok then
    return
  end
  ts.setup({
    ensure_installed = { "lua" }, --"all", -- one of "all" or a list of languages
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
      -- use_languagetree = true,
      enable = true, -- false will disable the whole extension
      -- disable = { "css", "html" }, -- list of language that will be disabled
      disable = { "css", "latex" }, -- list of language that will be disabled
      additional_vim_regex_highlighting = true,
    },
    -- incremental selection
    incremental_selection = {
      enable = true,
      keymaps = {
        -- init_selection = mapping.plugin.nvim_treesitter.init_selection,
        -- node_incremental = mapping.plugin.nvim_treesitter.node_incremental,
        -- node_decremental = mapping.plugin.nvim_treesitter.node_decremental,
        -- scope_incremental = mapping.plugin.nvim_treesitter.scope_incremental
      }
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
      extended_mode = false, -- Highlight also non-parentheses delimiters, boolean or table: lang -> boolean
      colors = {
        "#efefef",
        "#ECBE7B",
        "#de73ff",
        "#46D9FF",
        "#ff6c6b",
        "#51afef",
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
  local ok_context, context = pcall(require, "treesitter-context")
  if not ok_context then
    return
  end
  context.setup({
    enable = false, -- Enable this plugin (Can be enabled/disabled later via commands)
    throttle = true, -- Throttles plugin updates (may improve performance)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    patterns = { -- Match patterns for TS nodes. These get wrapped to match at word boundaries.
      -- For all filetypes
      -- Note that setting an entry here replaces all other patterns for this entry.
      -- By setting the 'default' entry below, you can control which nodes you want to
      -- appear in the context window.
      -- default = {
      --     'class',
      --     'function',
      --     'method',
      --     -- 'for', -- These won't appear in the context
      --     -- 'while',
      --     -- 'if',
      --     -- 'switch',
      --     -- 'case',
      -- },
      -- Example for a specific filetype.
      -- If a pattern is missing, *open a PR* so everyone can benefit.
      --   rust = {
      --       'impl_item',
      --   },
    },
  })
end
