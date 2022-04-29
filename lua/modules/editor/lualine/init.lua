local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

local theme = require("modules.editor.lualine.theme")
local components = require("modules.editor.lualine.components")

local cfg = {
  options = {
    icons_enabled = true,
    theme = theme(),
    globalstatus = true,
    always_divide_middle = true,
    component_separators = {
      left = "",
      right = "",
    },
    section_separators = {
      left = "",
      right = "",
    },
    disabled_filetypes = {
      "NvimTree",
      "terminal",
      "alpha",
      "startify",
      "Startup"
    },
  },
  sections = {
    lualine_a = {
      components.mode,
      components.filename,
    },
    lualine_b = {
      components.diagnostics,
    },
    lualine_c = {
    },
    lualine_x = {
      components.diff,
      components.branch,
      -- components.lsp,
      components.treesitter,
    },
    lualine_y = {
      components.spaces,
      components.encoding,
      components.filetype,
    },
    lualine_z = {
      components.location,
      components.progress,
    },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_d = {},
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}

lualine.setup(cfg)
-- lualine.setup()

vim.opt.laststatus = 3
