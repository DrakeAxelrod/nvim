local M = {}
local lang = require("modules.lang")
local misc = require("modules.misc")
local completion = require("modules.completion")
local editor = require("modules.editor")
local git = require("modules.git")

-- local grp = vim.api.nvim_create_augroup("Packer", { clear = true })
-- vim.api.nvim_create_autocmd("BufWritePost", {
--   command = "source <afile> | PackerCompile",
--   group = grp,
--   pattern = "init.lua"
-- })

--[[----------------------------------------------------------------------]]
---@class Misc table functional modules to improve nvim functionality
--[[----------------------------------------------------------------------]]
---Speed up loading Lua modules in Neovim to improve startup time.
---@alias impatient.nvim Module
---@https://github.com/lewis6991/impatient.nvim
M["lewis6991/impatient.nvim"] = { disable = false }
---This plugin is a replacement for the included filetype.vim that is sourced on startup.
--- * It is a modified version of the original filetype.vim that is included in the nvim source.
--- * This method is ~175x faster*!
---@alias filetype.nvim Module
---@https://github.com/nvim-lua/plenary.nvim
M["nathom/filetype.nvim"] = {
  disable = false,
  config = misc.filetype,
  after = { "impatient.nvim" },
}
---A fancy, configurable, notification manager for NeoVim.
---@alias nvim_notify Module
---@https://github.com/nvim-lua/plenary.nvim
M["rcarriga/nvim-notify"] = {
  disable = false,
  -- after = { "impatient.nvim" },
  requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
  config = misc.notify(),
}
---All the lua functions you don't want to write twice.
---@alias plenary Module
---@https://github.com/nvim-lua/plenary.nvim
M["nvim-lua/plenary.nvim"] = {
  disable = false,
  after = { "impatient.nvim" },
  event = { "BufRead", "BufNewFile" }
}
---Luajit FFI bindings to FZY.
---@alias fyz_lua_native Module
---@https://github.com/romgrk/fzy-lua-native
M["romgrk/fzy-lua-native"] = {
  disable = false,
  after = { "impatient.nvim" },
}

