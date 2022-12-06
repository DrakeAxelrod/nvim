-- bg = "#282c34",
-- bg_statusline = "#22252C",
-- black = "#282c34",
-- blue = "#61afef",
-- color_column = "#2d313b",
-- comment = "#7f848e",
-- cursorline = "#2d313b",
-- cyan = "#56b6c2",
-- diff_add = "#003e4a",
-- diff_delete = "#501b20",
-- diff_text = "#005869",
-- fg = "#abb2bf",
-- fg_gutter = "#3D4148",
-- fg_gutter_inactive = "#abb2bf",
-- float_bg = "#22252C",
-- gray = "#5c6370",
-- green = "#98c379",
-- highlight = "#e2be7d",
-- indentline = "#373B42",
-- light = false,
-- name = "onedark",
-- none = "NONE",
-- orange = "#d19a66",
-- purple = "#c678dd",
-- red = "#e06c75",
-- selection = "#414858",
-- virtual_text_error = "#E9989E",
-- virtual_text_hint = "#78C5CE",
-- virtual_text_information = "#90C7F4",
-- virtual_text_warning = "#EDD3A3",
-- white = "#abb2bf",
-- yellow = "#e5c07b",

return function()
  local odp = require("onedarkpro")
  local colors = odp.get_colors()
  odp.setup {
    dark_theme = "onedark_vivid", -- The default dark theme
    light_theme = "onelight", -- The default light theme
    caching = false, -- Use caching for the theme?
    cache_path = vim.fn.expand(vim.fn.stdpath "cache" .. "/onedarkpro/"), -- The path to the cache directory
    colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
    highlights = {
      WhichKeyFloat = { bg = colors.bg },
      NoiceLspProgressClient = { bg = colors.none }, -- itle 	Lsp progress client name
      NoiceLspProgressSpinner = { bg = colors.none }, -- Constant 	Lsp progress spinner
      NoiceLspProgressTitle = { bg = colors.none },
      NormalFloat = { bg = colors.bg, fg = colors.fg },
      FloatBorder = { bg = colors.bg, fg = colors.fg },
      BarbecueSeparator = { fg = colors.white, bg = colors.none },
      TelescopeNormal = {
        bg = colors.bg,
        fg = colors.fg,
      },
      TelescopeBorder = {
        bg = colors.bg,
        fg = colors.fg,
      },
      -- WhichKeyBorder = { fg = colors.fg, bg = colors.none },
    }, -- Override default highlight and/or filetype groups
    filetypes = { -- Override which filetype highlight groups are loaded
      javascript = true,
      lua = true,
      markdown = true,
      php = true,
      python = true,
      ruby = true,
      rust = true,
      toml = true,
      typescript = true,
      typescriptreact = true,
      vue = true,
      yaml = true,
    },
    plugins = { -- Override which plugin highlight groups are loaded
      -- See the Supported Plugins section for a list of available plugins
      -- barbar = false,
    },
    styles = { -- Choose from "bold,italic,underline"
      types = "NONE", -- Style that is applied to types
      numbers = "NONE", -- Style that is applied to numbers
      strings = "NONE", -- Style that is applied to strings
      comments = "NONE", -- Style that is applied to comments
      keywords = "NONE", -- Style that is applied to keywords
      constants = "NONE", -- Style that is applied to constants
      functions = "NONE", -- Style that is applied to functions
      operators = "NONE", -- Style that is applied to operators
      variables = "NONE", -- Style that is applied to variables
      conditionals = "NONE", -- Style that is applied to conditionals
      virtual_text = "NONE", -- Style that is applied to virtual text
    },
    options = {
      bold = true, -- Use bold styles?
      italic = true, -- Use italic styles?
      underline = true, -- Use underline styles?
      undercurl = true, -- Use undercurl styles?

      cursorline = false, -- Use cursorline highlighting?
      transparency = false, -- Use a transparent background?
      terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
      window_unfocused_color = false, -- When the window is out of focus, change the normal background?
    },
  }
end
