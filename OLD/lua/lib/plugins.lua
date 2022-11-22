local fs = require("lib").fs
local vim = vim
local M = {
  _ = {},
  url = "https://github.com/wbthomason/packer.nvim",
  config = {
    install_path = fs.join(vim.fn.stdpath("data"), "site", "pack", "packer", "start", "packer.nvim"),
    compile_path = fs.join(vim.fn.stdpath("config"), "lua", "compiled.lua"),
    display = {
      open_fn = function(float)
        return require("packer.util").float({ border = "rounded" })
      end
    }
  }
}


local bootstrap = function()
  if vim.fn.empty(vim.fn.glob(M.config.install_path)) > 0 then
    return vim.fn.system({ "git", "clone", "--depth", "1", M.url, M.config.install_path })
  end
end

M.add = function(spec)
  if type(spec) == "table" then
    table.insert(M._, function()
      return spec
    end)
  else
    table.insert(M._, require(([[plugins.%s]]):format(spec)))
  end
end

M.init = function(self)
  local new_install = bootstrap()
  vim.cmd("packadd packer.nvim")
  require("packer").startup({
    function(use)
      for _, plugin in ipairs(self._) do
        use(plugin())
      end
    end,
    config = self.config
  })
  if new_install then
    require("packer").sync()
  end
  if fs.exists(self.config.compile_path) then
    require(self.config.compile_path:gsub("(.*/)(.*)", "%2"):match("(.*)%.lua"))
  end
end

return M
-- return setmetatable(M,
-- {
--   __call = function(_, ...)
--     local new_install = bootstrap()
--     vim.cmd("packadd packer.nvim")
--     require("packer").startup({
--       function(use)
--         for _, plugin in ipairs(M._) do
--           use(plugin())
--         end
--       end,
--       config = M.config
--     })
--     if new_install then
--       require("packer").sync()
--     end
--     if fs.exists(M.config.compile_path) then
--       require(M.config.compile_path:gsub("(.*/)(.*)", "%2"):match("(.*)%.lua"))
--     end
--   end
-- })
