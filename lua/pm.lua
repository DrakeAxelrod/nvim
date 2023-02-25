local fn = require("fn")

local M = {}

M.path = fn.joinpath(vim.fn.stdpath("data"), "lazy", "lazy.nvim")

M.setup = function(plugins)
  if not vim.loop.fs_stat(M.path) then
    vim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      M.path,
    })
  end
  vim.opt.rtp:prepend(M.path)
  require("lazy").setup(plugins, {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  })
end

return M
