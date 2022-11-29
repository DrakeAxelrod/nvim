return {
  -- {
  --   "rafamadriz/neon",
  --   function()
  --     vim.g.neon_style = "default" -- There's three options to choose from, default, doom, dark and light
  --     vim.g.neon_italic_comment = true -- Italic text for comments
  --     vim.g.neon_italic_keyword = false -- Applies to conditionals and keywords like for, do, while, loops etc.
  --     vim.g.neon_italic_boolean = false -- true and false
  --     vim.g.neon_italic_function = false -- Applies to function (calls and definitions), method (calls and definitions) and built-in functions.
  --     vim.g.neon_italic_variable = false -- Applies to variable names that are defined by the languages, like this or self. And any variable name that does not have another highlight group.
  --     vim.g.neon_bold = false -- Applies to error and warning messages, functions (calls and definitions), lsp virtual text, etc.
  --     vim.g.neon_transparent = false -- Applies no background color to certain highlight groups.
  --     vim.cmd[[colorscheme neon]]
  --   end
  -- },
  {
    "NTBBloodbath/doom-one.nvim",
    setup = function()
      -- Add color to cursor
      vim.g.doom_one_cursor_coloring = false
      -- Set :terminal colors
      vim.g.doom_one_terminal_colors = true
      -- Enable italic comments
      vim.g.doom_one_italic_comments = false
      -- Enable TS support
      vim.g.doom_one_enable_treesitter = true
      -- Color whole diagnostic text or only underline
      vim.g.doom_one_diagnostics_text_color = false
      -- Enable transparent background
      vim.g.doom_one_transparent_background = false

      -- Pumblend transparency
      vim.g.doom_one_pumblend_enable = false
      vim.g.doom_one_pumblend_transparency = 20

      -- Plugins integration
      vim.g.doom_one_plugin_neorg = true
      vim.g.doom_one_plugin_barbar = false
      vim.g.doom_one_plugin_telescope = false
      vim.g.doom_one_plugin_neogit = true
      vim.g.doom_one_plugin_nvim_tree = true
      vim.g.doom_one_plugin_dashboard = true
      vim.g.doom_one_plugin_startify = true
      vim.g.doom_one_plugin_whichkey = true
      vim.g.doom_one_plugin_indent_blankline = true
      vim.g.doom_one_plugin_vim_illuminate = true
      vim.g.doom_one_plugin_lspsaga = false
    end,
    function()
      vim.cmd "colorscheme doom-one"
    end,
  },
}
