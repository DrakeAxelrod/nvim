return function()
  local odp = prequire("onedarkpro")

  if not odp then
    return
  end

  local colors = vim.theme.colors

  odp.setup({
    -- dark_theme = "onedark_vivid", -- The default dark theme
    -- light_theme = "onelight", -- The default light theme
    caching = false, -- Use caching for the theme?
    cache_path = vim.fn.expand(path.joincache("onedarkpro")), -- The path to the cache directory
    colors = {}, -- Override default colors by specifying colors for 'onelight' or 'onedark' themes
    highlights = {
      CursorLineNr = { guibg = colors.bg, fg = colors.purple },
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
      transparency = true, -- Use a transparent background?
      terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
      window_unfocused_color = false, -- When the window is out of focus, change the normal background?
    },
  })
  vim.cmd [[colorscheme onedark_vivid]]
end
