return function()
  local components = require("plugins.lualine.components")
  -- local theme = require("plugins.lualine.theme")
  require("lualine").setup({
    options = {
      icons_enabled = true,
      -- theme = theme,
      theme = "auto",
      globalstatus = true,
      always_divide_middle = true,
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {
        statusline = {
          "alpha"
        },
        winbar = {},
      },
      ignore_focus = {},
      refresh = {
        statusline = 1000,
        tabline = 1000,
        winbar = 1000,
      },
    },
    sections = {
      lualine_a = {
        components.mode,
      },
      lualine_b = {
        components.branch,
      },
      lualine_c = {
        components.diff,
        components.python_env,
      },
      lualine_x = {
        components.diagnostics,
        components.lsp,
        components.spaces,
        components.filetype,
      },
      lualine_y = { components.location },
      lualine_z = {
        components.progress,
      },
    },
    inactive_sections = {
      lualine_a = {
        components.mode,
      },
      lualine_b = {
        components.branch,
      },
      lualine_c = {
        components.diff,
        components.python_env,
      },
      lualine_x = {
        components.diagnostics,
        components.lsp,
        components.spaces,
        components.filetype,
      },
      lualine_y = { components.location },
      lualine_z = {
        components.progress,
      },
    },
    -- sections = {
    --   lualine_a = { "mode" },
    --   lualine_b = { "branch", "diff", "diagnostics" },
    --   lualine_c = { "filename" },
    --   lualine_x = { "encoding", "fileformat", "filetype" },
    --   lualine_y = { "progress" },
    --   lualine_z = { "location" },
    -- },
    -- inactive_sections = {
    --   lualine_a = {},
    --   lualine_b = {},
    --   lualine_c = { "filename" },
    --   lualine_x = { "location" },
    --   lualine_y = {},
    --   lualine_z = {},
    -- },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = {},
  })
end
