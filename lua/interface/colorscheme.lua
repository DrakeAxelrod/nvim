return {
  {
    "rose-pine/neovim",
    function()
      require("rose-pine").setup {
        --- @usage 'main' | 'moon'
        dark_variant = "moon",
        bold_vert_split = false,
        dim_nc_background = false,
        disable_background = false,
        disable_float_background = false,
        disable_italics = false,
        --- @usage string hex value or named color from rosepinetheme.com/palette
        groups = {
          background = "base",
          panel = "surface",
          border = "highlight_med",
          comment = "muted",
          link = "iris",
          punctuation = "subtle",
          error = "love",
          hint = "iris",
          info = "foam",
          warn = "gold",
          headings = {
            h1 = "iris",
            h2 = "foam",
            h3 = "rose",
            h4 = "gold",
            h5 = "pine",
            h6 = "foam",
          },
          -- or set all headings at once
          -- headings = 'subtle'
        },
        -- Change specific vim highlight groups
        highlight_groups = {
          ColorColumn = { bg = "rose" },
        },
      }
      vim.cmd[[colorscheme rose-pine]]
    end,
  },
  { "Mofiqul/vscode.nvim", disable = true },
  { "rktjmp/lush.nvim", disable = true },
  -- {
  --   "NTBBloodbath/doom-one.nvim",
  --   setup = function()
  --     -- Add color to cursor
  --     vim.g.doom_one_cursor_coloring = false
  --     -- Set :terminal colors
  --     vim.g.doom_one_terminal_colors = true
  --     -- Enable italic comments
  --     vim.g.doom_one_italic_comments = false
  --     -- Enable TS support
  --     vim.g.doom_one_enable_treesitter = true
  --     -- Color whole diagnostic text or only underline
  --     vim.g.doom_one_diagnostics_text_color = false
  --     -- Enable transparent background
  --     vim.g.doom_one_transparent_background = false

  --     -- Pumblend transparency
  --     vim.g.doom_one_pumblend_enable = false
  --     vim.g.doom_one_pumblend_transparency = 20

  --     -- Plugins integration
  --     vim.g.doom_one_plugin_neorg = true
  --     vim.g.doom_one_plugin_barbar = false
  --     vim.g.doom_one_plugin_telescope = false
  --     vim.g.doom_one_plugin_neogit = true
  --     vim.g.doom_one_plugin_nvim_tree = true
  --     vim.g.doom_one_plugin_dashboard = true
  --     vim.g.doom_one_plugin_startify = true
  --     vim.g.doom_one_plugin_whichkey = true
  --     vim.g.doom_one_plugin_indent_blankline = true
  --     vim.g.doom_one_plugin_vim_illuminate = true
  --     vim.g.doom_one_plugin_lspsaga = false
  --   end,
  --   function()
  --     vim.cmd "colorscheme doom-one"
  --   end,
  -- },
}
