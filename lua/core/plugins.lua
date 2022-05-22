local plugins = require("lib").plugins
--> basic plugins <--
plugins.add("generic")
--> . for days <--
plugins.add({ "tpope/vim-repeat", event = { "BufRead", "BufNewFile" } })
--> change surrounding <--
plugins.add({ "tpope/vim-surround", event = { "BufRead", "BufReadPre" } })
--> Better Split Management <--
plugins.add({ "mrjones2014/smart-splits.nvim", module = "smart-splits" })
--> File Explorer <--
plugins.add("neotree")
--> keybind popup <--
plugins.add("which-key")
--> terminal <--
plugins.add("toggleterm")
--> jump around <--
plugins.add("hop")
--> Dashboard <--
plugins.add("alpha")
--> Syntax highlighting <--
plugins.add("treesitter")
--> Autoclose tags <--
plugins.add("autopairs")
--> Autoclose tags <--
plugins.add("autotag")
--> color help <--
plugins.add("colorizer")
--> Commenting <--
plugins.add("comment")
--> Parenthesis highlighting <--
plugins.add({ "p00f/nvim-ts-rainbow", after = "nvim-treesitter" })
--> Context based commenting <--
plugins.add({ "JoosepAlviste/nvim-ts-context-commentstring", after = "nvim-treesitter" })
--> cmdline completion <--
plugins.add("wilder")
--> Completion engine / Snippets <--
plugins.add("cmp")
--> LSP <--
plugins.add("lang")
--> LSP symbols <--
plugins.add("aerial")
--> Telescope <--
plugins.add("telescope")
--> Git <--
plugins.add("gitsigns")
plugins.add("neogit")

return plugins