M["tami5/sqlite.lua"] = {
  rocks = { "sqlite", "luv" }
}
---ripgrep is a line-oriented search tool that recursively searches the current directory for a regex pattern.
---@alias ripgrep Module
---@https://github.com/BurntSushi/ripgrep
M["BurntSushi/ripgrep"] = {
  disable = false,
  after = { "impatient.nvim" },
  event = { "BufRead", "BufNewFile" }
}
---fd is a program to find entries in your filesystem. It is a simple, fast and user-friendly alternative to find.
---@alias fd Module
---@https://github.com/sharkdp/fd
M["sharkdp/fd"] = {
  disable = false,
  after = { "impatient.nvim" },
  event = { "BufRead", "BufNewFile" }
}
---Collection of minimal, independent, and fast Lua modules
---dedicated to improve Neovim (version 0.5 and higher) experience.
---@alias mini Module
---@https://github.com/echasnovski/mini.nvim
M["echasnovski/mini.nvim"] = {
  disable = false,
  config = misc.mini,
}
--[[----------------------------------------------------------------------]]
---@class Language_Server_Protocol modules that have to do with LSP
--[[----------------------------------------------------------------------]]
---@alias copilot.lua Module
---@https://github.com/zbirenbaum/copilot.lua
M["zbirenbaum/copilot.lua"] = {
  event = { "VimEnter" },
  config = lang.copilot
}
---@alias vim_wakatime Module
---@https://github.com/wakatime/vim-wakatime
M["wakatime/vim-wakatime"] = {
  disable = false,
  after = { "impatient.nvim" },
  event = { "BufRead", "BufNewFile" }
}
---@alias nvim_ts_rainbow Module
---@https://github.com/p00f/nvim-ts-rainbow
M["p00f/nvim-ts-rainbow"] = {
  disable = true,
  -- after = { "impatient.nvim" },
  -- event = { "BufRead", "BufNewFile" }
}
---@alias nvim_treesitter Module
---@https://github.com/nvim-treesitter/nvim-treesitter
M["nvim-treesitter/nvim-treesitter"] = {
  disable = false,
  run = ":TSUpdate",
  after = { "impatient.nvim" },
  event = { "BufRead", "BufNewFile" },
  config = lang.treesitter,
}
---@alias nvim_ts_context_commentstring Module
---@https://github.com/JoosepAlviste/nvim-ts-context-commentstring
M["JoosepAlviste/nvim-ts-context-commentstring"] = {
  disable = false,
  -- event = { "BufRead", "BufNewFile" },
  after = { "impatient.nvim" }
}
---@alias nvim_autopairs Module
---@https://github.com/windwp/nvim-autopairs
M["windwp/nvim-autopairs"] = {
  disable = false,
  event = { "InsertEnter" },
  after = { "impatient.nvim" },
  config = lang.autopairs
}
---@alias nvim_ts_autotag Module
---@https://github.com/windwp/nvim-ts-autotag
M["windwp/nvim-ts-autotag"] = {
  disable = false,
  event = { "InsertEnter" },
  after = { "impatient.nvim" },
  configs = lang.autotags,
}
---@alias nvim_lspconfig Module
---@https://github.com/neovim/nvim-lspconfig
M["neovim/nvim-lspconfig"] = {
  disable = false,
  after = { "impatient.nvim" },
  event = { "BufRead", "BufNewFile" }
}
---@alias nvim_lsp_installer Module
---@https://github.com/williamboman/nvim-lsp-installer
M["williamboman/nvim-lsp-installer"] = {
  disable = false,
  after = { "impatient.nvim", "nvim-lspconfig", "cmp-nvim-lsp", "aerial.nvim" },
  requires = "neovim/nvim-lspconfig",
  config = lang.nvim_lsp_installer,
}

