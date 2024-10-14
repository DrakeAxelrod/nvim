  --  nvim-scrollbar [scrollbar]
  --  https://github.com/petertriho/nvim-scrollbar
return {
  "petertriho/nvim-scrollbar",
  enabled = false,
  opts = {
    handlers = {
      gitsigns = true, -- gitsigns integration (display hunks)
      ale = true,      -- lsp integration (display errors/warnings)
      search = false,  -- hlslens integration (display search result)
    },
    excluded_filetypes = {
      "cmp_docs",
      "cmp_menu",
      "noice",
      "prompt",
      "TelescopePrompt",
      "alpha",
    },
  },

}
