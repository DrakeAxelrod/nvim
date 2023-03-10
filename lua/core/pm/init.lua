local M = {}

M.path = path.joindata("lazy", "lazy.nvim")

M.setup = function()
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

  local config = require("core.pm.config")

  require("lazy").setup(config)
end

return M
