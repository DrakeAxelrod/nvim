local t = require("tools")
local configs = require("plugins.configs")
local plugin = t.plugin

plugin({ "lewis6991/impatient.nvim" })
-- plugin({ "kkharji/sqlite.lua" })
-- plugin({ "romgrk/fzy-lua-native" })
-- plugin({ "nvim-lua/popup.nvim" })
plugin({ "nvim-lua/plenary.nvim" })

plugin({
  "kyazdani42/nvim-web-devicons",
  -- "yamatsum/nvim-nonicons", requires = { "kyazdani42/nvim-web-devicons" }
})
-- plugin({ "romgrk/fzy-lua-native" })

plugin({ "antoinemadec/FixCursorHold.nvim" })

plugin({
  "phaazon/hop.nvim",
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

plugin({ "rcarriga/nvim-notify", config = configs.notify })

plugin({
  "olimorris/onedarkpro.nvim",
  config = configs.colorscheme,
  rtp = "onedarkpro",
})

plugin({
  "folke/which-key.nvim",
  event = "BufWinEnter",
  config = configs.whichkey,
})

plugin({
  "kyazdani42/nvim-tree.lua",
  requires = { "kyazdani42/nvim-web-devicons" },
  cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeClose" },
  config = configs.nvimtree,
})

plugin({
  "mrjones2014/smart-splits.nvim",
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

-- plugin({
--   "gelguy/wilder.nvim",
--   requires = { "romgrk/fzy-lua-native", "nvim-web-devicons" },
--   config = configs.wilder,
-- })

plugin({
  "folke/noice.nvim",
  -- disable = true,
  config = configs.noice,
  after = { "which-key.nvim" },
  requires = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
})

--> lualine <--
plugin({
  "nvim-lualine/lualine.nvim",
  requires = {
    "kyazdani42/nvim-web-devicons",
    "junnplus/lsp-setup.nvim",
  },
  config = configs.lualine,
})

--> git <--

plugin({
  "lewis6991/gitsigns.nvim",
  requires = { "nvim-lua/plenary.nvim" },
  config = configs.gitsigns,
  event = "BufRead",
})

plugin({
  "TimUntersberger/neogit",
  requires = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim" },
  config = configs.neogit,
  cmd = { "Neogit" },
})

--> alpha <--
plugin({
  "goolord/alpha-nvim",
  requires = { "nvim-tree/nvim-web-devicons" },
  event = "BufWinEnter",
  config = configs.alpha,
})

--> toggleterm <--
plugin({
  "akinsho/toggleterm.nvim",
  config = configs.toggleterm,
  cmd = { "ToggleTerm" },
  key = { "<c-t>" },
})

--> telescope <--
plugin({
  "nvim-telescope/telescope.nvim",
  requires = {
    "nvim-telescope/telescope-fzy-native.nvim",
    {
      "nvim-telescope/telescope-smart-history.nvim",
      requires = { "kkharji/sqlite.lua" },
    },
    {
      "nvim-telescope/telescope-frecency.nvim",
      requires = { "kkharji/sqlite.lua" },
    },
    { "nvim-telescope/telescope-ui-select.nvim" },
    { "rcarriga/nvim-notify" },
  },
  config = configs.telescope,
})
--> treesitter <--

plugin({
  "nvim-treesitter/nvim-treesitter",
  run = ":TSUpdate",
  requires = {
    { "p00f/nvim-ts-rainbow" },
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

--> lsp <--

plugin({
  "folke/neodev.nvim",
  ft = { "lua" },
  config = configs.neodev,
})

plugin({
  "junnplus/lsp-setup.nvim",
  after = { "neodev.nvim" },
  requires = {
    "neovim/nvim-lspconfig",
    { "williamboman/mason.nvim", config = configs.language.mason },
    { "williamboman/mason-lspconfig.nvim", config = configs.language.mason_lspconfig },
    -- { "simrat39/rust-tools.nvim" },
    -- { "p00f/clangd_extensions.nvim" },
  },
  config = configs.language.lsp_setup,
})

plugin({
  "utilyre/barbecue.nvim",
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
  config = configs.language.null_ls,
  requires = { "nvim-lua/plenary.nvim" },
})

plugin({
  "rcarriga/nvim-dap-ui",
  requires = {
    "mfussenegger/nvim-dap",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
  },
  config = configs.language.dap,
  cmd = { "DapToggleRepl" },
})

--> cmp <--

plugin({
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  requires = {
    { "L3MON4D3/LuaSnip" },
    { "rafamadriz/friendly-snippets" },
    { "lukas-reineke/cmp-under-comparator" },
    -- Snippet completion source
    { "saadparwaiz1/cmp_luasnip" },
    -- Lsp completion source
    { "hrsh7th/cmp-nvim-lsp" },
    -- Buffer completion source
    { "hrsh7th/cmp-buffer" },
    -- Path completion source
    { "hrsh7th/cmp-path" },
    -- Nvim api completion source
    { "hrsh7th/cmp-nvim-lua" },
    -- Signature completion source
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
    {
      "zbirenbaum/copilot-cmp",
      event = "InsertEnter",
      requires = {
        "zbirenbaum/copilot.lua",
        event = "InsertEnter",
        config = configs.copilot,
      },
      config = configs.copilot_cmp,
    },
  },
})

-- example of custom plugin
-- plugin({ joinpath(vim.fn.stdpath("config"), "custom_plugin") })
