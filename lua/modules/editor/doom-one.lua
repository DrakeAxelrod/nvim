-- https://github.com/NTBBloodbath/doom-one.nvim
vim.cmd("au ColorScheme * hi CursorLineNr guifg=#46D9FF guibg=#282c34")
return function()
  local ok, doom_one = pcall(require, "doom-one")
  if not ok then
    return false
  end
  doom_one.setup({
    cursor_coloring = true,
    terminal_colors = true,
    italic_comments = true,
    enable_treesitter = true,
    transparent_background = true,
    pumblend = {
      enable = true,
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
  -- local function enable_transparent_mode()
  --   vim.cmd "au ColorScheme * hi Normal ctermbg=none guibg=none"
  --   vim.cmd "au ColorScheme * hi SignColumn ctermbg=none guibg=none"
  --   vim.cmd "au ColorScheme * hi NormalNC ctermbg=none guibg=none"
  --   vim.cmd "au ColorScheme * hi MsgArea ctermbg=none guibg=none"
  --   vim.cmd "au ColorScheme * hi TelescopeBorder ctermbg=none guibg=none"
  --   vim.cmd "au ColorScheme * hi NvimTreeNormal ctermbg=none guibg=none"
  --   vim.cmd "au ColorScheme * hi EndOfBuffer ctermbg=none guibg=none"
  --   vim.cmd "au ColorScheme * hi Pmenu ctermbg=none guibg=none"
  --   -- vim.cmd "let &fcs='eob: '"
  -- end
  -- enable_transparent_mode()
end
