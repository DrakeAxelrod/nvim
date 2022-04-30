---@diagnostic disable: missing-parameter, undefined-field
local packer = api.mod.pacstrap()
if packer == nil then return end
vim.api.nvim_create_autocmd("BufWritePost", { pattern = "modules.lua", command = "source <afile> | PackerSync" })
local use = function(...)
  packer.use(...)
end

local lazy_use = function(plugin, shortname, timer)
  timer = timer or 0
  plugin.opt = true
  plugin.setup = function() conf.mod.lazy(shortname, timer) end
  packer.use(plugin)
end

conf.mod = {
  configs = {}
}
---protected require a plugins and load and pass a function
---as the set up configuration
---@param name string the name of the plugins (to be required)
---@param path string the folder location of the config
conf.mod.config = function(name, path)
  ---@type table
  local ok, plugin = pcall(require, name)
  if ok then
    ---@type function
    conf.mod.configs[name] = require(("modules.%s.%s"):format(path, name))
    conf.mod.configs[name](plugin)
  else
    vim.notify("Couldn't load plugin: " .. name .. " @" .. path, "error")
  end
end

---packer lazyloader
---@param plugin string
---@param timer number
conf.mod.lazy = function(plugin, timer)
  if plugin then
    timer = timer or 0
    vim.defer_fn(function()
      require("packer").loader(plugin)
    end, timer)
  end
end

