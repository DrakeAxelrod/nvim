---@diagnostic disable: lowercase-global
vim = vim -- luacheck: ignore

prequire = function(mod)
  local status, lib = pcall(require, mod)
  if (status) then return lib end
  return nil
end

vscode = (function()
  if vim.fn.exists("g:vscode") == 1 then
    return true
  end
  return false
end)()



path = {}

--- returns a string joined by the path seperator
--- @param ... any to join
--- @return string joined string
path.join = function(...)
  return table.concat({ ... }, package.config:sub(1, 1))
end

path.joinconfig = function(...)
  return path.join(vim.fn.stdpath("config"), ...)
end

path.joindata = function(...)
  return path.join(vim.fn.stdpath("data"), ...)
end

path.joincache = function(...)
  return path.join(vim.fn.stdpath("cache"), ...)
end

path.joinstate = function(...)
  return path.join(vim.fn.stdpath("state"), ...)
end
