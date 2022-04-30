
pcall(vim.cmd, "packadd packer.nvim")
local present, packer = pcall(require, "packer")
local install_path = api.fs.join(vim.fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim")

if not present then
  vim.notify("Please wait ... \nDownloading packer ...", "info", { title = "Packer" })
  -- remove the dir if present before cloning
  vim.fn.delete(install_path, "rf")
  local bootstrap
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    local url = "https://github.com/wbthomason/packer.nvim"
    bootstrap = vim.fn.system({ "git", "clone", "--depth", "1", url, install_path })
  end
  vim.cmd("packadd packer.nvim")
  present, packer = pcall(require, "packer")
  if present then
    packer.bootstrapped = true
    print "Packer cloned successfully."
  else
    error("Couldn't clone packer !\nPacker install path: " .. install_path)
  end
end
packer.reset()
packer.init({
  compile_path = vim.fn.stdpath "config" .. "/lua/packer_compiled.lua",
  auto_clean = true,
  auto_reload_compiled = true,
  git = { clone_timeout = 600 },
  display = {
    open_fn = function()
      return require("packer.util").float({ border = "single" })
    end,
  }
})
return packer

-- local function pacstrap()
--   if bootstrap then
--     return sync()
--   end
-- end

-- return pacstrap, use

-- local packer = require("packer").startup {
--   function(use)
--     -- local grp = vim.api.nvim_create_augroup("Packer", { clear = true })
--     -- vim.api.nvim_create_autocmd("BufWritePost", {
--     --   command = "source <afile> | PackerCompile",
--     --   group = grp,
--     --   pattern = api.fs.join(vim.fn.stdpath("config") .. "*")
--     -- })
--     use "wbthomason/packer.nvim"
--     local modules = require "modules" -- plugins
--     for repo, opts in pairs(modules) do
--       use(vim.tbl_extend("force", { repo }, opts))
--     end
--     if bootstrap then
--       return require "packer".sync()
--     end
--   end,
--   config = {
--     git = { clone_timeout = 300 },
--     display = {
--       open_fn = function()
--         return require "packer.util".float { border = "single" }
--       end,
--     }
--   }
-- }

-- return packer
