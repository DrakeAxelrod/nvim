local M = {}

M.colorscheme = function(colorscheme)
  colorscheme = colorscheme or "default"
  local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
  if not ok then
    vim.cmd "colorscheme default" -- if the above fails, then use default
  end
end


M.options = function(options)
  for scope, table in pairs(options) do
    for setting, value in pairs(table) do
      vim[scope][setting] = value
    end
  end
end

M.keys = function(mappings)
  for _, m in ipairs(mappings) do
    local mode, keys, cmd, opts = unpack(m)
    vim.keymap.set(mode, keys, cmd, opts)
  end
end


M.packages = setmetatable({}, {
  __call = function(_, prefix)
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
  end,
})


M.lsp = setmetatable({}, {
  __call = function(self, config)
    config.servers = config.servers or {}
    config.prefix = config.prefix or "servers"
    -- replace / with . for the module name
    config.prefix = config.prefix:gsub("/", ".")
    -- change . to / for the path
    local path = vim.fn.stdpath("config") .. "/lua/" .. config.prefix:gsub("%.", "/")
    -- get all contents of the directory
    for _, file in ipairs(vim.fn.readdir(path)) do
      -- get the file name without the extension
      local name = file:match("(.*)%.lua")
      -- if the file name is not nil
      if name then
        local server = require(config.prefix .. "." .. name)
        server.disabled = server.disabled or false
        if not server.disabled then
          config.servers[name] = server
        end
      end
    end
    local status, lib = pcall(require, "lsp-setup")
    if not status then return end
    lib.setup(self)
  end,
})

return M
