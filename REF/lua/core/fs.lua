local M = {}

---Get the os appropriate path
---@return string
function M.join(...)
  return table.concat({ ... }, package.config:sub(1, 1))
end

-- --- Checks whether a given path exists and is a file.
-- --@param path (string) path to check
-- --@returns (bool)
-- function M.is_file(path)
--   local stat = vim.loop.fs_stat(path)
--   return stat and stat.type == "file" or false
-- end

-- --- Checks whether a given path exists and is a directory
-- --@param path (string) path to check
-- --@returns (bool)
-- function M.is_directory(path)
--   local stat = vim.loop.fs_stat(path)
--   return stat and stat.type == "directory" or false
-- end

-- local os
-- if os_name == "Darwin" then
-- 	os = "macOS"
-- elseif os_name == "Linux" then
-- 	os = "Linux"
-- elseif os_name == "Windows" then
-- 	os = "Windows"
-- else
-- 	os = "other"
-- end

function M.os()
  return vim.loop.os_uname().sysname
end

return M
