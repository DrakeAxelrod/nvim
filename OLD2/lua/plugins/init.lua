local configs = {}

local dir = vim.fn.readdir(vim.fn.stdpath("config") .. "/lua/" .. Packer.plugin_dir)
for _, entry in ipairs(dir) do
  local config = entry:gsub("%.lua$", "")
  if config ~= "init" then
    local ok, conf = pcall(require, "plugins." .. config)
    if ok then
      configs[config] = conf
    end
  end
end

-- ===========================[[ Utility ]]=========================== --

Packer.use({
  "lewis6991/impatient.nvim",
  config = function()
    require("impatient").enable_profile()
  end,
})

Packer.use({
  "nvim-lua/plenary.nvim",
  after = { "impatient.nvim" },
})

Packer.use({
  "nvim-lua/popup.nvim",
  after = { "plenary.nvim" },
})

Packer.use({
  "kyazdani42/nvim-web-devicons",
  after = { "popup.nvim" },
})

Packer.use({
  "antoinemadec/FixCursorHold.nvim",
  after = { "nvim-web-devicons" },
  config = function()
    vim.g.cursorhold_updatetime = 100
  end
})

Packer.use({
  "rcarriga/nvim-notify",
  after = { "FixCursorHold.nvim" },
  config = configs.notify,
})

Packer.use({
  "olimorris/onedarkpro.nvim",
  after = { "nvim-notify" },
  config = configs.colorscheme,
})

-- ===========================[[ Statusline ]]=========================== --

Packer.use({
  "nvim-lualine/lualine.nvim",
  after = { "onedarkpro.nvim" },
  config = configs.lualine,
})

-- ===========================[[ Telescope ]]=========================== --

Packer.use({
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
