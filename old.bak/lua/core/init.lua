return function(fn)
  local conf = {
    options = require("core.opts"),
    plugins = require("core.plugins"),
    keys = require("core.keys"),
    theme = require("core.theme"),
    cmds = require("core.cmds"),
  }
  return fn(conf)
end
