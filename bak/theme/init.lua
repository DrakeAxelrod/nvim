local ok, cb = pcall(require, "colorbuddy")
if not ok then
  return
end

local Color, c, Group, g, s = cb.setup()
local b = s.bold
local i = s.italic
local n = s.inverse
local uc = s.undercurl
local ul = s.underline
local r = s.reverse
local sto = s.standout
local no = s.NONE

local colors = require("theme.colors")

-------------------------
-- Vim Terminal Colors --
-------------------------

vim.g.terminal_color_0 = colors.black
vim.g.terminal_color_1 = colors.red
vim.g.terminal_color_2 = colors.green
vim.g.terminal_color_3 = colors.yellow
vim.g.terminal_color_4 = colors.blue
vim.g.terminal_color_5 = colors.magenta
vim.g.terminal_color_6 = colors.cyan
vim.g.terminal_color_7 = colors.white
vim.g.terminal_color_8 = colors.grey
vim.g.terminal_color_9 = colors.light.red
vim.g.terminal_color_10 = colors.light.green
vim.g.terminal_color_11 = colors.light.yellow
vim.g.terminal_color_12 = colors.light.blue
vim.g.terminal_color_13 = colors.light.magenta
vim.g.terminal_color_14 = colors.light.cyan
vim.g.terminal_color_15 = colors.light.white

-------------------------
-- Vim Primary Colors --
-------------------------

Color.new("Red", colors.red)
Color.new("DarkRed", colors.dark_red)
Color.new("Blue", colors.blue)
Color.new("DarkBlue", colors.dark.blue)
Color.new("Green", colors.light.green)
Color.new("DarkGreen", colors.dark.green)
Color.new("Orange", colors.orange)
Color.new("DarkOrange", colors.dark.orange)
Color.new("Yellow", colors.yellow)
Color.new("DarkYellow", colors.dark.yellow)
Color.new("Purple", colors.purple)
Color.new("Violet", colors.violet)
Color.new("Magenta", colors.magenta)
Color.new("DarkMagenta", colors.dark.magenta)
Color.new("Black", colors.black)
Color.new("Grey", colors.grey)
Color.new("White", colors.white)
Color.new("Cyan", colors.cyan)
Color.new("DarkCyan", colors.dark.cyan)
Color.new("Aqua", colors.aqua)
Color.new("pink", colors.pink)


if vim.o.background == "dark" then
  Color.new("mono_1", "#abb2bf")
  Color.new("mono_2", "#828997")
  Color.new("mono_3", "#5c6370")
  Color.new("mono_4", "#4b5263")
  Color.new("hue_1", "#55D1B4")
  Color.new("hue_2", "#61afef")
  Color.new("hue_3", "#c678dd")
  Color.new("hue_4", "#98c379")
  Color.new("hue_5", "#e06c75")
  Color.new("hue_5_2", "#be5046")
  Color.new("hue_6", "#d19a66")
  Color.new("hue_6_2", "#e5c07b")
  Color.new("syntax_bg", "#282c34")
  Color.new("syntax_gutter", "#636d83")
  Color.new("syntax_cursor", "#2c323c")
  Color.new("syntax_accent", "#528bff")
  Color.new("vertsplit", "#181a1f")
  Color.new("special_grey", "#3b4048")
  Color.new("visual_grey", "#3e4452")
  Color.new("pmenu", "#333841")
else
  Color.new("mono_1", "#494b53")
  Color.new("mono_2", "#696c77")
  Color.new("mono_3", "#a0a1a7")
  Color.new("mono_4", "#c2c2c3")
  Color.new("hue_1", "#0184bc")
  Color.new("hue_2", "#4078f2")
  Color.new("hue_3", "#a626a4")
  Color.new("hue_4", "#50a14f")
  Color.new("hue_5", "#e45649")
  Color.new("hue_5_2", "#ca1243")
  Color.new("hue_6", "#986801")
  Color.new("hue_6_2", "#c18401")
  Color.new("syntax_bg", "#fafafa")
  Color.new("syntax_gutter", "#9e9e9e")
  Color.new("syntax_cursor", "#f0f0f0")
  Color.new("syntax_accent", "#526fff")
  Color.new("syntax_accent_2", "#0083be")
  Color.new("vertsplit", "#e7e9e1")
  Color.new("special_grey", "#d3d3d3")
  Color.new("visual_grey", "#d0d0d0")
  Color.new("pmenu", "#dfdfdf")
end

----------------------
-- Vim Editor Color --
----------------------

Group.new("Normal", c.mono_1, c.syntax_bg, no)
Group.new("bold", c.none, c.none, b)
Group.new("ColorColumn", c.none, c.syntax_cursor, no)
Group.new("Conceal", c.mono_4, c.syntax_bg, no)
Group.new("Cursor", c.none, c.syntax_accent, no)
Group.new("CursorIM", c.none, c.none, no)
Group.new("CursorColumn", c.none, c.syntax_cursor, no)
Group.new("CursorLine", c.none, c.syntax_cursor, no)
Group.new("Directory", c.hue_2, c.none, no)
Group.new("ErrorMsg", c.hue_5, c.none, no)
Group.new("VertSplit", c.mono_4, c.none, no)
Group.new("Folded", c.mono_3, c.none, no)
Group.new("FoldColumn", c.mono_3, c.syntax_cursor, no)
Group.new("IncSearch", c.syntax_bg, c.hue_2, no)
Group.new("LineNr", c.mono_4, c.none, no)
Group.new("CursorLineNr", c.mono_1, c.syntax_cursor, no)
Group.new("MatchParen", c.hue_5, c.syntax_cursor, ul + b)
Group.new("Italic", c.none, c.none, i)
Group.new("ModeMsg", c.mono_1, c.none, no)
Group.new("MoreMsg", c.mono_1, c.none, no)
Group.new("NonText", c.mono_3, c.none, no)
Group.new("PMenu", c.none, c.pmenu, no)
Group.new("PMenuSel", c.none, c.mono_4, no)
Group.new("PMenuSbar", c.none, c.mono_3, no)
Group.new("PMenuThumb", c.none, c.mono_1, no)
Group.new("Question", c.hue_2, c.none, no)
Group.new("Search", c.mono_3, c.hue_6_2, no)
Group.new("SpecialKey", c.special_grey, c.none, no)
Group.new("Whitespace", c.special_grey, c.none, no)
Group.new("StatusLine", c.mono_1, c.mono_4, no)
Group.new("StatusLineNC", c.mono_3, c.none, no)
Group.new("TabLine", c.mono_2, c.visual_grey, no)
Group.new("TabLineFill", c.mono_3, c.visual_grey, no)
Group.new("TabLineSel", c.mono_3, c.hue_2, no)
Group.new("Title", c.mono_1, c.none, b)
Group.new("Visual", c.none, c.visual_grey, no)
Group.new("VisualNOS", c.none, c.visual_grey, no)
Group.new("WarningMsg", c.hue_5, c.none, no)
Group.new("TooLong", c.hue_5, c.none, no)
Group.new("WildMenu", c.mono_1, c.mono_3, no)
Group.new("SignColumn", c.none, c.none, no)
Group.new("Special", c.hue_2, c.none, no)

return colors
