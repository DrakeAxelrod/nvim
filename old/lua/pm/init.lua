local config = prequire("pm.config") or {}
local M = {}

M.path = joinpath(nvim.fn.stdpath("data"), "lazy", "lazy.nvim")

local ensure = function()
  if not nvim.loop.fs_stat(M.path) then
    nvim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      M.path,
    })
  end
  vim.opt.rtp:prepend(M.path)
end

M.setup = function(plugins)
  ensure()
  local icons = require("theme.icons")
  require("lazy").setup(config)
end

return M
