return function()
  local ok, alpha = pcall(require, "alpha")
  if not ok then
    return
  end
  local t = require("tools")
  local icons = require("theme.icons")
  local cfg = require("alpha.themes.dashboard")
  cfg.section.header.val = {
    [[                                        __                          ]],
    [[           ___     ___    ___   __  __ /\_\    ___ ___              ]],
    [[          / _ `\  / __`\ / __`\/\ \/\ \\/\ \  / __` __`\            ]],
    [[         /\ \/\ \/\  __//\ \_\ \ \ \_/ |\ \ \/\ \/\ \/\ \           ]],
    [[         \ \_\ \_\ \____\ \____/\ \___/  \ \_\ \_\ \_\ \_\          ]],
    [[          \/_/\/_/\/____/\/___/  \/__/    \/_/\/_/\/_/\/_/          ]],
    [[      .-.      _______                           .  '  *   .  . '   ]],
    [[     {}``; |==|_______D                                . *  -+-  .  ]],
    [[     / ('        /|\                             . '   * .    '  *  ]],
    [[ (  /  |        / | \                                * .  ' .  .-+- ]],
   ([[  \(_)_%s      /  |  \                           *   *  .   .       ]]):format("]]"),
  }
  cfg.section.buttons.val = {
    cfg.button("e", icons.ui.File .. "  New file", ":ene <BAR> startinsert <CR>"),
    cfg.button("r", icons.ui.History .. "  Recent files", ":Telescope frecency<CR>"),
    cfg.button("u", icons.ui.Package .. "  Update Plugins", ":PackerSync<CR>"),
    -- silent! is needed to prevent the error message when the file doesn't exist
    cfg.button("c", icons.ui.Gear .. "  Config", ":silent e ~/.config/nvim/init.lua <CR>"),
    -- cfg.button("k", icons.ui.Gear .. " Config", ":e ~/.config/nvim/lua/keymaps.lua <CR>"),
    cfg.button("q", icons.diagnostics.Error .. "  Quit", ":qa<CR>"),
  }
  local footer = function()
    local plugin_count = t.plugin_count()
    local plugins = ("Loaded %s/%s %s "):format(plugin_count.start, plugin_count.total, icons.ui.Package)
    -- local website = "draxel.io"
    return {
      plugins,
    }
  end
  cfg.section.footer.val = footer()

  cfg.section.footer.opts.hl = "Type"
  cfg.section.header.opts.hl = "Directory"
  cfg.section.buttons.opts.hl = "Keyword"

  cfg.opts.opts.noautocmd = true
  alpha.setup(cfg.opts)
end
