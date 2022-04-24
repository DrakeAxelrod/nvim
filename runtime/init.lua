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

---Get the os appropriate path
---@return string
local function join(...)
    return table.concat({ ... }, package.config:sub(1, 1))
end

---@meta if file doesnt exist we create it
local bin_path = join(os.getenv("HOME"), ".local", "bin", "xyz")
if not vim.fn.filereadable(bin_path) == 1 then
    local file = io.open(bin_path, "w")
    file:write('#!/bin/sh\nexec nvim -u "$HOME/.config/xyz/runtime/init.lua" "$@"')
    file:close()
    vim.loop.fs_chmod(bin_path, 510)
end

---Get the full path to runtime
---@return string
local function get_runtime()
    local runtime = join(os.getenv("HOME"), ".config", "xyz", "runtime")
    if not runtime then
        -- when nvim is used directly
        return vim.call("stdpath", "data")
    end
    return runtime
end

---Get the full path to config
---@return string
local function get_config()
    local config = join(os.getenv("HOME"), ".config", "xyz")
    if not config then
        return vim.call("stdpath", "config")
    end
    return config
end

---Get the full path to cache
---@return string
local function get_cache()
    local cache = join(os.getenv("HOME"), ".cache", "xyz")
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

local ok, err = pcall(dofile, join(get_config(), "init.lua"))
if not ok then
    if vim.fn.filereadable(join(get_config(), "init.lua")) == 1 then
        vim.notify("Invalid configuration: " .. err)
    else
        vim.notify(("Unable to find configuration file [%s]"):format(join(get_config(), "init.lua")))
    end
end
