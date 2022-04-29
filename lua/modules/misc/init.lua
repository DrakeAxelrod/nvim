local M = {}

local function config(file)
  return require(("modules.misc.%s"):format(file))
end

M.filetype = function()
  local ok, ft = pcall(require, "filetype")
  if not ok then
    return
  end
  ft.setup({})
end

M.mini = function()
  require("modules.misc.mini")
end

M.notify = function()
  require("modules.misc.notify")
end

M.fix_cursor_hold = function()
  vim.g.curshold_updatime = 1000
end

return M
