local M = {}
local system = require "modules.conf.system"
local ui = require "modules.conf.ui"
local editor = require "modules.conf.editor"
local git = require "modules.conf.vcs"
local langs = require "modules.conf.langs"
local completion = require "modules.conf.completion"

------------------
----> system <----
------------------

-- speed up require
M["lewis6991/impatient.nvim"] = {}

-- useful functions
M["nvim-lua/plenary.nvim"] = {}

-- popups
M["nvim-lua/popup.nvim"] = {}

-- icons
M["kyazdani42/nvim-web-devicons"] = {}

-- icons
M["yamatsum/nvim-nonicons"] = {
  requires = { "kyazdani42/nvim-web-devicons" },
}

-- notifications
M["rcarriga/nvim-notify"] = {
  config = system.nvim_notify,
  requires = { "nvim-lua/popup.nvim", "nvim-lua/plenary.nvim" },
}

-- filetype.lua instead of filetype.vim (much faster)
M["nathom/filetype.nvim"] = {}

--------------
----> ui <----
--------------

M["nvim-lualine/lualine.nvim"] = {
  requires = "kyazdani42/nvim-web-devicons",
  event = {
    "BufWinEnter",
  },
  -- config = ui.lualine,
}

M["goolord/alpha-nvim"] = {
  event = "VimEnter",
  config = ui.alpha_nvim,
}

M["folke/which-key.nvim"] = {
  -- event = "BufWinEnter",
  config = ui.which_key,
}

M["lukas-reineke/indent-blankline.nvim"] = {
  event = {
    "BufRead",
    "BufReadPre",
  },
  config = ui.indent_blankline,
}

-- M["navarasu/onedark.nvim"] = {
--   config = require("onedark").setup()
-- }
-- M["kdheepak/monochrome.nvim"] = {
--   config = function()
--     pcall(vim.cmd, "colorscheme monochrome")
--   end,
-- }
M["mcchrish/zenbones.nvim"] = {
  config = function()
    vim.cmd "colorscheme zenwritten"
  end,
  requires = { "rktjmp/lush.nvim" },
}
-- M["catppuccin/nvim"] = {}
-- M["olimorris/onedarkpro.nvim"] = {
--  config = function()
--    pcall(vim.cmd, "colorscheme onedarkpro")
--  end,
-- }
-- M["navarasu/onedark.nvim"] = {}
-- M["NTBBloodbath/doom-one.nvim"] = {}

------------------
----> editor <----
------------------

M["tpope/vim-surround"] = {
  event = {
    "BufRead",
    "BufReadPre",
  },
}

M["mrjones2014/smart-splits.nvim"] = {
  config = editor.smart_splits,
}
M["ggandor/lightspeed.nvim"] = {
  event = {
    "BufRead",
    "BufReadPre",
  },
}

M["numToStr/Comment.nvim"] = {
  event = {
    "CursorMoved",
  },
  config = editor.nvim_comment,
}

M["nvim-telescope/telescope-packer.nvim"] = {}
M["nvim-telescope/telescope-smart-history.nvim"] = {
  opt = true,
  requiires = { "tami5/sqlite.lua", rocks = { "sqlite", "luv" } },
}
M["nvim-telescope/telescope-github.nvim"] = {
  opt = true,
  requires = { "nvim-lua/plenary.nvim" },
}
-- {
--  "nvim-telescope/telescope-ui-select.nvim",
--  opt = true,
-- },
-- {
--  "nvim-telescope/telescope-hop.nvim",
--  opt = true,
-- },
M["nvim-telescope/telescope.nvim"] = {
  requires = {
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      requires = { "romgrk/fzy-lua-native" },
      run = "make",
      opt = true,
    },
    {
      "nvim-telescope/telescope-media-files.nvim",
      opt = true,
    },
    {
      "nvim-telescope/telescope-file-browser.nvim",
      opt = true,
    },
  },
  config = editor.telescope,
}

---------------------------------
----> git (version control) <----
---------------------------------

-----------------
----> langs <----
-----------------

M["simrat39/symbols-outline.nvim"] = {
  cmd = "SymbolsOutline",
  config = langs.symbols_outline,
}

M["nvim-treesitter/nvim-treesitter"] = {
  event = {
    "BufRead",
    "BufReadPre",
  },
  run = ":TSUpdate",
  config = langs.nvim_treesitter,
}

M["neovim/nvim-lspconfig"] = {
  event = {
    "BufWinEnter",
    "BufRead",
    "BufReadPre",
  },
  config = langs.nvim_lspconfig,
}

