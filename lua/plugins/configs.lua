local M = {}

M.notify = function()
  local icons = require("theme.icons")
  vim.notify = require("notify")
  vim.notify.setup({
    stages = "slide",
    on_open = nil,
    on_close = nil,
    render = "default",
    timeout = 5000,
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

M.copilot = require("plugins.cmp.copilot")

M.copilot_cmp = function()
  require("copilot_cmp").setup {
    method = "getCompletionsCycling",
    formatters = {
      label = require("copilot_cmp.format").format_label_text,
      insert_text = require("copilot_cmp.format").format_insert_text,
      -- insert_text = require("copilot_cmp.format").remove_existing,
      preview = require("copilot_cmp.format").deindent,
    },
  }
end

M.hop = function()
  require("hop").setup({
    keys = "etovxqpdygfblzhckisuran",
  })
end

M.surround = function()
  require("nvim-surround").setup({})
end

M.colorscheme = require("plugins.colorscheme")
M.whichkey = require("plugins.whichkey")
M.nvimtree = require("plugins.nvimtree")
M.smart_splits = require("plugins.smart-splits")
M.language = require("plugins.language")
M.neodev = require("plugins.neodev")
M.comment = require("plugins.comment")
M.treesitter = require("plugins.treesitter")
M.wilder = require("plugins.wilder")
M.noice = require("plugins.noice")
M.lualine = require("plugins.lualine")
M.alpha = require("plugins.alpha")
M.toggleterm = require("plugins.toggleterm")
M.gitsigns = require("plugins.gitsigns")
M.telescope = require("plugins.telescope")

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
