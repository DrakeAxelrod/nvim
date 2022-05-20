-- local lush = require("lush")
local M = {}
-- M.lush = require("lush")
local lush = require("theme.spec")
M.lush = lush.lush
M.spec = lush.theme
M.hsl = lush.hsl
M.hsluv = lush.hsluv
M.icons = require("theme.icons")
M.statusline = require("theme.statusline")
M.colors = {
  bg = M.spec.Normal.bg,
  fg = M.spec.Normal.fg,
  red = M.spec.ErrorMsg.fg,
  yellow = M.spec.WarningMsg.fg,
  green = M.spec.String.fg,
  blue = M.spec.Search.fg,
  magenta = M.spec.SpellRare.fg,
  cyan = M.spec.Ignore.fg,
  white = M.spec.Normal.fg,
  black = M.spec.Normal.bg,
}

function M:init()
  self.lush(self.spec)
  self.statusline:init()
end

return M
