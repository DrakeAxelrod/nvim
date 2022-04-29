---@diagnostic disable: missing-parameter, undefined-field
local packer = pacstrap()
if packer == nil then return end
vim.api.nvim_create_autocmd("BufWritePost", { pattern = "init.lua", command = "source <afile> | PackerSync" })
local use = function(...) packer.use(...) end
--[[----------------------------------------------------------------------]]
---@class Misc table functional modules to improve nvim functionality
local misc = require("modules.misc")
--[[----------------------------------------------------------------------]]
---@https://github.com/wbthomason/packer.nvim
use({ "wbthomason/packer.nvim", opt = true })
---@https://github.com/lewis6991/impatient.nvim
use({ "lewis6991/impatient.nvim" })
---@https://github.com/nathom/filetype.nvim
use({ "nathom/filetype.nvim", config = misc.filetype })
---@https://github.com/nvim-lua/popup.nvim
use({ "nvim-lua/popup.nvim" })
---@https://github.com/rcarriga/nvim-notify
use({ "rcarriga/nvim-notify", config = misc.notify })
---@https://github.com/nvim-lua/plenary.nvim
use({ "nvim-lua/plenary.nvim", event = { "BufRead", "BufNewFile" } })
---@https://github.com/romgrk/fzy-lua-native
use({ "romgrk/fzy-lua-native", opt = true, setup = function() lazyload("fzy-lua-native") end })
---@https://github.com/antoinemadec/FixCursorHold.nvim
use({ "antoinemadec/FixCursorHold.nvim", run = misc.fix_cursor_hold })
---@https://github.com/tami5/sqlite.lua
use({ "tami5/sqlite.lua",
  opt = true,
  setup = function() lazyload("sqlite.lua") end,
  rocks = { "sqlite", "luv" }
})
---@https://github.com/BurntSushi/ripgrep
use({ "BurntSushi/ripgrep",
  opt = true,
  setup = function() lazyload("ripgrep") end,
  event = { "BufRead", "BufNewFile" }
})
---@https://github.com/sharkdp/fd
use({ "sharkdp/fd",
  opt = true,
  setup = function() lazyload("fd") end,
  event = { "BufRead", "BufNewFile" }
})
---@https://github.com/dstein64/vim-startuptime
use({ "dstein64/vim-startuptime", cmd = { "StartupTime" } })
---@https://github.com/echasnovski/mini.nvim
use({ "echasnovski/mini.nvim", config = misc.mini })
--[[----------------------------------------------------------------------]]
---@class Language_Server_Protocol modules that have to do with LSP
local lang = require("modules.lang")
--[[----------------------------------------------------------------------]]
---@https://github.com/zbirenbaum/copilot.lua
use({ "zbirenbaum/copilot.lua",
  event = { "InsertEnter" },
  after = { "lualine.nvim" },
  opt = true,
  setup = function() lazyload("copilot.lua") end,
  config = function()
    vim.defer_fn(function()
      require("copilot").setup()
    end, 100)
  end
})
---@https://github.com/wakatime/vim-wakatime
use({ "wakatime/vim-wakatime",
  opt = true,
  setup = function() lazyload("vim-wakatime") end,
  event = { "BufRead", "BufNewFile" }
})
---@https://github.com/nvim-treesitter/nvim-treesitter
use({ "nvim-treesitter/nvim-treesitter",
  opt = true,
  run = ":TSUpdate",
  event = { "BufRead", "BufNewFile" },
  setup = function() lazyload("nvim-treesitter") end,
  config = lang.treesitter,
})
---@nvim-treesitter/nvim-treesitter-textobjects
use({ "nvim-treesitter/nvim-treesitter-textobjects",
  opt = true,
  setup = function() lazyload("nvim-treesitter-textobjects") end,
  event = { "BufRead", "BufNewFile" },
  after = { "nvim-treesitter" }
})
---@https://github.com/p00f/nvim-ts-rainbow
use({ "p00f/nvim-ts-rainbow",
  opts = true,
  setup = function() lazyload("nvim-ts-rainbow") end,
  event = { "BufRead", "BufNewFile" },
  after = { "nvim-treesitter" }
})
---@https://github.com/JoosepAlviste/nvim-ts-context-commentstring
use({ "JoosepAlviste/nvim-ts-context-commentstring",
  opts = true,
  setup = function() lazyload("nvim-ts-context-commentstring") end,
  event = { "BufRead", "BufNewFile" },
  after = { "nvim-treesitter" }
})
---@https://github.com/windwp/nvim-ts-autotag
use({ "windwp/nvim-ts-autotag",
  opt = true,
  setup = function() lazyload("nvim-ts-autotag") end,
  event = { "InsertEnter" },
  configs = function() require("nvim-ts-autotag").setup({}) end,
  after = { "nvim-treesitter" }
})
---@https://github.com/windwp/nvim-autopairs
use({ "windwp/nvim-autopairs",
  opt = true,
  setup = function() lazyload("nvim-autopairs") end,
  after = { "nvim-treesitter" },
  event = { "InsertEnter" },
  config = lang.autopairs
})
---@https://github.com/neovim/nvim-lspconfig
use({ "neovim/nvim-lspconfig",
  opt = true,
  setup = function() lazyload("nvim-lspconfig") end,
  event = { "BufRead", "BufNewFile" }
})
---@https://github.com/williamboman/nvim-lsp-installer
use({ "williamboman/nvim-lsp-installer",
  opt = true,
  after = { "nvim-lspconfig", "cmp-nvim-lsp", "aerial.nvim", "nvim-lspconfig" },
  event = { "BufRead", "BufNewFile" },
  setup = function() lazyload("nvim-lsp-installer") end,
  config = lang.lsp_installer,
})
---@https://github.com/stevearc/aerial.nvim
use({ "stevearc/aerial.nvim",
  opt = true,
  after = { "nvim-lspconfig", "nvim-web-devicons" },
  config = lang.aerial,
  event = { "BufRead", "BufNewFile" },
  setup = function() lazyload("aerial.nvim") end,
})
---@https://github.com/folke/lua-dev.nvim
use({ "folke/lua-dev.nvim",
  opt = true,
  setup = function() lazyload("lua-dev.nvim") end,
  ft = { "lua" },
  event = { "BufWinEnter", "BufRead", "BufReadPre" },
  after = { "nvim-lspconfig", "plenary.nvim" },
})
---@https://github.com/j-hui/fidget.nvim
use({ "j-hui/fidget.nvim",
  opt = true,
  setup = function() lazyload("fidget.nvim") end,
  event = { "BufWinEnter", "BufRead", "BufReadPre" },
  after = { "nvim-lsp-installer", "nvim-lspconfig", "plenary.nvim" },
  config = lang.fidget,
})
---@https://github.com/numToStr/Comment.nvim
use({ "numToStr/Comment.nvim",
  opt = true,
  setup = function() lazyload("Comment.nvim") end,
  event = { "CursorMoved" },
  disable = false,
  after = { "nvim-ts-context-commentstring" },
  config = lang.comment,
})
---@https://github.com/tpope/vim-repeat
use({ "tpope/vim-repeat",
  opt = true,
  setup = function() lazyload("vim-repeat") end,
  event = { "BufRead", "BufNewFile" },
})
--[[----------------------------------------------------------------------]]
---@class Completion modules that have to do with autocompleteion
local completion = require("modules.completion")
--[[----------------------------------------------------------------------]]
---@https://github.com/gelguy/wilder.nvim
use({ "gelguy/wilder.nvim",
  opt = true,
  setup = function() lazyload("wilder.nvim") end,
  after = { "fzy-lua-native" },
  config = completion.wilder,
})
---@https://github.com/rafamadriz/friendly-snippets
use({ "rafamadriz/friendly-snippets",
  opt = true,
  setup = function() lazyload("friendly-snippets") end,
  event = { "InsertEnter", "CmdlineEnter" },
  after = { "LuaSnip" }
})
---@https://github.com/L3MON4D3/LuaSnip
use({ "L3MON4D3/LuaSnip",
  opt = true,
  setup = function() lazyload("LuaSnip") end,
  event = { "InsertEnter", "CmdlineEnter" },
})
---@https://github.com/hrsh7th/nvim-cmp
use({ "hrsh7th/nvim-cmp",
  event = { "BufRead", "BufReadPre", "InsertEnter" },
  after = { "LuaSnip", "friendly-snippets" },
  config = completion.cmp
})
use({ "hrsh7th/cmp-nvim-lua",
  event = { "BufRead", "BufReadPre", "InsertEnter" },
  after = { "cmp_luasnip", "nvim-cmp" }
})
---@https://github.com/hrsh7th/cmp-nvim-lsp
use({ "hrsh7th/cmp-nvim-lsp",
  event = { "BufRead", "BufReadPre", "InsertEnter" },
  after = { "nvim-lspconfig", "nvim-web-devicons", "cmp-nvim-lua", "nvim-cmp" }
})
---@https://github.com/zbirenbaum/copilot-cmp
use({ "zbirenbaum/copilot-cmp",
  opt = true,
  event = { "BufRead", "BufReadPre", "InsertEnter" },
  after = { "copilot.lua", "nvim-cmp" },
})
---@https://github.com/hrsh7th/cmp-nvim-lsp-signature-help
use({ "hrsh7th/cmp-nvim-lsp-signature-help",
  event = { "BufRead", "BufReadPre", "InsertEnter" },
  after = { "nvim-cmp" },
})

