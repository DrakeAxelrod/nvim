---@diagnostic disable: lowercase-global

-- M.colorscheme = function(colorscheme)
--   colorscheme = colorscheme or "default"
--   local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
--   if not ok then
--     vim.cmd "colorscheme default" -- if the above fails, then use default
--   end
-- end

import = function(mod, fn)
  local ok, m = pcall(require, mod)
  if ok then fn(m) end
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
  local path = vim.fn.stdpath("data") .. "/site/pack/deps/opt/dep"
  if vim.fn.empty(vim.fn.glob(path)) > 0 then
    vim.fn.system({ "git", "clone", "--depth=1", "https://github.com/chiyadev/dep", path })
  end
  vim.cmd("packadd dep")

  -- get all file or directory names in the given directory
  local files = vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/" .. prefix .. "/")
  -- remove the extension from the file name if it exists
  local modules = vim.tbl_map(function(file)
    return file:match("(.*)%.lua") or file
  end, files)
  modules.prefix = prefix .. "."
  return require("dep")({
    modules = modules
  })
end

local core = setmetatable({}, {
  __call = function(self, cfg)
    -- setup impatient if available
    import("impatient", function(m)
      m.enable_profile()
    end)

    options(cfg.options())

    cfg.packages_prefix = cfg.packages_prefix or "packages"
    packages(cfg.packages_prefix)

    map(cfg.mappings.standard(desc))

    -- vim.pretty_print(cfg.mappings.packages)
    for key, fn in pairs(cfg.mappings.packages) do

      import(key, function(mod)
        map(fn(mod, desc))
      end)
    end

    local lsp = cfg.lsp()
    cfg.servers_prefix = cfg.servers_prefix or "servers"
    import("lsp-setup", function(mod)
      mod.setup({
        prefix = cfg.servers_prefix, -- directory name for lsp servers configs
        default_mappings = false,
        on_attach = lsp.on_attach,
        capabilities = lsp.capabilities
      })
    end)

    for _, tbl in pairs(cfg.autocommands()) do
      vim.api.nvim_create_autocmd(unpack(tbl))
    end

  end,
})


return core
