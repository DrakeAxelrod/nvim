local luv = vim.loop
local M = {}

if jit ~= nil then
  M.is_windows = jit.os == "Windows"
else
  M.is_windows = package.config:sub(1, 1) == "\\"
end

if M.is_windows and vim.o.shellslash then
  M.use_shellslash = true
else
  M.use_shallslash = false
end

M.get_seperator = function()
  if M.is_windows and not M.use_shellslash then
    return "\\"
  end
  return "/"
end

--- Joins a number of strings into a valid path
---@vararg string[] String segments to convert to file system path
M.join = function(...)
  return table.concat({ ... }, M.get_seperator())
end

--- Check if a file or directory exists in this path
M.exists = function(file)
	local ok, err, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	return ok, err
end

--- Check if a directory exists in this path
M.isdir = function(path)
	-- "/" works on both Unix and Windows
	return M.exists(path .. "/")
end


return M
