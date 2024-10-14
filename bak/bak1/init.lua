require("core")
-- setup variables
local options = require("options")
local autocmds = require("autocmds")

-- make sure impatient is loaded
impatient()

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
  install = { colorscheme = { "onedark_vivid" } },
  -- automatically check for plugin updates
  checker = { enabled = true },
})

-- options.defaults()

vim.colorscheme("onedark_vivid")

--[[ Autocmds ]]

autocmds.highlight_on_yank()
autocmds.treesitter_zsh()
autocmds.termopen()
autocmds.vimresized()
autocmds.fix_indent()
