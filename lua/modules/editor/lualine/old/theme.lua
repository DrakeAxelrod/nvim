
local c = require("lib.colors")
local function section(bg, fg)
  bg = bg or "fg"
  fg = fg or "bg"
  return {
    a = { fg = fg, bg = bg, gui = "bold" },
    b = { fg = fg, bg = bg, gui = "bold" },
    c = { fg = fg, bg = bg, gui = "bold" },
    x = { fg = fg, bg = bg, gui = "bold" },
    y = { fg = fg, bg = bg, gui = "bold" },
    z = { fg = fg, bg = bg, gui = "bold" },
  }
end

local function template()
  local bg = "fg"
  local fg = "bg"
  return {
    normal = {
      a = { fg = fg, bg = bg, gui = "bold" },
      b = { fg = fg, bg = bg, gui = "bold" },
      c = { fg = fg, bg = bg, gui = "bold" },
      --------------------------------------
      x = { fg = fg, bg = bg, gui = "bold" },
      y = { fg = fg, bg = bg, gui = "bold" },
      z = { fg = fg, bg = bg, gui = "bold" },
    },
    insert = {
      a = { fg = fg, bg = bg, gui = "bold" },
      b = { fg = fg, bg = bg, gui = "bold" },
      c = { fg = fg, bg = bg, gui = "bold" },
      --------------------------------------
      x = { fg = fg, bg = bg, gui = "bold" },
      y = { fg = fg, bg = bg, gui = "bold" },
      z = { fg = fg, bg = bg, gui = "bold" },
    },
    visual = {
      a = { fg = fg, bg = bg, gui = "bold" },
      b = { fg = fg, bg = bg, gui = "bold" },
      c = { fg = fg, bg = bg, gui = "bold" },
      --------------------------------------
      x = { fg = fg, bg = bg, gui = "bold" },
      y = { fg = fg, bg = bg, gui = "bold" },
      z = { fg = fg, bg = bg, gui = "bold" },
    },
    replace = {
      a = { fg = fg, bg = bg, gui = "bold" },
      b = { fg = fg, bg = bg, gui = "bold" },
      c = { fg = fg, bg = bg, gui = "bold" },
      --------------------------------------
      x = { fg = fg, bg = bg, gui = "bold" },
      y = { fg = fg, bg = bg, gui = "bold" },
      z = { fg = fg, bg = bg, gui = "bold" },
    },
    command = {
      a = { fg = fg, bg = bg, gui = "bold" },
      b = { fg = fg, bg = bg, gui = "bold" },
      c = { fg = fg, bg = bg, gui = "bold" },
      --------------------------------------
      x = { fg = fg, bg = bg, gui = "bold" },
      y = { fg = fg, bg = bg, gui = "bold" },
      z = { fg = fg, bg = bg, gui = "bold" },
    },
    inactive = {
      a = { fg = fg, bg = bg, gui = "bold" },
      b = { fg = fg, bg = bg, gui = "bold" },
      c = { fg = fg, bg = bg, gui = "bold" },
      --------------------------------------
      x = { fg = fg, bg = bg, gui = "bold" },
      y = { fg = fg, bg = bg, gui = "bold" },
      z = { fg = fg, bg = bg, gui = "bold" },
    }
  }
end

return function()
  return {
    inactive = section(c.foreground, c.background),
    visual = section(c.color3, c.background),
    replace = section(c.color1, c.background),
    insert = section(c.color4, c.background),
    normal = section(c.foreground, c.background),
    command = section(c.color5, c.background),
  }
end