M["j-hui/fidget.nvim"] = {
  event = {
    "BufWinEnter",
    "BufRead",
    "BufReadPre",
  },
  config = langs.fidget,
}

M["folke/lua-dev.nvim"] = {
  event = {
    "BufWinEnter",
    "BufRead",
    "BufReadPre",
  },
  requires = { "neovim/nvim-lspconfig", "nvim-lua/plenary.nvim" },
}

M["williamboman/nvim-lsp-installer"] = {
  requires = "neovim/nvim-lspconfig",
  config = langs.nvim_lsp_installer,
}

-- modules["lvim-tech/rust-tools.nvim"] = {
--  branch = "silent_aucommand_codelens",
--  ft = "rust",
--  after = "telescope.nvim",
--  requires = {
--    "neovim/nvim-lspconfig",
--    "nvim-lua/popup.nvim",
--    "nvim-lua/plenary.nvim",
--    "mfussenegger/nvim-dap",
--    "nvim-telescope/telescope.nvim",
--  },
-- }

-- modules["ray-x/go.nvim"] = {
--  ft = "go",
--  config = languages_config.go,
-- }

-- modules["akinsho/flutter-tools.nvim"] = {
--  ft = "dart",
--  requires = "nvim-lua/plenary.nvim",
-- }

-- modules["jose-elias-alvarez/nvim-lsp-ts-utils"] = {
--  ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
--  requires = {
--    "neovim/nvim-lspconfig",
--    "nvim-lua/plenary.nvim",
--  },
-- }

-- modules["michaelb/sniprun"] = {
--  requires = "neovim/nvim-lspconfig",
--  run = "bash ./install.sh",
--  cmd = {
--    "SnipRun",
--    "SnipInfo",
--    "SnipReset",
--    "SnipReplMemoryClean",
--    "SnipClose",
--  },
--  config = languages_config.sniprun,
-- }

------------------
--> completion <--
------------------

M["gelguy/wilder.nvim"] = {
  requires = { "romgrk/fzy-lua-native" },
  config = completion.wilder,
}

M["hrsh7th/nvim-cmp"] = {
  requires = {
    {
      "hrsh7th/cmp-nvim-lsp",
    },
    {
      "saadparwaiz1/cmp_luasnip",
      after = "nvim-cmp",
    },
    {
      "hrsh7th/cmp-buffer",
      after = "nvim-cmp",
    },
    {
      "hrsh7th/cmp-path",
      after = "nvim-cmp",
    },
  },
  event = {
    "BufRead",
    "BufReadPre",
    "InsertEnter",
  },
  config = completion.nvim_cmp,
}

M["L3MON4D3/LuaSnip"] = {
  requires = {
    {
      "rafamadriz/friendly-snippets",
      after = "LuaSnip",
    },
  },
}

M["github/copilot.vim"] = {
  config = completion.github_copilot,
}

------------
--> misc <--
------------

M["wakatime/vim-wakatime"] = {}

return M

-- M["navarasu/onedark.nvim"] = {}

-- modules["goolord/alpha-nvim"] = {
--  event = "VimEnter",
--  config = ui_config.alpha_nvim,
-- }

-- modules["folke/which-key.nvim"] = {
--  event = "BufWinEnter",
--  config = ui_config.which_key,
-- }

-- modules["akinsho/toggleterm.nvim"] = {
--  cmd = {
--    "TTFloat",
--    "TTOne",
--    "TTTwo",
--    "TTThree",
--  },
--  config = ui_config.toggleterm,
-- }

-- modules["lukas-reineke/indent-blankline.nvim"] = {
--  event = {
--    "BufRead",
--    "BufReadPre",
--  },
--  config = ui_config.indent_blankline,
-- }

--> Editor

-- local editor_config = require("modules.global.configs.editor")

-- modules["vim-ctrlspace/vim-ctrlspace"] = {
--  cmd = "CtrlSpace",
-- }

-- modules["nanozuki/tabby.nvim"] = {
--  config = editor_config.tabby,
--  after = "vim-ctrlspace",
-- }

-- M["nvim-telescope/telescope.nvim"] = {
--  requires = {
--    {
--      "nvim-telescope/telescope-fzf-native.nvim",
--      run = "make",
--      opt = true,
--    },
--    {
--      "nvim-telescope/telescope-media-files.nvim",
--      opt = true,
--    },
--    {
--      "nvim-telescope/telescope-file-browser.nvim",
--      opt = true,
--    },
--    -- {
--    --  "camgraff/telescope-tmux.nvim",
--    --  opt = true,
--    -- },
--  },
--  -- config = editor_config.telescope,
-- }

