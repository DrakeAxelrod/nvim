local t = require("tools")
local configs = require("plugins.configs")
local plugin = t.plugin

-- ===========================[[ Utility ]]=========================== --

plugin({
  "lewis6991/impatient.nvim",
  event = "VimEnter",
  config = function()
    require("impatient").enable_profile()
  end,
})

plugin({
  "nvim-lua/plenary.nvim",
  event = "VimEnter",
  after = { "impatient.nvim" },
})
plugin({
  "nvim-lua/popup.nvim",
  event = "VimEnter",
  after = { "impatient.nvim" },
})
plugin({
  "kyazdani42/nvim-web-devicons",
  event = "VimEnter",
  after = { "impatient.nvim" },
})

plugin({
  "antoinemadec/FixCursorHold.nvim",
  event = "VimEnter",
  after = { "impatient.nvim" },
})

plugin({
  "rcarriga/nvim-notify",
  event = "VimEnter",
  after = {
    "impatient.nvim",
    "nvim-web-devicons",
    "plenary.nvim",
    "FixCursorHold.nvim",
  },
  config = configs.notify,
})

plugin({
  "olimorris/onedarkpro.nvim",
  event = "VimEnter",
  after = { "nvim-notify" },
  config = configs.colorscheme,
})

plugin({
  "phaazon/hop.nvim",
  after = { "nvim-notify" },
  event = "VimEnter",
  config = configs.hop,
  cmd = {
    "HopWord",
    "HopChar1",
    "HopChar2",
    "HopPattern",
    "HopLine",
    "HopAnywhere",
  },
})

plugin({
  "mrjones2014/smart-splits.nvim",
  after = { "nvim-notify" },
  event = "VimEnter",
  config = configs.smart_splits,
  cmd = {
    "SmartCursorMoveLeft",
    "SmartCursorMoveRight",
    "SmartCursorMoveUp",
    "SmartCursorMoveDown",
    "SmartResizeLeft",
    "SmartResizeRight",
    "SmartResizeUp",
    "SmartResizeDown",
    "SmartResizeMode",
  },
})

plugin({
  "Pocco81/auto-save.nvim",
  after = { "nvim-notify" },
  event = "VimEnter",
  config = configs.auto_save,
})

-- ===========================[[ Interface ]]=========================== --

plugin({
  "folke/which-key.nvim",
  after = { "nvim-notify" },
  event = "BufWinEnter",
  config = configs.whichkey,
})

plugin({
  "kyazdani42/nvim-tree.lua",
  after = { "nvim-notify" },
  event = "VimEnter",
  cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeClose" },
  config = configs.nvimtree,
})

plugin({
  "gelguy/wilder.nvim",
  disable = true,
  after = { "nvim-notify" },
  event = "VimEnter",
  requires = { "romgrk/fzy-lua-native", "nvim-web-devicons" },
  config = configs.wilder,
})

plugin({
  "folke/noice.nvim",
  -- disable = true,
  config = configs.noice,
  after = { "which-key.nvim", "lsp-setup.nvim" },
  event = "VimEnter",
  requires = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
})

-- ===========================[[ Statusline ]]=========================== --

plugin({
  "nvim-lualine/lualine.nvim",
  after = { "onedarkpro.nvim" },
  event = "VimEnter",
  config = configs.lualine,
})

-- ===========================[[ Git ]]=========================== --

plugin({
  "lewis6991/gitsigns.nvim",
  after = { "nvim-notify" },
  config = configs.gitsigns,
  event = "BufRead",
})

plugin({
  "TimUntersberger/neogit",
  after = { "nvim-notify" },
  requires = { "sindrets/diffview.nvim" },
  event = "VimEnter",
  config = configs.neogit,
  cmd = { "Neogit" },
})

-- ===========================[[ Dashboard ]]=========================== --

plugin({
  "goolord/alpha-nvim",
  after = { "nvim-notify" },
  event = "BufWinEnter",
  config = configs.alpha,
})

-- ===========================[[ Terminal ]]=========================== --

plugin({
  "akinsho/toggleterm.nvim",
  tag = "*",
  event = "VimEnter",
  config = configs.toggleterm,
  cmd = { "ToggleTerm" },
})

-- ===========================[[ Bufferline ]]=========================== --

-- plugin({
--   "akinsho/bufferline.nvim",
--   tag = "v3.*",
--   after = { "nvim-notify" },
--   config = configs.bufferline,
-- })

-- plugin({
--   "romgrk/barbar.nvim",
--   after = { "nvim-notify" },
--   config = configs.barbar,
-- })

-- ===========================[[ Telescope ]]=========================== --

