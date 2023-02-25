
local M = {}

--- returns a string joined by the path seperator
--- @param ... any to join
--- @return string joined string
M.joinpath = function(...)
  return table.concat({ ... }, package.config:sub(1, 1))
end

M.prequire = function(mod)
  local status, lib = pcall(require, mod)
  if (status) then return lib end
  return nil
end

return M
