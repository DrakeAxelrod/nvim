-- local M = {}

-- function M.init()
--   require("mini.indentscope").setup({}) -- good
--   require("mini.surround").setup({}) -- good
--   require("mini.tabline").setup({}) -- good
-- end
local starter = require("modules.misc.mini.starter")
local sessions = require("modules.misc.mini.sessions")
local indentscope = require("modules.misc.mini.indentscope")
local tabline = require("modules.misc.mini.tabline")
local surround = require("modules.misc.mini.surround")
local bufremove = require("modules.misc.mini.bufremove")
local cursorword = require("modules.misc.mini.cursorword")

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