---@https://github.com/ojroques/nvim-lspfuzzy
M["ojroques/nvim-lspfuzzy"] = {
  disable = true,
  requires = {
    { "junegunn/fzf" },
    { "junegunn/fzf.vim" }, -- to enable preview (optional)
  },
  config = function()
    require('lspfuzzy').setup({})
  end,
  after = { "impatient.nvim", "nvim-lspconfig" },
}
---@alias lsp_signature.nvim Module
---@https://github.com/ray-x/lsp_signature.nvim
M["ray-x/lsp_signature.nvim"] = {
  disable = true,
  event = {
    "BufWinEnter",
    "BufRead",
    "BufReadPre",
  },
  after = { "impatient.nvim" },
  requires = { "nvim-lspconfig" },
  config = lang.lsp_signature,
}
---@alias aerial.nvim Module
M["stevearc/aerial.nvim"] = {
  disable = false,
  after = { "nvim-lspconfig", "nvim-web-devicons", "impatient.nvim" },
  config = lang.aerial,
}
---@alias lua_dev.nvim Module
---@https://github.com/folke/lua-dev.nvim
M["folke/lua-dev.nvim"] = {
  disable = false,
  ft = { "lua" },
  event = {
    "BufWinEnter",
    "BufRead",
    "BufReadPre",
  },
  after = { "impatient.nvim" },
  requires = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" },
}
---@alias fidget.nvim Module
M["j-hui/fidget.nvim"] = {
  disable = false,
  event = {
    "BufWinEnter",
    "BufRead",
    "BufReadPre",
  },
  after = { "nvim-lsp-installer", "impatient.nvim" },
  config = lang.fidget,
}
---@alias nvim_lightbulb Module
---@https://github.com/kosayoda/nvim-lightbulb
M["kosayoda/nvim-lightbulb"] = {
  disable = true,
  after = { "nvim-lsp-installer", "impatient.nvim" }
}
---@alias Comment.nvim Module
---@https://github.com/numToStr/Comment.nvim
M["numToStr/Comment.nvim"] = {
  event = { "CursorMoved" },
  disable = false,
  after = { "nvim-ts-context-commentstring", "impatient.nvim" },
  config = lang.comment,
}
---@alias surround.nvim Module
-- M["ur4ltz/surround.nvim"] = {
--   disable = true,
--   event = { "BufRead", "BufNewFile" },
--   after = { "impatient.nvim" }
-- }
-- M["Mephistophiles/surround.nvim"] = {
--   disable = true,
--   event = { "BufRead", "BufNewFile" },
--   after = { "impatient.nvim" }
-- }
---@alias vim_surround Module
M["tpope/vim-surround"] = {
  disable = true,
  event = { "BufRead", "BufNewFile" },
  after = { "impatient.nvim" }
}
---@alias vim_repeat Module
M["tpope/vim-repeat"] = {
  disable = false,
  event = { "BufRead", "BufNewFile" },
  after = { "impatient.nvim" }
}
---@alias indent_blankline.nvim Module
---@https://github.com/lukas-reineke/indent-blankline.nvim
M["lukas-reineke/indent-blankline.nvim"] = {
  disable = true,
  event = { "BufRead", "BufNewFile" },
  after = { "impatient.nvim" },
  config = lang.indent_blankline,
}
--[[----------------------------------------------------------------------]]
---@class Completion modules that have to do with autocompleteion
--[[----------------------------------------------------------------------]]
---@alias wilder.nvim Module
---@https://github.com/gelguy/wilder.nvim
---TODO checkout https://github.com/notomo/cmdbuf.nvim
M["gelguy/wilder.nvim"] = {
  disable = false,
  requires = { "romgrk/fzy-lua-native" },
  config = completion.wilder,
}
-- LineNr         xxx ctermfg=11 guifg=#3f444a guibg=#282c34
---@alias LuaSnip Module
---@https://github.com/L3MON4D3/LuaSnip
M["L3MON4D3/LuaSnip"] = {
  disable = false,
  requires = {
    {
      disable = false,
      "rafamadriz/friendly-snippets",
      event = { "InsertEnter", "CmdlineEnter" },
      after = { "impatient.nvim", "LuaSnip" }
    },
  },
  after = { "impatient.nvim" }
}
---@alias nvim_cmp Module
---@https://github.com/hrsh7th/nvim-cmp
M["hrsh7th/nvim-cmp"] = {
  disable = false,
  event = {
    "BufRead",
    "BufReadPre",
    "InsertEnter",
  },
  after = { "impatient.nvim", },
  requires = { "L3MON4D3/LuaSnip", "rafamadriz/friendly-snippets"},
  config = completion.cmp
}
---@https://github.com/hrsh7th/cmp-nvim-lsp
M["hrsh7th/cmp-nvim-lsp"] = {
  disable = false,
  event = {
    "BufRead",
    "BufReadPre",
    "InsertEnter",
  },
  after = { "nvim-lspconfig", "nvim-web-devicons", "impatient.nvim" }
}
M["zbirenbaum/copilot-cmp"] = {
  disable = false,
  event = {
    "BufRead",
    "BufReadPre",
    "InsertEnter",
    },
    after = { "copilot.lua", "nvim-cmp", "impatient.nvim" },
}

---@https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
M["hrsh7th/cmp-nvim-lsp-signature-help"] = {
  disable = false,
  event = {
    "BufRead",
    "BufReadPre",
    "InsertEnter",
  },
  after = { "nvim-cmp", "impatient.nvim" },
}

