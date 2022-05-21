local theme = require("theme")
local c = theme.colors

local style = function(fg, bg, gui)
  return { fg = fg, bg = bg, gui = gui }
end

theme.statusline.theme.normal = {
  a = style(c.bg, c.blue, "bold"),
  b = style(c.fg, c.black, "bold"),
  c = style(c.fg, c.black, "bold"),
  x = style(c.fg, c.black, "bold"),
  y = style(c.fg, c.black, "bold"),
  z = style(c.bg, c.blue, "bold"),
}

theme.statusline.theme.insert = {
  a = style(c.bg, c.green, "bold"),
  b = style(c.fg, c.black, "bold"),
  c = style(c.fg, c.black, "bold"),
  x = style(c.fg, c.black, "bold"),
  y = style(c.fg, c.black, "bold"),
  z = style(c.bg, c.green, "bold"),
}

theme.statusline.theme.replace = {
  a = style(c.bg, c.red, "bold"),
  b = style(c.fg, c.black, "bold"),
  c = style(c.fg, c.black, "bold"),
  x = style(c.fg, c.black, "bold"),
  y = style(c.fg, c.black, "bold"),
  z = style(c.bg, c.red, "bold"),
}

theme.statusline.theme.visual = {
  a = style(c.bg, c.yellow, "bold"),
  b = style(c.fg, c.black, "bold"),
  c = style(c.fg, c.black, "bold"),
  x = style(c.fg, c.black, "bold"),
  y = style(c.fg, c.black, "bold"),
  z = style(c.bg, c.yellow, "bold"),
}

theme.statusline.theme.command = {
  a = style(c.bg, c.magenta, "bold"),
  b = style(c.fg, c.black, "bold"),
  c = style(c.fg, c.black, "bold"),
  x = style(c.fg, c.black, "bold"),
  y = style(c.fg, c.black, "bold"),
  z = style(c.bg, c.magenta, "bold"),
}

theme.statusline.theme.terminal = {
  a = style(c.bg, c.cyan, "bold"),
  b = style(c.fg, c.black, "bold"),
  c = style(c.fg, c.black, "bold"),
  x = style(c.fg, c.black, "bold"),
  y = style(c.fg, c.black, "bold"),
  z = style(c.bg, c.cyan, "bold"),
}

local comp = theme.statusline.comp

theme.statusline.sections = {
  lualine_a = { comp.space },
  lualine_b = { comp.mode, comp.filename, comp.filetype },
  lualine_c = { comp.branch, comp.diff },
  lualine_x = { comp.treesitter, comp.diagnostics, comp.lsp },
  lualine_y = { comp.location, comp.progress },
  lualine_z = { comp.space },
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
