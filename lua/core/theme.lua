local theme = require("theme")
local c = theme.colors

local default = {
  a = { fg = c.bg, bg = c.fg, gui = "bold" },
  b = { fg = c.bg, bg = c.fg, gui = "bold" },
  c = { fg = c.bg, bg = c.fg, gui = "bold" },
  x = { fg = c.bg, bg = c.fg, gui = "bold" },
  y = { fg = c.bg, bg = c.fg, gui = "bold" },
  z = { fg = c.bg, bg = c.fg, gui = "bold" },
}
theme.statusline.theme.normal = default
theme.statusline.theme.insert = default
theme.statusline.theme.replace = default
theme.statusline.theme.visual = default
theme.statusline.theme.command = default
theme.statusline.theme.terminal = default
theme.statusline.sections = {
  lualine_a = { theme.statusline.comp.mode, "filename" },
  lualine_b = {},
  lualine_c = {},
  lualine_x = {},
  lualine_y = {},
  lualine_z = { "filetype", "location", "progress" },
}
theme.statusline.inactive_sections ={
  lualine_a = {},
  lualine_b = { "branch", "diff", "diagnostics" },
  lualine_c = { "filename" },
  lualine_x = { "encoding", "fileformat", "filetype" },
  lualine_y = { "progress" },
  lualine_z = {"location" },
}

return theme
