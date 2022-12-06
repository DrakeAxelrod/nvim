---@diagnostic disable: lowercase-global, redundant-parameter

if not Packer then
  Packer = {
    plugin_dir = "plugins",
    autocmds_loaded = false,
    plugins = {}
  }
end

local ensure_packer = function()
  local install_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
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

Packer.startup = function()
  local packer_bootstrap = ensure_packer()
  pcall(require, Packer.plugin_dir)
  local packer = require("packer").startup({
    ---@param use fun(...)
    function(use)
      use("wbthomason/packer.nvim")

      -- use(vim.fn.stdpath("config") .. "/core")

      for _, plugin in ipairs(Packer.plugins) do
        use(plugin)
      end
      -- Automatically set up your configuration after cloning packer.nvim
      -- Put this at the end after all plugins
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
        end
      }
    }
  })


  if not packer.autocmds_loaded then
    local PackerHooks = vim.api.nvim_create_augroup("PackerHooks", { clear = true })
    vim.api.nvim_create_autocmd("User", {
      group = PackerHooks,
      pattern = "PackerCompileDone",
      callback = function()
        vim.notify("Compile Done!", vim.log.levels.INFO, { title = "Packer" })
        dofile(vim.env.MYVIMRC)
      end,
    })

    vim.api.nvim_create_autocmd("BufWritePost", {
      group = PackerHooks,
      pattern = "*.lua",
      callback = function()
        local file = vim.api.nvim_buf_get_name(0)
        if not file:match(vim.fn.stdpath("config")) then
          return
        end
      
        -- if file:match("init.lua") then
        --   packer.clean()
        -- end
        packer.compile()
      end,
      desc = "Auto Compile the neovim config which write in lua",
    })
    packer.autocmds_loaded = true
  end
  return packer
end

Packer.use = function(tbl)
  table.insert(Packer.plugins, tbl)
end
