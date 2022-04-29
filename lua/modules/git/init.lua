local M = {}

local function config(file)
  return require(("modules.git.%s"):format(file))
end

M.gitsigns = config("gitsigns")

return M
