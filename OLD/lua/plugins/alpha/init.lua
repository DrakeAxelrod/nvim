return function()
  local ok, alpha = pcall(require, "alpha")
  if not ok then
    return
  end
  local banners = require("plugins.alpha.banners")
  local t = require("tools")
  local icons = require("theme.icons")
  local cfg = require("alpha.themes.dashboard")
  cfg.section.header.val = banners["lighthouse"]
  cfg.section.buttons.val = {
    -- cfg.button("e", icons.ui.File .. "  New file", ":ene <BAR> startinsert <CR>"),
    cfg.button("r", icons.ui.Telescope .. "  Recent files", ":Telescope frecency<CR>"),
    cfg.button("f", icons.ui.Telescope .. "  File Browser", ":Telescope file_browser<CR>"),
    cfg.button("S", icons.installer.Working .. "  Packer Sync", ":PackerSync<CR>"),
    cfg.button("C", icons.ui.Target .. "  Packer Compile", ":PackerCompile<CR>"),
    cfg.button("c", icons.ui.Gear .. "  Config", ":e $MYVIMRC | :cd %:p:h<cr>"),
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