---@https://github.com/hrsh7th/cmp-path
use({ "hrsh7th/cmp-path",
  event = { "BufRead", "BufReadPre", "InsertEnter" },
  after = { "nvim-cmp" }
})
---@https://github.com/hrsh7th/cmp-buffer
use({ "hrsh7th/cmp-buffer",
  event = { "BufRead", "BufReadPre", "InsertEnter" },
  after = { "nvim-cmp" }
})
---@https://github.com/saadparwaiz1/cmp_luasnip
use({ "saadparwaiz1/cmp_luasnip",
  event = { "BufRead", "BufReadPre", "InsertEnter" },
  after = { "nvim-cmp" }
})
--[[----------------------------------------------------------------------]]
---@class Editor modules that have to do with autocompleteion
local editor = require("modules.editor")
--[[----------------------------------------------------------------------]]
---@https://github.com/kyazdani42/nvim-web-devicons
use({ "kyazdani42/nvim-web-devicons" })
---@https://github.com/yamatsum/nvim-nonicons
use({ "yamatsum/nvim-nonicons", after = { "nvim-web-devicons" } })
---@https://github.com/NTBBloodbath/doom-one.nvim
use({ "NTBBloodbath/doom-one.nvim", config = editor.doom_one })
---@https://github.com/phaazon/hop.nvim
use({ "phaazon/hop.nvim",
  opt = true,
  setup = function() lazyload("hop.nvim") end,
  branch = "v1",
  module = "hop",
  event = { "BufRead", "BufReadPre" },
  cmd = { "HopWord", "HopLine", "HopChar1" },
  config = function()
    require("hop").setup({
      keys = "etovxqpdygfblzhckisuran"
    })
  end
})
---@https://github.com/nvim-telescope/telescope.nvim
use({ "nvim-telescope/telescope.nvim",
  opt = true,
  setup = function() lazyload("telescope.nvim") end,
  module = "telescope",
  after = { "fd", "ripgrep", "nvim-web-devicons", "sqlite.lua" },
  requires = { { "nvim-telescope/telescope-fzf-native.nvim", after = { "fzy-lua-native" }, run = "make", opt = true } },
  config = require("modules.editor.telescope.config"),
})
use({ "nvim-telescope/telescope-media-files.nvim", opt = true })
use({ "nvim-telescope/telescope-file-browser.nvim", opt = true })
---@https://github.com/LinArcX/telescope-command-palette.nvim
use({ "LinArcX/telescope-command-palette.nvim", opt = true, after = { "sqlite.lua" } })
---@https://github.com/nvim-telescope/telescope-smart-history.nvim
use({ "nvim-telescope/telescope-smart-history.nvim", opt = true, after = { "sqlite.lua" } })
use({ "nvim-telescope/telescope-github.nvim", opt = true, after = { "plenary.nvim" } })
---@https://github.com/MunifTanjim/nui.nvim
use({ "MunifTanjim/nui.nvim",
  opt = true,
  setup = function() lazyload("nui.nvim") end,
  after = { "nvim-web-devicons" },
})
---@https://github.com/stevearc/dressing.nvim
use({ "stevearc/dressing.nvim",
  opt = true,
  setup = function() lazyload("dressing.nvim") end,
  after = { "nui.nvim" },
  config = editor.dressing,
})
---@https://github.com/nvim-lualine/lualine.nvim
use({ "nvim-lualine/lualine.nvim",
  after = { "nvim-web-devicons" },
  event = { "BufWinEnter" },
  config = function()
    require("modules.editor.lualine")
  end
})
---@https://github.com/folke/which-key.nvim
use({ "folke/which-key.nvim",
  opt = true,
  setup = function() lazyload("which-key.nvim") end,
  event = { "BufRead", "BufNewFile" },
  config = editor.which_key,
})
---@https://github.com/mrjones2014/legendary.nvim
use({ "mrjones2014/legendary.nvim",
  opt = true,
  setup = function() lazyload("legendary.nvim") end,
  event = { "BufRead", "BufNewFile" },
  config = editor.legendary,
})
--[[----------------------------------------------------------------------]]
---@class Git modules that have to do with git
local git = require("modules.git")
--[[----------------------------------------------------------------------]]
---@https://github.com/lewis6991/gitsigns.nvim
use({ "lewis6991/gitsigns.nvim",
  after = { "nvim-treesitter", "plenary.nvim" },
  config = git.gitsigns,
})
---@https://github.com/tpope/vim-fugitive
use({ "tpope/vim-fugitive",
  opt = true,
  setup = function() lazyload("vim-fugitive") end,
})
--[[----------------------------------------------------------------------]]
---@class Boostrap if first time install
--[[----------------------------------------------------------------------]]
if packer.bootstrapped then
  packer.sync()
end
---@info source the compiled plugins
prequire("packer_compiled")
