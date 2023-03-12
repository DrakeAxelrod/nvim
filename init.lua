require("core")

local opts = require("options")

set.leader(" ")
set.options(opts)

vim.pm.setup()

oak = deepcopy(vim)
