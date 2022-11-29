local M = {}

M.utils  = require "core.utils"

local packages = function(prefix)
  local path = vim.fn.stdpath "data" .. "/site/pack/deps/opt/dep"
  if vim.fn.empty(vim.fn.glob(path)) > 0 then
    vim.fn.system { "git", "clone", "--depth=1", "https://github.com/chiyadev/dep", path }
  end
  vim.cmd "packadd dep"

  -- check if packages directory exists
  local packages_dir = vim.fn.stdpath "config" .. "/lua/" .. prefix .. "/"
  if vim.fn.empty(vim.fn.glob(packages_dir)) > 0 then
    return
  end
  -- get all file or directory names in the given directory
  local files = vim.fn.readdir(packages_dir)
  -- remove the extension from the file name if it exists
  local modules = vim.tbl_map(function(file)
    return file:match "(.*)%.lua" or file
  end, files)
  modules.prefix = prefix .. "."
  return require "dep" {
    modules = modules,
  }
end

local options = function(options)
  for scope, table in pairs(options) do
    for setting, value in pairs(table) do
      vim[scope][setting] = value
    end
  end
end

local mappings = function()
  require("mappings")
end

M.on_attach_list = {}

--- Add a function to the on_attach_list
---@param fn fun(client: number, bufnr: number)
M.on_attach = function(fn)
  -- add the function to the list
  table.insert(M.on_attach_list, fn)
end

M.options = function()
  return options
end

M.packages = function()
  return packages
end

M.mappings = function()
  return mappings
end


return M

-- return setmetatable({
--   packages_dir = "packages",
--   options = {},
--   keymaps = function() end,
--   autocmds = function() end,
-- }, {
--   __call = function(self, ...)
--     import("impatient", function(impatient)
--       impatient.enable_profile()
--     end)
--     options(self.options)
--     packages(self.packages_dir)
--   end,
-- })
