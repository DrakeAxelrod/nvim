local ok
ok, _ = pcall(require, "lib.api")
if not ok then vim.notify("api") return end
ok, _ = pcall(require("impatient").enable_profile)
if not ok then vim.notify("impatient") return end
ok, _ = pcall(require, "conf")
if not ok then vim.notify("conf") return end

-- important to start first
conf.opts.quick()
conf.keys.quick()
-- disable stuff we dont need
conf.opts.disables()
-- rest of opts
conf.opts.ui()
conf.opts.behavior()
conf.opts.files()
conf.opts.misc()
conf.opts.lists()
-- auto commands
conf.cmds.autocmds()
-- load plugins
conf.mod.load()
-- load standard keybinds
conf.keys.standard()

--[[----------------------------------------------------------------------]]
---@class References links to inspirational config files
--[[----------------------------------------------------------------------]]
---@https://github.com/nullchilly/nvim
---@https://github.com/wbthomason/dotfiles/tree/linux/neovim/.config/nvim
