---@diagnostic disable: lowercase-global

string.isempty = function(self)
  return self == nil or self == ""
end

table.tostring = function(self)
  return vim.inspect(self)
end

import = function(mod, fn)
  local ok, m = pcall(require, mod)
  if ok then
    fn(m)
  end
end
