local configs = {}

local dir = vim.fn.readdir(joinpath(vim.fn.stdpath("config"), "lua", core.plugin_dir))
for _, entry in ipairs(dir) do
  local config = entry:gsub("%.lua$", "")
  if config ~= "init" then
    local ok, conf = pcall(require, core.plugin_dir .. "." .. config)
    if ok then
      configs[config] = conf
    end
  end
end

-- ===========================[[ Utility ]]=========================== --

core.plugin({
  "lewis6991/impatient.nvim",
  config = function()
    require("impatient").enable_profile()
  end,
})

core.plugin({
  "nvim-lua/plenary.nvim",
  after = { "impatient.nvim" },
})

core.plugin({
  "nvim-lua/popup.nvim",
  after = { "plenary.nvim" },
})

core.plugin({
  "kyazdani42/nvim-web-devicons",
  after = { "popup.nvim" },
})

core.plugin({
  "antoinemadec/FixCursorHold.nvim",
  after = { "nvim-web-devicons" },
  config = function()
    vim.g.cursorhold_updatetime = 100
  end
})

core.plugin({
  "rcarriga/nvim-notify",
  after = { "FixCursorHold.nvim" },
  config = configs.notify,
})

core.plugin({
  "olimorris/onedarkpro.nvim",
  after = { "nvim-notify" },
  config = configs.colorscheme,
})

-- ===========================[[ Statusline ]]=========================== --

core.plugin({
  "nvim-lualine/lualine.nvim",
  after = { "onedarkpro.nvim" },
  config = configs.lualine,
})

-- ===========================[[ Telescope ]]=========================== --

core.plugin({
  "nvim-telescope/telescope.nvim",
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
