local ok, lush = pcall(require, "lush")
if not ok then
  return
end
local hsl = lush.hsl
local colors = require("theme.colors")

-- Call lush with our lush-spec.
---@diagnostic disable: undefined-global
local theme = lush(function()
  return {
  }
end)

-- return our parsed theme for extension or use else where.
return theme

-- vi:nowrap:number