---@https://github.com/hrsh7th/cmp-path
M["hrsh7th/cmp-path"] = {
  disable = false,
  event = {
    "BufRead",
    "BufReadPre",
    "InsertEnter",
  },
  after = { "nvim-cmp", "impatient.nvim" }
}
---@https://github.com/hrsh7th/cmp-buffer
M["hrsh7th/cmp-buffer"] = {
  disable = false,
  event = {
    "BufRead",
    "BufReadPre",
    "InsertEnter",
  },
  after = { "nvim-cmp", "impatient.nvim" }
}
M["saadparwaiz1/cmp_luasnip"] = {
  disable = false,
  event = {
    "BufRead",
    "BufReadPre",
    "InsertEnter",
  },
  after = { "nvim-cmp", "impatient.nvim" }
}

M["hrsh7th/cmp-cmdline"] = {
  disable = true,
  event = {
    "BufRead",
    "BufReadPre",
    "InsertEnter",
  },
  after = { "nvim-cmp", "impatient.nvim" }
}
--[[----------------------------------------------------------------------]]
---@class Editor modules that have to do with autocompleteion
--[[----------------------------------------------------------------------]]

---A lua fork of vim-devicons. This plugin provides the same icons as well as colors for each icon.
---@alias nvim_web_devicons Module
---@https://github.com/kyazdani42/nvim-web-devicons
M["kyazdani42/nvim-web-devicons"] = {
  disable = false,
  after = { "impatient.nvim" },
  before = { "yamatsum/nvim-nonicons" }
}
---Icon set for neovim plugins and settings. Collection of configurations for nvim-web-devicons.
---@alias nvim_nonicons Module
---@https://github.com/yamatsum/nvim-nonicons
M["yamatsum/nvim-nonicons"] = {
  disable = false,
  requires = { "kyazdani42/nvim-web-devicons" },
  after = { "impatient.nvim" }
}

M["NTBBloodbath/doom-one.nvim"] = {
  disable = false,
  config = editor.doom_one,
  after = { "impatient.nvim" }
}
---@https://github.com/rktjmp/lush.nvim
M["rktjmp/lush.nvim"] = {
  disable = false,
  after = { "impatient.nvim", "nvim-treesitter" }
}
---Smooth scrolling for any movement command in Neovim.
---@alias cinnamon.nvim Module
---@https://github.com/declancm/cinnamon.nvim
M["declancm/cinnamon.nvim"] = {
  disable = true,
  after = { "impatient.nvim" },
  event = { "BufRead", "BufNewFile" }
}
---@alias AutoSave.nvim Module
---@https://github.com/Pocco81/AutoSave.nvim
M["Pocco81/AutoSave.nvim"] = {
  disable = true,
  event = { "TextChanged", "TextChangedI" },
  after = { "impatient.nvim" }
}
---@alias hop.nvim Module
---@https://github.com/phaazon/hop.nvim
M["phaazon/hop.nvim"] = {
  disable = false,
  branch = "v1",
  module = "hop",
  event = {
    "BufRead",
    "BufReadPre",
  },
  cmd = { "HopWord", "HopLine", "HopChar1" },
  config = editor.hop,
  after = { "impatient.nvim" }
}
---@alias lightspeed.nvim Module
---@https://github.com/ggandor/lightspeed.nvim
M["ggandor/lightspeed.nvim"] = {
  disable = true,
  event = {
    "BufRead",
    "BufReadPre",
  },
  after = { "impatient.nvim" }
}
---@https://github.com/nvim-telescope/telescope.nvim
---@https://github.com/LinArcX/telescope-command-palette.nvim
---@https://github.com/nvim-telescope/telescope-smart-history.nvim
M["nvim-telescope/telescope.nvim"] = {
  disable = false,
  module = "telescope",
  after = { "fd", "ripgrep", "nvim-web-devicons", "impatient.nvim", "sqlite.lua" },
  requires = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      disable = false,
      requires = { "romgrk/fzy-lua-native" },
      run = "make",
      -- opt = true,
      after = { "impatient.nvim" }
    },
    {
      "nvim-telescope/telescope-media-files.nvim",
      disable = false,
      -- opt = true,
      after = { "impatient.nvim" }
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      disable = false,
      -- opt = true,
      after = { "impatient.nvim" }
    },
    {
      "LinArcX/telescope-command-palette.nvim",
      requires = { "nvim-telescope/telescope.nvim", { "tami5/sqlite.lua", rocks = { "sqlite", "luv" } } },
      after = { "impatient.nvim" }
    },
    {
      "nvim-telescope/telescope-smart-history.nvim",
      disable = false,
      -- opt = true,
      requires = { "tami5/sqlite.lua", rocks = { "sqlite", "luv" } },
      after = { "impatient.nvim" }
    },
    {
      "nvim-telescope/telescope-github.nvim",
      disable = false,
      -- opt = true,
      requires = { "plenary.nvim"},
      after = "impatient.nvim",
    }
  },
  config = require("modules.editor.telescope.config")
}
M["stevearc/dressing.nvim"] = {
  disable = false,
  requires = { "MunifTanjim/nui.nvim" },
  after = { "impatient.nvim" },
  config = editor.dressing,
}
---@alias nvim_spectre Module
---@https://github.com/windwp/nvim-spectre
M["nvim-pack/nvim-spectre"] = {
  disable = true,
  module = "spectre",
  after = { "ripgrep", "plenary.nvim", "impatient.nvim" }
}
---@alias nvim_tree.lua Module
---@https://github.com/kyazdani42/nvim-tree.lua
M["kyazdani42/nvim-tree.lua"] = {
  disable = false,
  cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
  after = { "nvim-web-devicons", "impatient.nvim" },
  config = editor.nvim_tree
}
---@alias toggleterm.nvim Module
---@https://github.com/akinsho/nvim-toggleterm.lua
M["akinsho/toggleterm.nvim"] = {
  disable = true,
  module = "toggleterm",
  after = { "impatient.nvim" }
}
M["nvim-lualine/lualine.nvim"] = {
  disable = true,
  requires = "kyazdani42/nvim-web-devicons",
  event = {
    "BufWinEnter",
  },
  config = editor.lualine,
}