-- modules["lvim-tech/lvim-move"] = {
--  event = {
--    "BufRead",
--    "BufReadPre",
--  },
--  config = editor_config.lvim_move,
-- }

-- M["numToStr/Comment.nvim"] = {
--  event = {
--    "CursorMoved",
--  },
--  -- config = editor_config.nvim_comment,
-- }

-- modules["windwp/nvim-autopairs"] = {
--  after = {
--    "nvim-treesitter",
--    "nvim-cmp",
--  },
--  config = editor_config.nvim_autopairs,
-- }

-- modules["tpope/vim-surround"] = {
--  event = {
--    "BufRead",
--    "BufReadPre",
--  },
-- }

-- modules["norcalli/nvim-colorizer.lua"] = {
--  event = {
--    "BufRead",
--    "BufReadPre",
--  },
--  config = editor_config.nvim_colorize,
-- }

-- modules["declancm/cinnamon.nvim"] = {
--  event = {
--    "BufRead",
--    "BufReadPre",
--  },
--  config = editor_config.cinnamon,
-- }

-- modules["lambdalisue/suda.vim"] = {
--  event = {
--    "BufRead",
--    "BufReadPre",
--  },
--  config = editor_config.suda,
-- }

-- modules["kenn7/vim-arsync"] = {
--  event = {
--    "BufRead",
--    "BufReadPre",
--  },
-- }

-- modules["phaazon/hop.nvim"] = {
--  event = {
--    "BufRead",
--    "BufReadPre",
--  },
--  branch = "v1",
--  config = editor_config.hop,
-- }

-- modules["folke/todo-comments.nvim"] = {
--  requires = "nvim-lua/plenary.nvim",
--  event = {
--    "BufRead",
--    "BufReadPre",
--  },
--  config = editor_config.todo_comments,
-- }

-- modules["anuvyklack/pretty-fold.nvim"] = {
--  event = {
--    "BufRead",
--    "BufReadPre",
--  },
--  config = editor_config.pretty_fold,
-- }

--> Version control

-- local version_control_config = require("modules.global.configs.version_control")

-- modules["TimUntersberger/neogit"] = {
--  requires = "nvim-lua/plenary.nvim",
--  cmd = "Neogit",
--  config = version_control_config.neogit,
-- }

-- modules["lewis6991/gitsigns.nvim"] = {
--  requires = "nvim-lua/plenary.nvim",
--  event = {
--    "BufRead",
--    "BufReadPost",
--    "BufReadPre",
--  },
--  config = version_control_config.gitsigns,
-- }

-- modules["f-person/git-blame.nvim"] = {
--  event = {
--    "BufRead",
--    "BufReadPost",
--    "BufReadPre",
--  },
--  config = version_control_config.git_blame,
-- }

-- modules["sindrets/diffview.nvim"] = {
--  cmd = {
--    "DiffviewOpen",
--    "DiffviewFileHistory",
--    "DiffviewFocusFiles",
--    "DiffviewToggleFiles",
--    "DiffviewRefresh",
--  },
-- }

-- modules["mbbill/undotree"] = {
--  event = {
--    "BufRead",
--    "BufReadPre",
--  },
--  cmd = "UndotreeToggle",
-- }

--> langs

-- local languages_config = require("modules.global.configs.languages")

-- modules["neovim/nvim-lspconfig"] = {
--  event = {
--    "BufWinEnter",
--    "BufRead",
--    "BufReadPre",
--  },
--  config = languages_config.nvim_lspconfig,
-- }

-- modules["williamboman/nvim-lsp-installer"] = {
--  requires = "neovim/nvim-lspconfig",
--  config = languages_config.nvim_lsp_installer,
-- }

-- modules["lvim-tech/rust-tools.nvim"] = {
--  branch = "silent_aucommand_codelens",
--  ft = "rust",
--  after = "telescope.nvim",
--  requires = {
--    "neovim/nvim-lspconfig",
--    "nvim-lua/popup.nvim",
--    "nvim-lua/plenary.nvim",
--    "mfussenegger/nvim-dap",
--    "nvim-telescope/telescope.nvim",
--  },
-- }

-- modules["ray-x/go.nvim"] = {
--  ft = "go",
--  config = languages_config.go,
-- }

-- modules["akinsho/flutter-tools.nvim"] = {
--  ft = "dart",
--  requires = "nvim-lua/plenary.nvim",
-- }

-- modules["jose-elias-alvarez/nvim-lsp-ts-utils"] = {
--  ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
--  requires = {
--    "neovim/nvim-lspconfig",
--    "nvim-lua/plenary.nvim",
--  },
-- }

