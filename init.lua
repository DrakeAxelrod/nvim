(function(go)
  go()
end)(function()
  pcall(function()
    require("impatient").enable_profile()
  end)
  require("core")(function(conf)
    conf.options:init()
    require("scripts.resize")
    conf.plugins:init()
    conf.keys:init()
    conf.theme:init()
    conf.cmds:init()
  end)
end)

-- if vim.fn.exists("g:vscode") == 1 then
-- end
