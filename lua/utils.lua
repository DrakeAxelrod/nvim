
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

M.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end


M.set = function(opts)
  for key, value in pairs(opts) do
    vim.opt[key] = value
  end
end

return M
