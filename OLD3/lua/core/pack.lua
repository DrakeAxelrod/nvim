---@diagnostic disable: redundant-parameter

core._inner.packer_spec = {}
core._inner.packer_autocmds_enabled = false
core.packer_install_path = joinpath(vim.fn.stdpath("data"), "site", "pack", "packer", "start", "packer.nvim")

core.plugin = function(tbl)
  table.insert(core._inner.packer_spec, tbl)
end

local ensure_packer = function()
  if vim.fn.empty(vim.fn.glob(core.packer_install_path)) > 0 then
    vim.fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      core.packer_install_path
    })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end


core._inner.apply_plugins = function()
  local bootstrap = ensure_packer()
  pcall(require, core.plugin_dir)
  core.packer = require("packer").startup({
    ---@param use fun(...)
    function(use)
      use("wbthomason/packer.nvim")

      -- use(vim.fn.stdpath("config") .. "/core")

      for _, plugin in ipairs(core._inner.packer_spec) do
        use(plugin)
      end

      -- Automatically set up your configuration after cloning packer.nvim
      -- Put this at the end after all plugins
      if bootstrap then
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
        end
      }
    }
  })
end
