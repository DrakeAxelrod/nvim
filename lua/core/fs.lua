local M = {}

---Get the os appropriate path
---@return string
function M.join(...)
    return table.concat({ ... }, package.config:sub(1, 1))
end

---Get the full path to runtime
---@return string
function M.get_runtime()
    local runtime = M.join(os.getenv("HOME"), ".config", "xyz", "runtime")
    if not runtime then
        -- when nvim is used directly
        return vim.call("stdpath", "data")
    end
    return runtime
end

---Get the full path to config
---@return string
function M.get_config()
    local config = M.join(os.getenv("HOME"), ".config", "xyz")
    if not config then
        return vim.call("stdpath", "config")
    end
    return config
end

---Get the full path to cache
---@return string
function M.get_cache()
    local cache = M.join(os.getenv("HOME"), ".cache", "xyz")
    if not cache then
        return vim.call("stdpath", "config")
    end
    return cache
end


---@meta overridden to use xyz_x_dir instead
---vim.call("stdpath", x) will still get originals
vim.fn.stdpath = function(what)
    if what == "cache" then
        return M.get_cache()
    elseif what == "data" then
        return M.get_runtime()
    elseif what == "config" then
        return M.get_config()
    end
    return vim.call("stdpath", what)
end

	-- self.path.cache = fs.get_cache()
	-- self.path.mods = fs.join(vim.fn.stdpath("config"), "lua", "modules")
	-- self.path.gconf = fs.join(vim.fn.stdpath("config"), "lua", "config", "global")
	-- self.path.conf = fs.join(vim.fn.stdpath("config"), "lua", "config", "custom")
	-- self.path.langs = fs.join(vim.fn.stdpath("config"), "lua", "languages", "global", "languages")
	-- self.path.lsp_langs = fs.join(vim.fn.stdpath("config"), "lua", "lsp", "languages")
	-- self.path.data = vim.fn.stdpath("data")
	-- self.path.lsp = fs.join(vim.fn.stdpath("data"), "lsp_servers")



function M.is_file(path)
    return vim.fn.filereadable(path) == 1
end

function M.is_directory(path)
    return vim.fn.isdirectory(path) == 1
end

-- function M.file_exists(name)
-- 	local f = io.open(name, "r")
-- 	return f ~= nil and io.close(f)
-- end

-- function M.dir_exists(path)
-- 	return M.file_exists(path)
-- end

function M.change_path()
	return vim.fn.input("Path: ", M.join(vim.fn.getcwd() , "file"))
end

function M.set_global_path()
	local path = M.change_path()
	vim.api.nvim_command("silent :cd " .. path)
end

function M.set_window_path()
	local path = M.change_path()
	vim.api.nvim_command("silent :lcd " .. path)
end

function M.os()
  return vim.loop.os_uname().sysname
end

return M
