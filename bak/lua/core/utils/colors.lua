local M = {}

M.hl_by_name = function(name)
  local hl = vim.api.nvim_get_hl_by_name(name, true)
  return hl
end

M.hl_by_id = function(id)
  local hl = vim.api.nvim_get_hl_by_id(id, true)
  return hl
end

-- M.split_rgb = function(rgb)
--   local r = rgb >> 16
--   local g = (rgb >> 8) & 0xff
--   local b = rgb & 0xff
--   return r, g, b
-- end

M.rgb_to_hex = function(rgb)
  -- without >>
  local r = math.floor(rgb / 65536)
  local g = math.floor((rgb - r * 65536) / 256)
  local b = rgb - r * 65536 - g * 256
  return string.format("#%02x%02x%02x", r, g, b)
end

M.highlights = function()
  local out = vim.api.nvim_exec("highlight", true)
  local hl = {}
   -- get all capital words from the string
  local words = {}
  for word in string.gmatch(out, "%u%w+") do
    table.insert(words, word)
  end
  -- get the highlights for each word
  for _, word in ipairs(words) do
    local status, highlight = pcall(M.hl_by_name, word)
    if status then
      for k, v in pairs(highlight) do
        if k == "foreground" or k == "background" then
          highlight[k] = M.rgb_to_hex(v)
        end
      end
      hl[word] = highlight
    end
  end
  return hl
end

M.term_colors = function()
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
