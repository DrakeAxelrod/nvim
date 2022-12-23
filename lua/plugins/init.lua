local pack = require("utils.pack")
local vscode = vim.g.vscode == 1

local plugins = {}
local plugin = function(tbl)
  table.insert(plugins, tbl)
end

local configs = {}

local this_dir = debug.getinfo(1, "S").source:sub(2):match("(.*[/\\])"):sub(1, -2)
for _, entry in ipairs(vim.fn.readdir(this_dir)) do
  local config = entry:gsub("%.lua$", "")
  -- get last part this_dir "/home/username/.config/nvim/lua/plugins" -> "plugins"
  local last_part = this_dir:match("([^/]+)$")
  if config ~= "init" then
    local ok, conf = pcall(require, last_part .. "." .. config)
    if ok then
      configs[config] = conf
    end
  end
end

-- ===========================[[ Utility ]]=========================== --

plugin({
  "lewis6991/impatient.nvim",
  disable = vscode,
})
plugin({
  "nvim-lua/plenary.nvim",
  disable = vscode,
})
plugin({
  "nvim-lua/popup.nvim",
  disable = vscode,
})
plugin({
  "kyazdani42/nvim-web-devicons",
  disable = vscode,
})
plugin({
  "antoinemadec/FixCursorHold.nvim",
  disable = vscode,
  config = function()
    vim.g.cursorhold_updatetime = 100
  end
})
plugin({
  "rcarriga/nvim-notify",
  disable = vscode,
  config = configs.notify
})
plugin({
  "olimorris/onedarkpro.nvim",
  disable = vscode,
  config = configs.colorscheme
})

-- ===========================[[ Interface ]]=========================== --

plugin({
  "folke/which-key.nvim",
  disable = vscode,
  after = { "nvim-notify" },
  -- event = "BufWinEnter",
  config = configs.whichkey,
})

plugin({
  "kyazdani42/nvim-tree.lua",
  disable = vscode,
  after = { "nvim-notify" },
  cmd = { "NvimTreeToggle", "NvimTreeOpen", "NvimTreeClose" },
  config = configs.nvimtree,
})

plugin({
  "gelguy/wilder.nvim",
  disable = vscode or true,
  after = { "nvim-notify" },
  requires = { "romgrk/fzy-lua-native", "nvim-web-devicons" },
  config = configs.wilder,
})

