
return {
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release"
  },
  {
    "nvim-telescope/telescope-frecency.nvim"
  },
  { "nvim-telescope/telescope-ui-select.nvim" },
  { "rcarriga/nvim-notify" },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  },
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = function()
      local telescope = require("telescope")
      local extensions = {
        "fzf",
        "frecency",
        "fzf_native",
        "ui_select",
        "notify",
        "file_browser",
      }
      for _, ext in ipairs(extensions) do
        pcall(telescope.load_extension, ext)
      end
      return require("plugins.telescope.config")
    end,
  }
}