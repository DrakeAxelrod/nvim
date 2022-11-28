local components = require("packages.lualine.components")

return {
  {
    "nvim-lualine/lualine.nvim",
    function()
      require("lualine").setup {
        options = {
          icons_enabled = true,
          theme = 'auto',
          component_separators = {},
          section_separators = {},
          disabled_filetypes = {
            statusline = {},
            winbar = {},
          },
          ignore_focus = {},
          always_divide_middle = true,
          globalstatus = true,
          refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
          }
        },
        sections = {
          lualine_a = { components.space },
          lualine_b = { components.mode, components.filename, components.filetype },
          lualine_c = { components.branch, components.diff },
          lualine_x = { components.treesitter, components.diagnostics, components.lsp },
          lualine_y = { components.location, components.progress },
          lualine_z = { components.space },
        },
        inactive_sections = {
          lualine_a = {},
          lualine_b = {},
          lualine_c = {},
          lualine_x = {},
          lualine_y = {},
          lualine_z = {}
        },
        tabline = {},
        winbar = {},
        inactive_winbar = {},
        extensions = {}
      }
    end
  }
}
