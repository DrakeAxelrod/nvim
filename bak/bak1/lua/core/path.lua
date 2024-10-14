path = {}

--- returns a string joined by the path seperator
--- @param ... any to join
--- @return string joined string
path.join = function(...)
  return table.concat({ ... }, package.config:sub(1, 1))
end

--- Check if a file or directory exists in this path
path.exists = function(file)
	local ok, err, code = os.rename(file, file)
	if not ok then
		if code == 13 then
			-- Permission denied, but it exists
			return true
		end
	end
	return ok, err
end

path.is_file = function(file)
  return vim.fn.filereadable(path) == 1
end

path.is_dir = function(dir)
  return vim.fn.isdirectory(dir) == 1
end

path.change_dir = function(fp)
  if path.is_dir(fp) then
    vim.fn.chdir(fp)
  else
    vim.notify("Directory does not exist: " .. fp)
  end
end
