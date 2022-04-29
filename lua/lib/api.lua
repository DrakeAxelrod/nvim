---@diagnostic disable: lowercase-global
_G.api = {}
api.fs = {}

--> filesystem <--

function api.fs.sep()
  return jit.os == "Windows" and "\\" or "/"
end

function api.fs.join(str)
  local path, _ = str:gsub("/", api.fs.sep())
  return path
end

--- Check if a file or directory exists in this path
function api.fs.exists(file)
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
function api.fs.isdir(path)
	-- "/" works on both Unix and Windows
	return api.fs.exists(path .. "/")
end

-- change directory
function api.fs.cd()
	return vim.fn.input("Path: ", vim.fn.getcwd() .. "/", "file")
end

-- global path
function api.fs.set_gpath()
	local path = M.change_path()
	vim.api.nvim_command("silent :cd " .. path)
end

-- window path
function api.fs.set_wpath()
	local path = M.change_path()
	vim.api.nvim_command("silent :lcd " .. path)
end

--> string <--

function string.startswith(s, n)
	return s:sub(1, #n) == n
end

function string.endswith(self, str)
	return self:sub(-#str) == str
end

--> table <--

-- from lunarvim
-- https://github.com/LunarVim/LunarVim/

---Find the first entry for which the predicate returns true.
---@param t table The table
---@param predicate function The function called for each entry of t
---@return nil|any The entry for which the predicate returned True or nil
function table.find_first(t, predicate)
	for _, entry in pairs(t) do
		if predicate(entry) then
			return entry
		end
	end
	return nil
end

---Check if the predicate returns True for at least one entry of the table.
---@param t table The table
---@param predicate function The function called for each entry of t
---@return true|false if predicate returned True at least once, false otherwise
function table.contains(t, predicate)
	return table.find_first(t, predicate) ~= nil
end

--> os <--

-- capturs stdout as a string
function os.capture(cmd, raw)
	local f = assert(io.popen(cmd, "r"))
	local s = assert(f:read("*a"))
	f:close()
	if raw then
		return s
	end
	s = string.gsub(s, "^%s+", "")
	s = string.gsub(s, "%s+$", "")
	s = string.gsub(s, "[\n\r]+", " ")
	return s
end

--> simplicity <--

function Impatient()
	local ok, impatient = pcall(require, "impatient")
	if not ok then
		vim.notify("impatient not found")
		return false
	end
	impatient.enable_profile()
	return true
end

function ColorScheme(name)
	local ok, _ = pcall(vim.cmd, "colorscheme " .. name)
	if not ok then
		vim.cmd([[colorscheme default]])
		vim.notify("could not enable " .. name .. " colorscheme")
	end
end

-- some voodoo taken from tj's config
-- https://github.com/tjdevries/config_manager/tree/master/xdg_config/nvim
function Has(x)
	return vim.fn.has(x) == 1
end

function Executable(x)
	return vim.fn.executable(x) == 1
end

local ok, plenary_reload = pcall(require, "plenary.reload")
if not ok then
	Reloader = require
else
	Reloader = plenary_reload.reload_module
end

function P(v)
	vim.pretty_print(v)
	return v
end

function RELOAD(...)
	return Reloader(...)
end

function R(name)
	RELOAD(name)
	return require(name)
end

function prequire(...)
  local status, lib = pcall(require, ...)
  if (status) then return lib end
  return nil
end


---@param group string
local augroup = function(group)
	-- local id = vim.api.nvim_create_augroup(group, { clear = true })
	vim.api.nvim_create_augroup(group, { clear = true })
	---@param autocmds fun(autocmd: fun(event: table | string, opts: table, command: function | string))
	return function(autocmds)
		autocmds(function(event, opts, command)
			-- opts.group = id
			opts.group = group
			if type(command) == 'function' then
				opts.callback = command
			else
				opts.command = command
			end
			vim.api.nvim_create_autocmd(event, opts)
		end)
	end
end

return augroup
