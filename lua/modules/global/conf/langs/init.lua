local global = require("core.global")
local M = {}



function M.nvim_treesitter()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {}, --"all", -- one of "all" or a list of languages
    sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
    ignore_install = { "" }, -- List of parsers to ignore installing
    highlight = {
      enable = true,
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

return M
