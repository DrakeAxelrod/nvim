local M = {}

M.notify = require("plugins.notify")
M.copilot = require("plugins.cmp.copilot")
M.copilot_cmp = require("plugins.cmp.copilot_cmp")
M.hop = require("plugins.hop")
M.surround = require("plugins.treesitter.surround")
M.colorscheme = require("plugins.colorscheme")
M.whichkey = require("plugins.whichkey")
M.nvimtree = require("plugins.nvimtree")
M.smart_splits = require("plugins.smart-splits")
M.lsp_setup = require("plugins.language.lsp-setup")
M.null_ls = require("plugins.language.null-ls")
M.dap = require("plugins.language.dap")
M.mason = require("plugins.language.mason")
M.mason_lspconfig = require("plugins.language.mason-lspconfig")
M.neodev = require("plugins.neodev")
M.comment = require("plugins.comment")
M.treesitter = require("plugins.treesitter")
M.wilder = require("plugins.wilder")
M.noice = require("plugins.noice")
M.lualine = require("plugins.lualine")
M.alpha = require("plugins.alpha")
M.toggleterm = require("plugins.toggleterm")
M.gitsigns = require("plugins.gitsigns")
M.neogit = require("plugins.neogit")
M.telescope = require("plugins.telescope")
-- M.illuminate = require("plugins.treesitter.illuminate")

return M

-- table.insert(M, { "yamatsum/nvim-nonicons", requires = { "kyazdani42/nvim-web-devicons" } })
-- table.insert(M, { "wakatime/vim-wakatime" })
-- table.insert({ "m4xshen/autoclose.nvim" })

-- table.insert(M, { "alvarosevilla95/luatab.nvim", requires = "kyazdani42/nvim-web-devicons" })

-- table.insert({
--   "yamatsum/nvim-cursorline",
--   function()
--     require("nvim-cursorline").setup {
--       cursorline = {
--         enable = true,
--         timeout = 1000,
--         number = false,
--       },
--       cursorword = {
--         enable = true,
--         min_length = 3,
--         hl = { underline = true },
--       },
--     }
--   end,
-- })
