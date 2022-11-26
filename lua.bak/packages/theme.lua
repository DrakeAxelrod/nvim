return {
  {
    "yamatsum/nvim-nonicons",
    requires = { "kyazdani42/nvim-web-devicons" },
  },
  {
    "alvarosevilla95/luatab.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    function()
      require("luatab").setup {
        -- title = function()
        --   return ""
        -- end,
        -- modified = function()
        --   return ""
        -- end,
        -- windowCount = function()
        --   return ""
        -- end,
        -- devicon = function()
        --   return ""
        -- end,
        -- separator = function()
        --   return ""
        -- end,
      }
    end,
  },
  -- {
  --   "folke/noice.nvim",
  --   function()
  --     require("noice").setup({
  --         -- add any options here
  --     })
  --   end,
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   }
  -- },
  {
    "rafamadriz/neon",
    function()
      vim.cmd [[colorscheme neon]]
    end,
    setup = function()
      vim.g.neon_style = "doom"
      vim.g.neon_italic_keyword = true
      vim.g.neon_italic_function = true
      vim.g.neon_transparent = true
      vim.g.neon_bold = true
    end,
  },
  { "Mofiqul/vscode.nvim", disabled = true },
}
