-- https://github.com/NTBBloodbath/doom-one.nvim
return function(doom_one)
-- vim.cmd("au ColorScheme * hi CursorLineNr guifg=#46D9FF guibg=#282c34")
  doom_one.setup({
    cursor_coloring = true,
    terminal_colors = true,
    italic_comments = true,
    enable_treesitter = true,
    transparent_background = false,
    pumblend = {
      enable = false,
      transparency_amount = 20,
    },
    plugins_integrations = {
      neorg = false,
      barbar = false,
      bufferline = false,
      gitgutter = false,
      gitsigns = true,
      telescope = true,
      neogit = false,
      nvim_tree = false,
      dashboard = false,
      startify = false,
      whichkey = true,
      indent_blankline = false,
      vim_illuminate = false,
      lspsaga = false,
    },
  })
end
