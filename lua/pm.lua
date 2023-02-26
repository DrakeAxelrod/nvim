local M = {}

M.path = joinpath(nvim.fn.stdpath("data"), "lazy", "lazy.nvim")

local ensure = function()
  if not nvim.loop.fs_stat(M.path) then
    nvim.fn.system({
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable", -- latest stable release
      M.path,
    })
  end
  vim.opt.rtp:prepend(M.path)
end

M.setup = function(plugins)
  ensure()
  local icons = require("theme.icons")
  require("lazy").setup(plugins, {
    ui = {
      -- a number <1 is a percentage., >1 is a fixed size
      size = { width = 0.8, height = 0.8 },
      wrap = true, -- wrap the lines in the ui
      -- The border to use for the UI window. Accepts same border values as |nvim_open_win()|.
      border = "none",
      icons = {
        cmd = icons.misc.Terminal .. " ",
        config = icons.ui.Gear,
        event = icons.diagnostics.Lightning .. " ",
        ft = icons.ui.File .. " ",
        init = icons.ui.Gear .. " ",
        import = icons.ui.ArrowCircleDown .. " ",
        keys = icons.ui.Keyboard .. " ",
        lazy = icons.misc.Package .. " ",
        loaded = icons.ui.Square .. " ",
        not_loaded = icons.ui.SquareUnFilled .. " ",
        plugin = icons.ui.Package .. " ",
        runtime = icons.ui.Runtime .. " ",
        source = icons.ui.Code .. " ",
        start = icons.ui.Forward .. " ",
        task = icons.ui.AltCheck .. " ",
        list = {
          icons.ui.Circle,
          icons.ui.BoldArrowRight,
          icons.ui.Star,
          "‒",
        },
      },
    },
  })
end

return M