conf.mod.load = function()
  --[[----------------------------------------------------------------------]]
  ---@class Misc table functional modules to improve nvim functionality
  --[[----------------------------------------------------------------------]]
  ---@https://github.com/wbthomason/packer.nvim
  use({ "wbthomason/packer.nvim", opt = true })
  ---@https://github.com/lewis6991/impatient.nvim
  use({ "lewis6991/impatient.nvim" })
  ---@https://github.com/nathom/filetype.nvim
  use({ "nathom/filetype.nvim", config = function() require("filetype").setup({}) end})
  ---@https://github.com/nvim-lua/popup.nvim
  use({ "nvim-lua/popup.nvim" })
  ---@https://github.com/rcarriga/nvim-notify
  use({ "rcarriga/nvim-notify", config = function() conf.mod.config("notify", "tools") end})
  ---@https://github.com/nvim-lua/plenary.nvim
  use({ "nvim-lua/plenary.nvim", event = { "BufRead", "BufNewFile" } })
  ---@https://github.com/romgrk/fzy-lua-native
  use({ "romgrk/fzy-lua-native" })
  ---@https://github.com/tami5/sqlite.lua
  use({ "tami5/sqlite.lua", rocks = { "sqlite", "luv" } })
  ---@https://github.com/BurntSushi/ripgrep
  use({ "BurntSushi/ripgrep",
  -- event = { "BufRead", "BufNewFile" }
  })
  ---@https://github.com/sharkdp/fd
  use({ "sharkdp/fd",
  -- event = { "BufRead", "BufNewFile" }
  })
  ---@https://github.com/kyazdani42/nvim-web-devicons
  use({ "kyazdani42/nvim-web-devicons" })
  ---@https://github.com/yamatsum/nvim-nonicons
  use({ "yamatsum/nvim-nonicons", after = { "nvim-web-devicons" } })
  ---@https://github.com/dstein64/vim-startuptime
  use({ "dstein64/vim-startuptime", cmd = { "StartupTime" } })
  ---@https://github.com/echasnovski/mini.nvim
  use({ "echasnovski/mini.nvim", config = function() require("modules.tools.mini") end })
  --[[----------------------------------------------------------------------]]
  ---@class Language_Server_Protocol modules that have to do with LSP
  --[[----------------------------------------------------------------------]]
  ---@https://github.com/zbirenbaum/copilot.lua
  use({ "zbirenbaum/copilot.lua",
    event = { "InsertEnter" },
    after = { "lualine.nvim" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
      end, 100)
    end
  })
  ---@https://github.com/wakatime/vim-wakatime
  use({ "wakatime/vim-wakatime",
    event = { "BufRead", "BufNewFile" }
  })
  ---@https://github.com/nvim-treesitter/nvim-treesitter
  use({ "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    event = { "BufRead", "BufNewFile" },
    config = function() conf.mod.config("nvim-treesitter", "lang") end,
  })
  ---@nvim-treesitter/nvim-treesitter-textobjects
  use({ "nvim-treesitter/nvim-treesitter-textobjects",
    event = { "BufRead", "BufNewFile" },
    after = { "nvim-treesitter" }
  })
  ---@https://github.com/p00f/nvim-ts-rainbow
  use({ "p00f/nvim-ts-rainbow",
    event = { "BufRead", "BufNewFile" },
    after = { "nvim-treesitter" }
  })
  ---@https://github.com/JoosepAlviste/nvim-ts-context-commentstring
  use({ "JoosepAlviste/nvim-ts-context-commentstring",
    event = { "BufRead", "BufNewFile" },
    after = { "nvim-treesitter" }
  })
  ---@https://github.com/windwp/nvim-ts-autotag
  use({ "windwp/nvim-ts-autotag",
    event = { "InsertEnter" },
    configs = function() require("nvim-ts-autotag").setup({}) end,
    after = { "nvim-treesitter" }
  })
  ---@https://github.com/windwp/nvim-autopairs
  use({ "windwp/nvim-autopairs",
    after = { "nvim-treesitter" },
    event = { "InsertEnter" },
    config = function() conf.mod.config("nvim-autopairs", "lang") end,
  })
  ---@https://github.com/neovim/nvim-lspconfig
  use({ "neovim/nvim-lspconfig",
    event = { "BufRead", "BufNewFile" }
  })
  ---@https://github.com/williamboman/nvim-lsp-installer
  use({ "williamboman/nvim-lsp-installer",
    after = { "nvim-lspconfig", "cmp-nvim-lsp", "aerial.nvim", "nvim-lspconfig" },
    event = { "BufRead", "BufNewFile" },
    config = function() conf.mod.config("nvim-lsp-installer", "lang") end,
  })
  ---@https://github.com/stevearc/aerial.nvim
  use({ "stevearc/aerial.nvim",
    after = { "nvim-lspconfig", "nvim-web-devicons" },
    event = { "BufRead", "BufNewFile" },
    config = function() conf.mod.config("aerial", "lang") end,
  })
  ---@https://github.com/folke/lua-dev.nvim
  use({ "folke/lua-dev.nvim",
    ft = { "lua" },
    event = { "BufWinEnter", "BufRead", "BufReadPre" },
    after = { "nvim-lspconfig", "plenary.nvim" },
  })
  ---@https://github.com/j-hui/fidget.nvim
  use({ "j-hui/fidget.nvim",
    event = { "BufWinEnter", "BufRead", "BufReadPre" },
    after = { "nvim-lsp-installer", "nvim-lspconfig", "plenary.nvim" },
    config = function() conf.mod.config("fidget", "lang") end,
  })
  ---@https://github.com/numToStr/Comment.nvim
  use({ "numToStr/Comment.nvim",
    event = { "CursorMoved" },
    disable = false,
    after = { "nvim-ts-context-commentstring" },
    config = function() conf.mod.config("Comment", "lang") end,
  })
  ---@https://github.com/tpope/vim-repeat
  use({ "tpope/vim-repeat", event = { "BufRead", "BufNewFile" } })
  --[[----------------------------------------------------------------------]]
  ---@class Completion modules that have to do with autocompleteion
  --[[----------------------------------------------------------------------]]
  ---@https://github.com/gelguy/wilder.nvim
  use({ "gelguy/wilder.nvim",
    after = { "fzy-lua-native" },
    config = function() conf.mod.config("wilder", "completion") end,
  })
  ---@https://github.com/rafamadriz/friendly-snippets
  use({ "rafamadriz/friendly-snippets",
    event = { "InsertEnter", "CmdlineEnter" },
    after = { "LuaSnip" }
  })
  ---@https://github.com/L3MON4D3/LuaSnip
  use({ "L3MON4D3/LuaSnip", event = { "InsertEnter", "CmdlineEnter" } })
  ---@https://github.com/hrsh7th/nvim-cmp
  use({ "hrsh7th/nvim-cmp",
    event = { "BufRead", "BufReadPre", "InsertEnter" },
    after = { "LuaSnip", "friendly-snippets" },
    config = function() conf.mod.config("cmp", "completion") end,
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
  --[[----------------------------------------------------------------------]]
  ---@https://github.com/NTBBloodbath/doom-one.nvim
  use({ "NTBBloodbath/doom-one.nvim",
    config = function()
      conf.mod.config("doom-one", "editor")
    end
  })
  ---@https://github.com/phaazon/hop.nvim
  use({ "phaazon/hop.nvim",
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
    -- module = "telescope",
    after = { "fd", "ripgrep", "nvim-web-devicons", "sqlite.lua", "telescope-fzf-native.nvim" },
    config = function() conf.mod.config("telescope", "editor") end,
  })
  use({ "nvim-telescope/telescope-fzf-native.nvim", after = { "fzy-lua-native" }, run = "make" })
  use({ "nvim-telescope/telescope-media-files.nvim" })
  use({ "nvim-telescope/telescope-file-browser.nvim"  })
  ---@https://github.com/LinArcX/telescope-command-palette.nvim
  use({ "LinArcX/telescope-command-palette.nvim", after = { "sqlite.lua" } })
  ---@https://github.com/nvim-telescope/telescope-smart-history.nvim
  use({ "nvim-telescope/telescope-smart-history.nvim", after = { "sqlite.lua" } })
  use({ "nvim-telescope/telescope-github.nvim", after = { "plenary.nvim" } })
  ---@https://github.com/MunifTanjim/nui.nvim
  use({ "MunifTanjim/nui.nvim", after = { "nvim-web-devicons" } })
  ---@https://github.com/stevearc/dressing.nvim
  use({ "stevearc/dressing.nvim", after = { "nui.nvim" },
    config = function() conf.mod.config("dressing", "editor") end,
  })
  ---@https://github.com/nvim-lualine/lualine.nvim
  use({ "nvim-lualine/lualine.nvim",
    after = { "nvim-web-devicons" },
    event = { "BufWinEnter" },
    config = function()
      conf.mod.config("lualine", "editor")
    end
  })
  ---@https://github.com/folke/which-key.nvim
  use({ "folke/which-key.nvim",
    disable = true,
    -- event = { "BufRead", "BufNewFile" },
    config = function()
      conf.mod.config("which-key", "editor")
    end,
  })
  ---@https://github.com/mrjones2014/legendary.nvim
  use({ "mrjones2014/legendary.nvim",
    -- event = { "BufRead", "BufNewFile" },
    config = function()
      conf.mod.config("legendary", "editor")
    end,
  })
  -- ---@https://github.com/kyazdani42/nvim-tree.lua
  -- use({"kyazdani42/nvim-tree.lua",
  --   cmd = { "NvimTreeToggle", "NvimTreeFindFile" },
  --   after = { "nvim-web-devicons" },
  --   config = editor.nvim_tree
  -- })
  --[[----------------------------------------------------------------------]]
  ---@class Git modules that have to do with git
  --[[----------------------------------------------------------------------]]
  ---@https://github.com/lewis6991/gitsigns.nvim
  use({ "lewis6991/gitsigns.nvim",
    after = { "nvim-treesitter", "plenary.nvim" },
    config = function() conf.mod.config("gitsigns", "git") end,
  })
  ---@https://github.com/tpope/vim-fugitive
  use({ "tpope/vim-fugitive",
    -- opt = true,
    -- setup = function() lazyload("vim-fugitive") end,
  })
  --[[----------------------------------------------------------------------]]
  ---@class Boostrap if first time install
  --[[----------------------------------------------------------------------]]
  if packer.bootstrapped then
    packer.sync()
  end
  ---@info source the compiled plugins
  pcall(require, "packer_compiled")
end
