return function(fn)
  local conf = {
    options = require("core.opts"),
    plugins = require("core.plugins"),
    keys = require("core.keys"),
    theme = require("core.theme"),
  }
  return fn(conf)
end
