return function(lualine)
  local theme = require("modules.editor.lualine.theme")
  local c = require("modules.editor.lualine.components")
  -- settings
  lualine.setup({
      options = {
      icons_enabled = true,
      -- theme = "auto",
      theme = theme(),
      globalstatus = false,
      always_divide_middle = true,
      disabled_filetypes = {
        -- "NvimTree",
        -- "aerial",
        "starter",
        "telescope",
        "packer",
        "terminal",
        "alpha",
        "startify",
      },
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" }
    },
  -- +-------------------------------------------------+
  -- | A | B | C                             X | Y | Z |
  -- +-------------------------------------------------+
    sections = {
      lualine_a = { c.mode },
      lualine_b = { c.filename },
      lualine_c = { c.branch, c.diagnostics },
      --------------
      lualine_x = { c.diff, c.python_env, c.clients, c.treesitter },
      lualine_y = { c.spaces },
      lualine_z = { c.encoding, c.location, c.scrollbar },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {},
      --------------
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  })
end
