local M = {}

M.icons = function()
  return require("utils.icons")
end

M.join = function(...)
  return table.concat({...}, jit.os == "Windows" and "\\" or "/")
end

M.colors = function()
  return {
    black = vim.g.terminal_color_0,
    red = vim.g.terminal_color_1,
    green = vim.g.terminal_color_2,
    yellow = vim.g.terminal_color_3,
    blue = vim.g.terminal_color_4,
    magenta = vim.g.terminal_color_5,
    cyan = vim.g.terminal_color_6,
    white = vim.g.terminal_color_7,
    bright_black = vim.g.terminal_color_8,
    bright_red = vim.g.terminal_color_9,
    bright_green = vim.g.terminal_color_10,
    bright_yellow = vim.g.terminal_color_11,
    bright_blue = vim.g.terminal_color_12,
    bright_magenta = vim.g.terminal_color_13,
    bright_cyan = vim.g.terminal_color_14,
    bright_white = vim.g.terminal_color_15,
  }
end


return M
