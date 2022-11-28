local core = require "core"

import("impatient", function(impatient)
  impatient.enable_profile()
end)

local options = core.options()
local packages = core.packages()
local mappings = core.mappings()

options(require("options"))
packages("packages")
mappings()
