local fn = require("utils.fn")
local icons = require("theme.icons")
local M = {}

local ensure_packer = function()
  local install_path = fn.joinpath(
    vim.fn.stdpath("data"),
    "site",
    "pack",
    "packer",
    "start",
    "packer.nvim"
  )
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

M.startup = function(plugins)
  local packer_bootstrap = ensure_packer()
  return require("packer").startup({
    ---@param use function
    function(use)
      use "wbthomason/packer.nvim"
      for _, plugin in ipairs(plugins) do
        use(plugin)
      end
      if packer_bootstrap then
        require("packer").sync()
      end
    end,
    config = {
      profile = {
        enable = true,
        threshold = 1 -- the amount in ms that a plugin's load time must be over for it to be included in the profile
      },
      display = {
        open_fn = function()
          return require("packer.util").float({ border = "rounded" })
        end,
        working_sym = icons.installer.Working,
        error_sym = icons.installer.Error,
        done_sym = icons.installer.Success,
        removed_sym = icons.installer.Removed,
        moved_sym = icons.installer.Moved,
      },
    },
  })
end

M.plugin_count = function()
  local start =
    vim.fn.len(vim.fn.globpath(fn.joinpath(vim.fn.stdpath("data"), "site", "pack", "packer", "start"), "*", 0, 1))
  local opt = vim.fn.len(vim.fn.globpath(fn.joinpath(vim.fn.stdpath("data"), "site", "pack", "packer", "opt"), "*", 0, 1))
  return {
    start = start,
    opts = opt,
    total = start + opt,
  }
end

return M
