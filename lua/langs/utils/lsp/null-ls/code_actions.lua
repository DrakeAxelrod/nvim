-- https://github.com/LunarVim/LunarVim

local M = {}

local null_ls = require("null-ls")
local services = require "lsp.null-ls.services"
local method = null_ls.methods.CODE_ACTION

function M.list_registered(filetype)
  local registered_providers = services.list_registered_providers_names(filetype)
  return registered_providers[method] or {}
end

function M.setup(actions_configs)
  if vim.tbl_isempty(actions_configs) then
    return
  end

  local registered = services.register_sources(actions_configs, method)

  if #registered > 0 then
    vim.notify("Registered the following action-handlers: " .. unpack(registered))
  end
end

return M
