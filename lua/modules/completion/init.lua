local M = {}

local function config(file)
  return require(("modules.completion.%s"):format(file))
end

M.cmp = config("cmp")
M.wilder = config("wilder")

return M