plugin({
  "nvim-telescope/telescope.nvim",
  after = { "nvim-notify" },
  event = "VimEnter",
  requires = {
    { "romgrk/fzy-lua-native", run = "make" },
    "kkharji/sqlite.lua",
    -- extensions
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    { "nvim-telescope/telescope-fzy-native.nvim", after = { "fzy-lua-native" } },
    { "nvim-telescope/telescope-smart-history.nvim", after = { "sqlite.lua" } },
    { "nvim-telescope/telescope-frecency.nvim", after = { "sqlite.lua" } },
    { "sudormrfbin/cheatsheet.nvim" },
  },
  config = configs.telescope,
})

-- ===========================[[ Syntax ]]=========================== --

plugin({
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  after = { "onedarkpro.nvim" },
  event = "VimEnter",
  requires = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "BufReadPost",
      requires = {
        { "numToStr/Comment.nvim", config = configs.comment },
      },
    },
  },
  config = configs.treesitter,
})

-- plugin({
--   "windwp/nvim-ts-autotag",
--   after = { "nvim-treesitter" },
--   config = configs.autotag,
-- })

-- plugin({
--   "p00f/nvim-ts-rainbow",
--   after = { "nvim-treesitter" },
-- })

-- plugin({
--   "RRethy/vim-illuminate",
--   after = { "nvim-treesitter" },
--   config = configs.illuminate,
-- })

plugin({
  "kylechui/nvim-surround",
  after = { "nvim-treesitter" },
  event = "BufReadPost",
  config = configs.surround,
})

plugin({
  "tpope/vim-repeat",
  after = { "nvim-treesitter" },
  event = "BufReadPost",
})

plugin({
  "m4xshen/autoclose.nvim",
  after = { "nvim-treesitter" },
  event = "InsertEnter",
})

--> lsp <--

plugin({
  "folke/neodev.nvim",
  ft = { "lua" },
  event = "VimEnter",
  config = configs.neodev
})

plugin({
  "glepnir/lspsaga.nvim",
  branch = "main",
  event = "VimEnter",
  config = configs.lspsaga,
})

plugin({
  "junnplus/lsp-setup.nvim",
  after = { "neodev.nvim", "nvim-notify", "lspsaga.nvim" },
  event = "VimEnter",
  requires = {
    "neovim/nvim-lspconfig",
    {
      "williamboman/mason.nvim",
      config = configs.mason,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      config = configs.mason_lspconfig,
    },
    -- { "simrat39/rust-tools.nvim" },
    -- { "p00f/clangd_extensions.nvim" },
  },
  config = configs.lsp_setup,
})

plugin({
  "utilyre/barbecue.nvim",
  after = { "lsp-setup.nvim" },
  event = "VimEnter",
  requires = {
    "neovim/nvim-lspconfig",
    "smiteshp/nvim-navic",
    "kyazdani42/nvim-web-devicons", -- optional
  },
  config = function()
    require("barbecue").setup()
  end,
})

plugin({
  "jose-elias-alvarez/null-ls.nvim",
  after = { "lsp-setup.nvim" },
  event = "VimEnter",
  config = configs.null_ls,
  requires = {
    "nvim-lua/plenary.nvim",
  },
})

plugin({
  "rcarriga/nvim-dap-ui",
  disable = true,
  requires = {
    "mfussenegger/nvim-dap",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
  },
  config = configs.dap,
  cmd = { "DapToggleRepl" },
})

-- ===========================[[ Completion ]]=========================== --

plugin({
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  after = { "nvim-notify" },
  requires = {
    { "L3MON4D3/LuaSnip" }, -- snippets
    { "rafamadriz/friendly-snippets" }, -- snippets
    { "lukas-reineke/cmp-under-comparator" }, -- better compare sorter
    { "saadparwaiz1/cmp_luasnip" }, -- Snippet completion source
    { "hrsh7th/cmp-nvim-lsp" }, -- Lsp completion source
    { "hrsh7th/cmp-buffer" }, -- Buffer completion source
    { "hrsh7th/cmp-path" }, -- Path completion source
    { "hrsh7th/cmp-nvim-lua" }, -- Nvim api completion source
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    {
      "zbirenbaum/copilot-cmp", -- Copilot completion source
      after = { "nvim-cmp" },
      event = "InsertEnter",
      requires = {
        "zbirenbaum/copilot.lua", -- Copilot
        event = "InsertEnter",
        config = configs.copilot,
      },
      config = configs.copilot_cmp,
    },
  },
  config = configs.cmp,
})

-- example of custom plugin
-- plugin({ joinpath(vim.fn.stdpath("config"), "custom_plugin") })
