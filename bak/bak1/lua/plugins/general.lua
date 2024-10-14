return {
  "lewis6991/impatient.nvim",
  "nvim-lua/popup.nvim",
  "romgrk/fzy-lua-native",
  "romgrk/fzy-lua-native",
  "nvim-lua/plenary.nvim",
  "nathom/filetype.nvim",
  "tpope/vim-repeat",
  "kylechui/nvim-surround" ,
  {
    "yamatsum/nvim-cursorline",
    enable = false,
    opts = {
      cursorline = {
        enable = true,
        timeout = 1000,
        number = false,
      },
      cursorword = {
        enable = true,
        min_length = 3,
        hl = { underline = true },
      },
    }
  },
  {
    "phaazon/hop.nvim",
    opts = { keys = "etovxqpdygfblzhckisuran" }
  },
}