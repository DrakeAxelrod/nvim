if vim.api.nvim_call_function("has", { "nvim-0.7" }) ~= 1 then
    vim.notify("Please upgrade your Neovim base installation. xyz requires v0.7+", vim.log.levels.WARN)
    vim.wait(5000, function()
        return false
    end)
    vim.cmd("cquit")
end

local base = debug.getinfo(1, "S").source:sub(2):match("(.*[/\\])"):sub(1, -2)
if not vim.tbl_contains(vim.opt.rtp:get(), base) then
    vim.opt.rtp:append(base)
end

local home = os.getenv("HOME")

---Get the os appropriate path
---@return string
local function join(...)
    return table.concat({ ... }, package.config:sub(1, 1))
end

--- Checks whether a given path exists and is a file.
--@param path (string) path to check
--@returns (bool)
local function is_file(path)
    local stat = vim.loop.fs_stat(path)
    return stat and stat.type == "file" or false
end

--- Checks whether a given path exists and is a directory
--@param path (string) path to check
--@returns (bool)
local function is_directory(path)
    local stat = vim.loop.fs_stat(path)
    return stat and stat.type == "directory" or false
end

---@meta if file doesnt exist we create it
local bin_path = join(home, ".local", "bin", "xyz")
if not is_file(bin_path) then
    local file = io.open(bin_path, "w")
    file:write('#!/bin/sh\nexec nvim -u "$HOME/.config/xyz/runtime/init.lua" "$@"')
    file:close()
    vim.loop.fs_chmod(bin_path, 510)
end

---Get the full path to runtime
---@return string
local function get_runtime()
    local runtime = join(home, ".config", "xyz", "runtime")
    if not runtime then
        -- when nvim is used directly
        return vim.call("stdpath", "data")
    end
    return runtime
end

---Get the full path to config
---@return string
local function get_config()
    local config = join(home, ".config", "xyz")
    if not config then
        return vim.call("stdpath", "config")
    end
    return config
end

---Get the full path to cache
---@return string
local function get_cache()
    local cache = join(home, ".cache", "xyz")
    if not cache then
        return vim.call("stdpath", "config")
    end
    return cache
end

---@meta overridden to use xyz_x_dir instead, since a lot of plugins call this function interally
vim.fn.stdpath = function(what)
    if what == "cache" then
        return get_cache()
    elseif what == "data" then
        return get_runtime()
    elseif what == "config" then
        return get_config()
    end
    return vim.call("stdpath", what)
end

vim.opt.rtp:remove(join(vim.call("stdpath", "data"), "site"))
vim.opt.rtp:remove(join(vim.call("stdpath", "data"), "site", "after"))
vim.opt.rtp:prepend(join(get_runtime(), "site"))
vim.opt.rtp:append(join(get_runtime(), "site", "after"))
vim.opt.rtp:remove(vim.call("stdpath", "config"))
vim.opt.rtp:remove(join(vim.call("stdpath", "config"), "after"))
vim.opt.rtp:prepend(get_config())
vim.opt.rtp:append(join(get_config(), "after"))
vim.cmd([[let &packpath = &runtimepath]])

local conf_path = join(get_config(), "init.lua")
local ok, err = pcall(dofile, conf_path)
if not ok then
    if is_file(conf_path) then
        vim.notify("Invalid configuration: " .. err)
    else
        vim.notify(("Unable to find configuration file [%s]"):format(conf_path))
    end
end
