local fn = require("utils.fn")
local M = {}
M.on_attach_list = {}
M.servers_path = fn.joinpath(vim.fn.stdpath("config"), "lua", "servers")

M.servers = function()
  local servers = {}
  local path = M.servers_path
  local files = readdir(path)
  -- remove vim.fn.stdpath "config" / "lua" from path
  path = path:gsub(joinpath(vim.fn.stdpath("config"), "lua"), ""):gsub("/", ".")
  for _, file in ipairs(files) do
    if file then
      local server = require(path .. "." .. file)
      server.disabled = server.disabled or false
      if not server.disabled then
        servers[file] = server
      end
    end
  end
  return servers
end

--- Add a function to the on_attach_list
---@param fn fun(client: number, bufnr: number)
M.on_attach = function(fn)
  -- add the function to the list
  table.insert(M.on_attach_list, fn)
end

return M