M["ojroques/nvim-hardline"] = {
  disable = false,
  requires = "kyazdani42/nvim-web-devicons",
  after = { "impatient.nvim" },
  config = editor.hardline
}

---@alias vim_visual_multi Module
M["mg979/vim-visual-multi"] = {
  disable = true,
  event = { "BufRead", "BufNewFile" },
  after = { "impatient.nvim" }
}
---@alias which_key.nvim Module
---@https://github.com/folke/which-key.nvim
M["folke/which-key.nvim"] = {
  disable = false,
  event = { "BufRead", "BufNewFile" },
  after = { "impatient.nvim" },
  config = editor.which_key,
}
---@alias legendary.nvim Module
---@https://github.com/mrjones2014/legendary.nvim
M["mrjones2014/legendary.nvim"] = {
  disable = false,
  -- event = { "BufRead", "BufNewFile" },
  after = { "impatient.nvim" },
  config = editor.legendary,
}
---@alias venn.nvim Module
M["jbyuki/venn.nvim"] = {
  disable = true,
  module = "venn",
  after = { "impatient.nvim" }
}
---@https://github.com/breuckelen/vim-resize
---@info you added it directly to plugins with modifications
-- M["breuckelen/vim-resize"] = {
--   disable = false,
--   after = { "impatient.nvim" }
-- }

---@alias vim_startuptime Module
M["dstein64/vim-startuptime"] = {
  disable = false,
  cmd = { "StartupTime" },
}
--[[----------------------------------------------------------------------]]
---@class Git modules that have to do with git
--[[----------------------------------------------------------------------]]
---
M["lewis6991/gitsigns.nvim"] = {
    disable = false,
    after = {"nvim-treesitter", "plenary.nvim", "impatient.nvim"},
    -- config = git.gitsigns,
}
M["tpope/vim-fugitive"] = {
  disable = false,
  after = { "impatient.nvim" }
}

return M
