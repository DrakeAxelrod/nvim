---@diagnostic disable: lowercase-global

import = function(mod, fn)
  local ok, m = pcall(require, mod)
  if ok then
    fn(m)
  end
end

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

return setmetatable({
  packages_dir = "packages",
  options = {},
}, {
  __call = function(self, ...)
    import("impatient", function(impatient)
      impatient.enable_profile()
    end)
    options(self.options)
    packages(self.packages_dir)
  end,
})
