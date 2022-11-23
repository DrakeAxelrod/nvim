---@diagnostic disable: lowercase-global

-- M.colorscheme = function(colorscheme)
--   colorscheme = colorscheme or "default"
--   local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
--   if not ok then
--     vim.cmd "colorscheme default" -- if the above fails, then use default
--   end
-- end

-- M.join = function(...)
--   return table.concat({...}, jit.os == "Windows" and "\\" or "/")
-- end

-- --- Check if a file or directory exists in this path
-- M.exists = function(file)
-- 	local ok, err, code = os.rename(file, file)
-- 	if not ok then
-- 		if code == 13 then
-- 			-- Permission denied, but it exists
-- 			return true
-- 		end
-- 	end
-- 	return ok, err
-- end

-- --- Check if a directory exists in this path
-- M.isdir = function(path)
-- 	-- "/" works on both Unix and Windows
-- 	return M.exists(path .. "/")
-- end

import = function(mod, fn)
  local ok, m = pcall(require, mod)
  if ok then
    fn(m)
  end
end

local options = function(options)
  for scope, table in pairs(options) do
    for setting, value in pairs(table) do
      vim[scope][setting] = value
    end
  end
end

local desc = function(description)
  return { silent = true, noremap = true, desc = description }
end

local map = function(mappings)
  for _, m in ipairs(mappings) do
    local mode, keys, cmd, opts = unpack(m)
    vim.keymap.set(mode, keys, cmd, opts)
  end
end

local packages = function(prefix)
  local path = vim.fn.stdpath "data" .. "/site/pack/deps/opt/dep"
  if vim.fn.empty(vim.fn.glob(path)) > 0 then
    vim.fn.system { "git", "clone", "--depth=1", "https://github.com/chiyadev/dep", path }
  end
  vim.cmd "packadd dep"

  -- get all file or directory names in the given directory
  local files = vim.fn.readdir(vim.fn.stdpath "config" .. "/lua/" .. prefix .. "/")
  -- remove the extension from the file name if it exists
  local modules = vim.tbl_map(function(file)
    return file:match "(.*)%.lua" or file
  end, files)
  modules.prefix = prefix .. "."
  return require "dep" {
    modules = modules,
  }
end

local lsp = function(config, prefis)
  config.servers = config.servers or {}
  prefix = prefix or "servers"
  -- replace / with . for the module name
  prefix = prefix:gsub("/", ".")
  -- change . to / for the path
  local path = vim.fn.stdpath("config") .. "/lua/" .. prefix:gsub("%.", "/")
  -- get all contents of the directory
  for _, file in ipairs(vim.fn.readdir(path)) do
    -- get the file name without the extension
    local name = file:match("(.*)%.lua")
    -- if the file name is not nil
    if name then
      local server = require(prefix .. "." .. name)
      server.disabled = server.disabled or false
      if not server.disabled then
        config.servers[name] = server
      end
    end
  end

  import("lsp-setup", function(mod)
    mod.setup {
      default_mappings = false,
      on_attach = config.on_attach,
      capabilities = config.capabilities,
    }
  end)

end

local placeholder = function(...)
  return {}
end

return function(cfg)
  -- setup impatient if available
  import("impatient", function(m)
    m.enable_profile()
  end)
  -- error handling
  cfg.packages_prefix = cfg.packages_prefix or "packages"
  cfg.servers_prefix = cfg.servers_prefix or "servers"
  cfg.options = cfg.options or placeholder
  cfg.mappings = cfg.mappings or { standard = placeholder, packages = {} }
  cfg.lsp = cfg.lsp or placeholder
  cfg.autocommands = cfg.autocommands or placeholder

  -- init options
  options(cfg.options())
  -- init packages
  packages(cfg.packages_prefix)
  -- setup standard keybinds
  map(cfg.mappings.standard(desc))
  -- setup plugin keybinds if plugins are installed
  for key, fn in pairs(cfg.mappings.packages) do
    import(key, function(mod)
      map(fn(mod, desc))
    end)
  end

  -- init lsp
  local lsp_config = cfg.lsp()
  lsp(lsp_config, cfg.servers_prefix)

  -- init autocommands
  for _, tbl in pairs(cfg.autocommands()) do
    vim.api.nvim_create_autocmd(unpack(tbl))
  end
end