-- modules["michaelb/sniprun"] = {
--  requires = "neovim/nvim-lspconfig",
--  run = "bash ./install.sh",
--  cmd = {
--    "SnipRun",
--    "SnipInfo",
--    "SnipReset",
--    "SnipReplMemoryClean",
--    "SnipClose",
--  },
--  config = languages_config.sniprun,
-- }

-- modules["nvim-treesitter/nvim-treesitter"] = {
--  event = {
--    "BufRead",
--    "BufReadPre",
--  },
--  run = ":TSUpdate",
--  config = languages_config.nvim_treesitter,
-- }

-- modules["pechorin/any-jump.vim"] = {
--  event = {
--    "BufRead",
--    "BufReadPre",
--  },
--  config = languages_config.any_jump,
-- }

-- modules["folke/trouble.nvim"] = {
--  requires = "kyazdani42/nvim-web-devicons",
--  config = languages_config.trouble,
-- }

-- modules["simrat39/symbols-outline.nvim"] = {
--  cmd = "SymbolsOutline",
--  config = languages_config.symbols_outline,
-- }

-- modules["rcarriga/nvim-dap-ui"] = {
--  event = {
--    "BufRead",
--    "BufReadPre",
--  },
--  requires = {
--    "mfussenegger/nvim-dap",
--    "jbyuki/one-small-step-for-vimkind",
--  },
--  config = languages_config.nvim_dap_ui,
-- }

-- modules["Pocco81/DAPInstall.nvim"] = {
--  branch = "dev",
--  event = "BufWinEnter",
--  config = languages_config.dapinstall,
-- }

-- modules["kristijanhusak/vim-dadbod-ui"] = {
--  requires = {
--    {
--      "tpope/vim-dadbod",
--      after = "vim-dadbod-ui",
--    },
--    {
--      "kristijanhusak/vim-dadbod-completion",
--      after = "vim-dadbod-ui",
--    },
--  },
--  cmd = {
--    "DBUIToggle",
--    "DBUIAddConnection",
--    "DBUI",
--    "DBUIFindBuffer",
--    "DBUIRenameBuffer",
--  },
--  config = languages_config.vim_dadbod_ui,
-- }

-- modules["vuki656/package-info.nvim"] = {
--  requires = "MunifTanjim/nui.nvim",
--  event = "BufRead package.json",
--  config = languages_config.package_info,
-- }

-- modules["Saecki/crates.nvim"] = {
--  requires = "nvim-lua/plenary.nvim",
--  event = "BufRead Cargo.toml",
--  config = languages_config.crates,
-- }

-- modules["akinsho/pubspec-assist.nvim"] = {
--  requires = "nvim-lua/plenary.nvim",
--  event = "BufRead pubspec.yaml",
--  rocks = {
--    {
--      "lyaml",
--      server = "http://rocks.moonscript.org",
--    },
--  },
--  config = languages_config.pubspec_assist,
-- }

-- modules["davidgranstrom/nvim-markdown-preview"] = {
--  ft = "markdown",
-- }

-- modules["lervag/vimtex"] = {
--  config = languages_config.vimtex,
-- }

-- modules["nvim-orgmode/orgmode"] = {
--  ft = "org",
--  config = languages_config.orgmode,
-- }
-- modules["akinsho/org-bullets.nvim"] = {
--  ft = "org",
--  config = languages_config.org_bullets,
-- }

--> completion

-- local completion_config = require("modules.global.configs.completion")

-- modules["hrsh7th/nvim-cmp"] = {
--  requires = {
--    {
--      "hrsh7th/cmp-nvim-lsp",
--    },
--    {
--      "saadparwaiz1/cmp_luasnip",
--      after = "nvim-cmp",
--    },
--    {
--      "hrsh7th/cmp-buffer",
--      after = "nvim-cmp",
--    },
--    {
--      "hrsh7th/cmp-cmdline",
--      after = "nvim-cmp",
--    },
--    {
--      "hrsh7th/cmp-path",
--      after = "nvim-cmp",
--    },
--    {
--      "kdheepak/cmp-latex-symbols",
--      after = "nvim-cmp",
--    },
--  },
--  event = {
--    "BufRead",
--    "BufReadPre",
--    "InsertEnter",
--  },
--  config = completion_config.nvim_cmp,
-- }

-- modules["L3MON4D3/LuaSnip"] = {
--  requires = {
--    {
--      "rafamadriz/friendly-snippets",
--      after = "LuaSnip",
--    },
--  },
-- }

-- modules["Neevash/awesome-flutter-snippets"] = {
--  ft = "dart",
-- }

