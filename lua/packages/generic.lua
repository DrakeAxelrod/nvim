return {
  { "lewis6991/impatient.nvim" },
  { "wakatime/vim-wakatime" },
  { "tpope/vim-repeat" },
  { "kkharji/sqlite.lua" },
  { "romgrk/fzy-lua-native" },
  { "nvim-lua/popup.nvim" },
  { "nvim-lua/plenary.nvim" },
  { "kyazdani42/nvim-web-devicons" },
  -- {
  --   "yamatsum/nvim-nonicons",
  --   requires = { "kyazdani42/nvim-web-devicons" },
  -- },
  { "romgrk/fzy-lua-native" },
  {
    "antoinemadec/FixCursorHold.nvim",
    function()
      vim.g.cursorhold_updatetime = 100
    end,
  },
  {
    "phaazon/hop.nvim",
    function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end
  },
  {
    "nathom/filetype.nvim",
    function()
      require("filetype").setup({})
    end,
  },
  { "kylechui/nvim-surround",
  tag = "*", -- Use for stability; omit to use `main` branch for the latest features
  config = function()
      require("nvim-surround").setup({
          -- Configuration here, or leave empty to use defaults
      })
  end
},
{
  "rcarriga/nvim-notify",
  after = { "nvim-lua/popup.nvim", "yamatsum/nvim-nonicons"},
  function()
    local icons = require("theme.icons")
    vim.notify = require("notify")
    vim.notify.setup({
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
    })
  end
},
}
