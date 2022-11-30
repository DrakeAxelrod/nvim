local t = require("tools")

-- set leader to space
t.leader([[ ]])
-- set options
require("options")
-- initialize and install plugins
t.init_packages({
  "language",
  "packages",
  "interface",
  "completion"
})
-- set commands
require("commands")
-- set keymaps
require("keymaps")
-- set autocommands
require("autocmds")
