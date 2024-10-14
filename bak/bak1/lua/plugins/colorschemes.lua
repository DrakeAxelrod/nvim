
--[[ https://github.com/olimorris/onedarkpro.nvim

The colorscheme comes with some useful commands:

:OnedarkproCache force generate new cache files for the themes (you won't often need this)
:OnedarkproClean removes existing cache files for the themes
:OnedarkproColors output all of the current themes colors to a scratch buffer

themes:

- onedark
- onelight
- onedark_vivid
- onedark_dark

]]

return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000, -- Ensure it loads first
    opts = {
      style = "storm", -- The theme comes in three styles, `storm`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = false, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "storm", -- style for sidebars, see below
        floats = "storm", -- style for floating windows
      },
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style. Number between 0 and 1, from dull to vibrant colors
      dim_inactive = false, -- dims inactive windows
      lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold

      --- You can override specific color groups to use other groups or a hex color
      --- function will be called with a ColorScheme table
      ---@param colors ColorScheme
      -- on_colors = function(colors) end,

      --- You can override specific highlights to use other groups or a hex color
      --- function will be called with a Highlights and ColorScheme table
      ---@param highlights tokyonight.Highlights
      ---@param colors ColorScheme
      -- on_highlights = function(highlights, colors) end,

      cache = true, -- When set to true, the theme will be cached for better performance

      ---@type table<string, boolean|{enabled:boolean}>
      plugins = {
        -- enable all plugins when not using lazy.nvim
        -- set to false to manually enable/disable plugins
        -- all = package.loaded.lazy == nil,
        -- uses your plugin manager to automatically enable needed plugins
        -- currently only lazy.nvim is supported
        auto = true,
        -- add any plugins here that you want to enable
        -- for all possible plugins, see:
        --   * https://github.com/folke/tokyonight.nvim/tree/main/lua/tokyonight/groups
        -- telescope = true,
      },
    },
    -- config = function(_, opts)

    -- end
  },
  {
    "olimorris/onedarkpro.nvim",
    -- enabled = false,
    lazy = true,
    priority = 1000, -- Ensure it loads first
    opts = function()
      local odp = require("onedarkpro.helpers")
      local diagnostics = {
        -- red =
        yellow = odp.lighten("yellow", 7, "onedark_vivid"),
        blue = odp.lighten("blue", 7, "onedark_vivid"),
        cyan = odp.lighten("cyan", 7, "onedark_vivid"),
      }
      return {
        -- options = {
        --   transparency = true,
        -- }
        dark_theme = "onedark_vivid", -- The default dark theme
        light_theme = "onelight", -- The default light theme
        caching = false, -- Use caching for the theme?
        cache_path = vim.fn.expand(vim.fn.stdpath "cache" .. "/onedarkpro/"), -- The path to the cache directory
        colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
        highlights = {
          CursorLineNr = { fg = "${purple}", bg = "NONE" },
          Search = { fg = "${black}", bg = "${white}" },
          -- DiagnosticVirtualTextErrorxxx cterm=bold,italic gui=bold,italic guifg=#f38495
          -- DiagnosticVirtualTextWarnxxx cterm=bold,italic gui=bold,italic guifg=#edd2a1
          -- DiagnosticVirtualTextInfoxxx cterm=bold,italic gui=bold,italic guifg=#90c7f4
          -- DiagnosticVirtualTextHintxxx cterm=bold,italic gui=bold,italic guifg=#4fcfd8
          -- DiagnosticVirtualTextError = { fg = "${red}", bg = "NONE", style = "italic,thin", blend = 100 },
          -- DiagnosticVirtualTextWarn = { fg = "${yellow}10", bg = "NONE", style = "italic,thin", blend = 100  },
          -- DiagnosticVirtualTextInfo = { fg = "${blue}", bg = "NONE", style = "italic,thin", blend = 100  },
          -- DiagnosticVirtualTextHint = { fg = "${cyan}", bg = "NONE", style = "italic,thin", blend = 100  },
          -- BarbecueSeparator = { fg = "${white}", bg = "NONE" },
          -- Normal = { fg = "${white}", bg = "NONE" },
          -- Folded = { fg = "${white}", bg = "NONE" },
          -- SignColumn = { fg = "${white}", bg = "NONE" },
          -- Statusline = { fg = "${white}", bg = "NONE" },
          -- Tabline = { fg = "${white}", bg = "NONE" },
        }, -- Override default highlight and/or filetype groups
        -- highlights = {
        --   CursorLineNr = { guibg = colors.bg, fg = colors.purple },
        --   WhichKeyFloat = { bg = colors.bg },
        --   NoiceLspProgressClient = { bg = colors.none }, -- itle 	Lsp progress client name
        --   NoiceLspProgressSpinner = { bg = colors.none }, -- Constant 	Lsp progress spinner
        --   NoiceLspProgressTitle = { bg = colors.none },
        --   NormalFloat = { bg = colors.bg, fg = colors.fg },
        --   FloatBorder = { bg = colors.bg, fg = colors.fg },
        --   BarbecueSeparator = { fg = colors.white, bg = colors.none },
        --   TelescopeNormal = {
        --     bg = colors.bg,
        --     fg = colors.fg,
        --   },
        --   TelescopeBorder = {
        --     bg = colors.bg,
        --     fg = colors.fg,
        --   },
        --   -- WhichKeyBorder = { fg = colors.fg, bg = colors.none },
        -- }, -- Override default highlight and/or filetype groups
        -- filetypes = { -- Override which filetype highlight groups are loaded
        --   javascript = true,
        --   lua = true,
        --   markdown = true,
        --   php = true,
        --   python = true,
        --   ruby = true,
        --   rust = true,
        --   toml = true,
        --   typescript = true,
        --   typescriptreact = true,
        --   vue = true,
        --   yaml = true,
        -- },
        plugins = { -- Override which plugin highlight groups are loaded
          -- See the Supported Plugins section for a list of available plugins
          -- cursorline = false
        },
        styles = { -- Choose from "bold,italic,underline"
          types = "italic", -- Style that is applied to types
          numbers = "NONE", -- Style that is applied to numbers
          strings = "NONE", -- Style that is applied to strings
          comments = "italic", -- Style that is applied to comments
          keywords = "bold", -- Style that is applied to keywords
          constants = "bold", -- Style that is applied to constants
          functions = "NONE", -- Style that is applied to functions
          operators = "NONE", -- Style that is applied to operators
          variables = "NONE", -- Style that is applied to variables
          conditionals = "NONE", -- Style that is applied to conditionals
          virtual_text = "italic", -- Style that is applied to virtual text
          -- virtual_text = "bold,italic,blend", -- Style that is applied to virtual text
        },
        options = {
          bold = true, -- Use bold styles?
          italic = true, -- Use italic styles?
          underline = true, -- Use underline styles?
          undercurl = true, -- Use undercurl styles?

          cursorline = false, -- Use cursorline highlighting?
          transparency = true, -- Use a transparent background?
          terminal_colors = false, -- Use the theme's colors for Neovim's :terminal?
          window_unfocused_color = false, -- When the window is out of focus, change the normal background?
        },
      }
    end,
    -- config = function()
    --   themes = {
    --     default = "onedark",
    --     light = "onelight",
    --     vivid = "onedark_vivid",
    --     dark = "onedark_dark",
    --   }
    --   -- require("onedarkpro").setup({
    --   --   options = {
    --   --     transparency = true,
    --   --   }
    --   -- })
    --   -- vim.cmd("colorscheme " .. themes.vivid)
    --   vim.colorscheme(themes.vivid)
    -- end,
  }
}