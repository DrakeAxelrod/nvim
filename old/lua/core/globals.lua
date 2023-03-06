---@diagnostic disable: lowercase-global
-- Global functions

nvim = vim

prequire = function(mod)
  local status, lib = pcall(require, mod)
  if (status) then return lib end
  return nil
end

--- returns a string joined by the path seperator
--- @param ... any to join
--- @return string joined string
joinpath = function(...)
  return table.concat({ ... }, package.config:sub(1, 1))
end

is_vscode = (function()
  if nvim.fn.exists("g:vscode") == 1 then
    return true
  end
  return false
end)()
