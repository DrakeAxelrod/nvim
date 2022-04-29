local M = {}

local function config(file)
  return require(("modules.misc.%s"):format(file))
end

function M.filetype()
  local ok, ft = pcall(require, "filetype")
  if not ok then
    return
  end
  ft.setup({})
end

function M.mini()
  require("modules.misc.mini")
end

M.notify = require("modules.misc.notify")

return M