-- modules["mattn/emmet-vim"] = {
--  event = "InsertEnter",
--  config = completion_config.emmet_vim,
-- }

--[[

-- Plugins
https://github.com/tami5/sqlite.lua -- probably

https://github.com/nvim-telescope/telescope.nvim -- yes
https://github.com/ibhagwan/fzf-lua -- instead of telescope?
https://github.com/nvim-treesitter/nvim-treesitter -- yes

https://github.com/j-hui/fidget.nvim -- yes
https://github.com/jose-elias-alvarez/null-ls.nvim -- yes
https://github.com/ms-jpq/coq_nvim/blob/coq/docs/STATS.md -- probably
https://github.com/ojroques/nvim-lspfuzzy -- probably
https://github.com/gfanto/fzf-lsp.nvim -- maybe
https://github.com/ray-x/navigator.lua -- maybe
https://github.com/b0o/SchemaStore.nvim -- maybe

-- telescope integrations
https://github.com/ajeetdsouza/zoxide -- z jump
-- fzf
https://github.com/vijaymarupudi/nvim-fzf -- maybe

-- registers
https://github.com/AckslD/nvim-neoclip.lua -- maybe
-- snipperts
https://github.com/L3MON4D3/LuaSnip -- maybe
https://github.com/ellisonleao/carbon-now.nvim -- maybe
-- marks
https://github.com/ThePrimeagen/harpoon -- interested
-- terminal
https://github.com/LoricAndre/OneTerm.nvim -- maybe
https://github.com/nikvdp/neomux -- very interested
https://github.com/s1n7ax/nvim-terminal -- interested
https://github.com/akinsho/toggleterm.nvim -- maybe

-- note taking
https://github.com/oberblastmeister/neuron.nvim -- maybe still need to checkout neuron
https://github.com/nvim-neorg/neorg -- ?

-- Quality of life
https://github.com/sunjon/Shade.nvim -- dim inactive buffers
https://github.com/winston0410/range-highlight.nvim -- interested
https://github.com/xiyaowong/nvim-transparent -- interested
https://github.com/folke/twilight.nvim -- maybe

-- UI
https://github.com/stevearc/dressing.nvim -- interested
https://github.com/MunifTanjim/nui.nvim -- interested
-- colortheme
https://github.com/norcalli/nvim-base16.lua -- maybe
https://github.com/rktjmp/lush.nvim -- very interested
https://github.com/themercorp/themer.lua -- interested

https://github.com/kyazdani42/nvim-web-devicons -- icons
https://github.com/yamatsum/nvim-nonicons -- gotta figure out how to make it work
https://github.com/goolord/alpha-nvim -- maybe

-- util
https://github.com/sudormrfbin/cheatsheet.nvim -- i like this
https://github.com/Pocco81/AbbrevMan.nvim -- interested
https://github.com/max397574/better-escape.nvim -- interested
https://github.com/nkakouros-original/numbers.nvim -- very interested

https://github.com/rafcamlet/nvim-luapad -- i think this might be amazing for writing this config


https://github.com/m00qek/plugin-template.nvim -- use probably

-- maybe of of these
https://github.com/yamatsum/nvim-cursorline
https://github.com/xiyaowong/nvim-cursorword
https://github.com/RRethy/vim-illuminate
https://github.com/echasnovski/mini.nvim#miniindentscope -- help

-- explorer or telescope ????
https://github.com/kyazdani42/nvim-tree.lua -- robust
https://github.com/nvim-neo-tree/neo-tree.nvim -- ?
https://github.com/luukvbaal/nnn.nvim -- i like this
https://github.com/tamago324/lir.nvim -- i like this
https://github.com/TimUntersberger/neofs -- maybe
https://github.com/ms-jpq/chadtree -- compared to nvim-tree ??
https://github.com/is0n/fm-nvim -- super interested
https://github.com/elihunter173/dirbuf.nvim - ?

-- git
f-person/git-blame.nvim -- like this one
https://github.com/lewis6991/gitsigns.nvim -- maybe
https://github.com/TimUntersberger/neogit -- magit clone
https://github.com/sindrets/diffview.nvim -- sounds nice

-- commenting
https://github.com/numToStr/Comment.nvim

-- motion
https://github.com/ggandor/lightspeed.nvim

-- search/scroll
https://github.com/kevinhwang91/nvim-hlslens -- i like this
https://github.com/dstein64/nvim-scrollview -- scrollbar
https://github.com/petertriho/nvim-scrollbar -- better scrollbar (but maybe not faster.)
https://github.com/karb94/neoscroll.nvim
]]
