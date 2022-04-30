-- local M = {}

-- function M.init()
--   require("mini.indentscope").setup({}) -- good
--   require("mini.surround").setup({}) -- good
--   require("mini.tabline").setup({}) -- good
-- end
local starter = require("modules.tools.mini.starter")
local sessions = require("modules.tools.mini.sessions")
local indentscope = require("modules.tools.mini.indentscope")
local tabline = require("modules.tools.mini.tabline")
local surround = require("modules.tools.mini.surround")
local bufremove = require("modules.tools.mini.bufremove")
local cursorword = require("modules.tools.mini.cursorword")

local init = function()
  cursorword()
  starter()
  sessions()
  indentscope()
  tabline()
  surround()
  bufremove()
  -- require("mini.statusline").setup({})
  require("mini.misc").setup({
    -- Array of fields to make global (to be used as independent variables)
    make_global = { "put", "put_text", "zoom" },
  })
end

init()
