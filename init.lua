require("core")
-- setup variables
local options = require("config.options")
local lsp = require("config.lsp")
local autocmds = require("config.autocmds")

-- make sure impatient is loaded
vim.loader.enable()

-- temporary setup with default options (until I can improve the implementation)
options.defaults()

--[[ This is the actual starting point of the configuration. ]]

-- setup leader and localleader as soon as possible
vim.leader("<Space>")
vim.localleader("\\")

-- setup lazy.nvim (https://lazy.folke.io/)
lazy({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "habamax" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

vim.colorscheme("onedark_vivid")

lsp.defaults()

require("config.keymaps")

autocmds.defaults()