plugin({
  "folke/noice.nvim",
  disable = vscode,
  config = configs.noice,
  -- after = { "which-key.nvim", "lsp-setup.nvim" },
  requires = {
    -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
})

plugin({
  "mrjones2014/smart-splits.nvim",
  disable = vscode,
  after = { "nvim-notify" },
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


-- ===========================[[ Statusline ]]=========================== --

plugin({
  "nvim-lualine/lualine.nvim",
  disable = vscode,
  after = { "onedarkpro.nvim" },
  config = configs.lualine,
})

-- ===========================[[ Git ]]=========================== --

plugin({
  "lewis6991/gitsigns.nvim",
  disable = vscode,
  after = { "nvim-notify" },
  config = configs.gitsigns,
  event = "BufRead",
})

plugin({
  "TimUntersberger/neogit",
  disable = vscode,
  after = { "nvim-notify" },
  requires = { "sindrets/diffview.nvim" },
  config = configs.neogit,
  cmd = { "Neogit" },
})

-- ===========================[[ Dashboard ]]=========================== --

plugin({
  "goolord/alpha-nvim",
  disable = vscode,
  after = { "nvim-notify" },
  config = configs.alpha,
})

-- ===========================[[ Terminal ]]=========================== --

plugin({
  "akinsho/toggleterm.nvim",
  disable = vscode,
  tag = "*",
  config = configs.toggleterm,
  cmd = { "ToggleTerm" },
})

-- ===========================[[ Bufferline ]]=========================== --

plugin({
  "akinsho/bufferline.nvim",
  disable = vscode,
  tag = "v3.*",
  after = { "nvim-notify" },
  config = configs.bufferline,
})

-- ===========================[[ Telescope ]]=========================== --

plugin({
  "nvim-telescope/telescope.nvim",
  disable = vscode,
  after = { "nvim-notify" },
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
  disable = vscode,
  run = ":TSUpdate",
  event = "BufRead",
  after = { "onedarkpro.nvim" },
  requires = {
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "BufReadPost",
      requires = {
        { "numToStr/Comment.nvim", config = configs.comment },
      },
    },
  },
  config = configs.treesitter.treesitter,
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
  disable = vscode,
  after = { "nvim-treesitter" },
  event = "BufReadPost",
  config = configs.treesitter.surround,
})

plugin({
  "tpope/vim-repeat",
  disable = vscode,
  after = { "nvim-treesitter" },
  event = "BufReadPost",
})

plugin({
  "m4xshen/autoclose.nvim",
  disable = vscode,
  after = { "nvim-treesitter" },
  event = "InsertEnter",
})

-- ===========================[[ Language Server Protocol ]]=========================== --

plugin({
  "folke/neodev.nvim",
  disable = vscode,
  ft = { "lua" },
  config = configs.neodev
})

plugin({
  "glepnir/lspsaga.nvim",
  disable = vscode or false,
  branch = "main",
  config = configs.language.lspsaga,
})

plugin({
  "junnplus/lsp-setup.nvim",
  disable = vscode,
  after = { "neodev.nvim", "nvim-notify", "lspsaga.nvim" },
  requires = {
    "neovim/nvim-lspconfig",
    {
      "williamboman/mason.nvim",
      config = configs.language.mason,
    },
    {
      "williamboman/mason-lspconfig.nvim",
      config = configs.language.mason_lspconfig,
    },
    -- { "simrat39/rust-tools.nvim" },
    -- { "p00f/clangd_extensions.nvim" },
  },
  config = configs.language.lsp_setup,
})

plugin({
  "utilyre/barbecue.nvim",
  after = { "lsp-setup.nvim" },
  disable = vscode or true,
  requires = {
    "neovim/nvim-lspconfig",
    "smiteshp/nvim-navic",
    "kyazdani42/nvim-web-devicons", -- optional
  },
  event = "BufReadPost",
  config = function()
    require("barbecue").setup()
  end,
})

plugin({
  "jose-elias-alvarez/null-ls.nvim",
  after = { "lsp-setup.nvim" },
  disable = vscode or true,
  config = configs.null_ls,
  requires = {
    "nvim-lua/plenary.nvim",
  },
})

plugin({
  "rcarriga/nvim-dap-ui",
  disable = vscode or true,
  requires = {
    "mfussenegger/nvim-dap",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-telescope/telescope-dap.nvim",
  },
  config = configs.dap,
  cmd = { "DapToggleRepl" },
})

plugin({
  "phaazon/hop.nvim",
  disable = vscode,
  event = "BufRead",
  config = function()
    require("hop").setup()
    -- lvim.keys.normal_mode["<leader>j"] = ":HopChar2<cr>"
    -- lvim.keys.normal_mode["<leader>J"] = ":HopWord<cr>"
    vim.keymap.set("n", "<leader>j", ":HopWord<cr>", { silent = true })
    -- vim.api.nvim_set_keymap("n", "S", ":HopChar2<cr>", { silent = true })
    -- vim.api.nvim_set_keymap("n", "s", ":HopWord<cr>", { silent = true })
  end,
})

-- ===========================[[ Completion ]]=========================== --

plugin({
  "hrsh7th/nvim-cmp",
  disable = vscode,
  -- event = "InsertEnter",
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
        config = configs.cmp.copilot,
      },
      config = configs.cmp.copilot_cmp,
    },
  },
  config = configs.cmp.setup,
})

-- example of custom plugin
-- plugin({ joinpath(vim.fn.stdpath("config"), "custom_plugin") })

pack.startup(plugins)
