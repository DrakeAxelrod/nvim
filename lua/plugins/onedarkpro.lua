
return {
  "olimorris/onedarkpro.nvim",
  -- enabled = false,
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = {
    highlights = {
      CursorLineNr = { fg = "${purple}", bg = "NONE" }, -- fix bg for CursorLineNr
      -- what transparent set
      -- Tabline = { bg = "${red}", fg = "${blue}"},
      -- Normal = { bg = "NONE" },
      -- Folded = { bg = "NONE" },
      -- SignColumn = { bg = "NONE", fg = "NONE" },
      -- Statusline = { bg = "NONE" },
      -- end of what transparent sets
      -- BufferlineSeparator = { fg = "${red}", bg = "${blue}" },
      -- BufferLineBackground = { bg = "${purple}", fg = "${red}" },
      -- BufferCurrent = { bg = "${red}", fg = "${yellow}" },
      -- TabLineFill = { bg = "${red}", fg = "${blue}" },
      BufferCurrent = {
        fg = "${white}",
        bg = "${black}",
      },
      BufferCurrentIndex = { link = "BufferCurrent" },
      BufferCurrentMod = { fg = "${purple}" },
      BufferCurrentSign = { link = "BufferCurrentMod" },
      BufferCurrentIcon = { link = "BufferCurrentMod" },
      BufferCurrentTarget = {
          bg = "${black}",
          fg = "${blue}",
      },
      BufferVisible = { fg = "${gray}" },
      BufferVisibleIndex = { link = "BufferVisible" },
      BufferVisibleMod = { link = "BufferVisible" },
      BufferVisibleSign = { link = "BufferVisibleMod" },
      BufferVisibleIcon = { link = "BufferVisibleMod" },
      BufferVisibleTarget = { link = "BufferCurrentTarget" },
      BufferInactive = { link = "BufferVisible" }, -- Buffer which is not active
      BufferInactiveIndex = { link = "BufferInactive" },
      BufferInactiveMod = { link = "BufferInactive" },
      BufferInactiveSign = { fg = "${black}" }, -- The inactive sign of a buffer
      BufferInactiveTarget = { link = "BufferCurrentTarget" },
      BufferTabpages = { fg = "${purple}" }, -- The tab page indicator on the right
      BufferTabpageFill = { fg = "${black}" }, -- The sign which marks the end of the bufferline
      Search = { fg = "${black}", bg = "${white}" },
      ["@lsp.type.comment"] = {}
    },
    styles = {
      types = "NONE",
      methods = "NONE",
      numbers = "NONE",
      strings = "NONE",
      comments = "NONE",
      keywords = "NONE",
      constants = "NONE",
      functions = "NONE",
      operators = "NONE",
      variables = "NONE",
      parameters = "NONE",
      conditionals = "NONE",
      virtual_text = "NONE",
    },
    options = {
      bold = true, -- Use bold styles?
      italic = true, -- Use italic styles?
      underline = true, -- Use underline styles?
      undercurl = true, -- Use undercurl styles?

      cursorline = true, -- Use cursorline highlighting?
      transparency = true, -- Use a transparent background?
      terminal_colors = true, -- Use the theme's colors for Neovim's :terminal?
      window_unfocused_color = true, -- When the window is out of focus, change the normal background?
    },
  },
  -- config = function(LazyPlugin, opts)
  --   local odp = require("onedarkpro")
  --   odp.setup(opts)
  --   vim.cmd [[colorscheme onedark_vivid]]
  -- end
}
