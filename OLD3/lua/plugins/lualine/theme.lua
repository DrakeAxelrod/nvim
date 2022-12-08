local c = require("theme.colors")

local M = {}

local style = function(fg, bg, gui)
  return { fg = fg, bg = bg, gui = gui }
end

M.normal = {
  a = style(c.bg, c.blue, "bold"),
  b = style(c.fg, c.black, "bold"),
  c = style(c.fg, c.black, "bold"),
  x = style(c.fg, c.black, "bold"),
  y = style(c.fg, c.black, "bold"),
  z = style(c.bg, c.blue, "bold"),
}

M.insert = {
  a = style(c.bg, c.green, "bold"),
  b = style(c.fg, c.black, "bold"),
  c = style(c.fg, c.black, "bold"),
  x = style(c.fg, c.black, "bold"),
  y = style(c.fg, c.black, "bold"),
  z = style(c.bg, c.green, "bold"),
}

M.replace = {
  a = style(c.bg, c.red, "bold"),
  b = style(c.fg, c.black, "bold"),
  c = style(c.fg, c.black, "bold"),
  x = style(c.fg, c.black, "bold"),
  y = style(c.fg, c.black, "bold"),
  z = style(c.bg, c.red, "bold"),
}

M.visual = {
  a = style(c.bg, c.yellow, "bold"),
  b = style(c.fg, c.black, "bold"),
  c = style(c.fg, c.black, "bold"),
  x = style(c.fg, c.black, "bold"),
  y = style(c.fg, c.black, "bold"),
  z = style(c.bg, c.yellow, "bold"),
}

M.command = {
  a = style(c.bg, c.magenta, "bold"),
  b = style(c.fg, c.black, "bold"),
  c = style(c.fg, c.black, "bold"),
  x = style(c.fg, c.black, "bold"),
  y = style(c.fg, c.black, "bold"),
  z = style(c.bg, c.magenta, "bold"),
}

M.terminal = {
  a = style(c.bg, c.cyan, "bold"),
  b = style(c.fg, c.black, "bold"),
  c = style(c.fg, c.black, "bold"),
  x = style(c.fg, c.black, "bold"),
  y = style(c.fg, c.black, "bold"),
  z = style(c.bg, c.cyan, "bold"),
}

return M
