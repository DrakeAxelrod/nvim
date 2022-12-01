local M = {}

table.insert(M, { "lewis6991/impatient.nvim" })

-- table.insert(M, { "wakatime/vim-wakatime" })

table.insert(M, { "kkharji/sqlite.lua" })

table.insert(M, { "romgrk/fzy-lua-native" })

table.insert(M, { "nvim-lua/popup.nvim" })

table.insert(M, { "nvim-lua/plenary.nvim" })

table.insert(M, { "kyazdani42/nvim-web-devicons" })
-- table.insert(M, { "yamatsum/nvim-nonicons", requires = { "kyazdani42/nvim-web-devicons" } })

table.insert(M, { "romgrk/fzy-lua-native" })

table.insert(M, { "m4xshen/autoclose.nvim" })

table.insert(M, { "alvarosevilla95/luatab.nvim", requires = "kyazdani42/nvim-web-devicons" })

table.insert(M, {
  "yamatsum/nvim-cursorline",
  function()
    require("nvim-cursorline").setup {
      cursorline = {
        enable = true,
        timeout = 1000,
        number = false,
      },
      cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
      },
    }
  end,
})
table.insert(M, {
  "antoinemadec/FixCursorHold.nvim",
  function()
    vim.g.cursorhold_updatetime = 100
  end,
})

table.insert(M, {
  "phaazon/hop.nvim",
  function()
    require("hop").setup { keys = "etovxqpdygfblzhckisuran" }
  end,
})

table.insert(M, {
  "nathom/filetype.nvim",
  function()
    require("filetype").setup {}
  end,
})

table.insert(M, { "tpope/vim-repeat" })

table.insert(M, {
  "kylechui/nvim-surround",
  function()
    require("nvim-surround").setup {}
  end,
})

table.insert(M, {
  "rcarriga/nvim-notify",
  function()
    local icons = require "theme.icons"
    vim.notify = require "notify"
    vim.notify.setup {
      stages = "slide",
      on_open = nil,
      on_close = nil,
      render = "default",
      timeout = 1000,
      background_colour = "Normal",
      minimum_width = 50,
      icons = {
        ERROR = icons.diagnostics.Error,
        WARN = icons.diagnostics.Warn,
        INFO = icons.diagnostics.Info,
        DEBUG = icons.diagnostics.Debug,
        TRACE = icons.diagnostics.Trace,
      },
    }
  end,
})

return M
