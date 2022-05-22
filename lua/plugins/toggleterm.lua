return function()
  local height = vim.api.nvim_win_get_height(0)
  local width = vim.api.nvim_win_get_width(0)
  return {
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup({
        size = function(term)
          if term.direction == "horizontal" then
            return 15
          elseif term.direction == "vertical" then
            return vim.o.columns * 0.4
          end
        end,
        open_mapping = [[<c-t>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        start_in_insert = true,
        persist_size = true,
        direction = "horizontal",
        close_on_exit = true,
        highlights = {
          Normal = {
            guibg = "bg",
          },
        },
        float_opts = {
          border = "curved",
          -- width = 20,
          -- height = 20,
          winblend = 0,
          highlights = {
            border = "Special",
            background = "Normal",
          },
        },
      })
      require("core.keys").toggleterm(require("toggleterm.terminal").Terminal)
    end,
  }
end
