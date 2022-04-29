local bootstrap = (function()
  local install_path = api.fs.join(vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim")
  if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
    vim.notify("Please wait ... \nDownloading packer ...", "info", { title = "Packer" })
    local url = "https://github.com/wbthomason/packer.nvim"
    return vim.fn.system { "git", "clone", "--depth", "1", url, install_path }
  end
end)()

vim.cmd "packadd packer.nvim"

local packer = require("packer").startup {
  function(use)
    -- local grp = vim.api.nvim_create_augroup("Packer", { clear = true })
    -- vim.api.nvim_create_autocmd("BufWritePost", {
    --   command = "source <afile> | PackerCompile",
    --   group = grp,
    --   pattern = api.fs.join(vim.fn.stdpath("config") .. "*")
    -- })
    use "wbthomason/packer.nvim"
    local modules = require "modules" -- plugins
    for repo, opts in pairs(modules) do
      use(vim.tbl_extend("force", { repo }, opts))
    end
    if bootstrap then
      return require "packer".sync()
    end
  end,
  config = {
    git = { clone_timeout = 300 },
    display = {
      open_fn = function()
        return require "packer.util".float { border = "single" }
      end,
    }
  }
}

return packer
