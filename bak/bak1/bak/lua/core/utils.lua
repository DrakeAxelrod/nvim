local M = {}

M.impatient = function()
  pcall(function()
    require("impatient").enable_profile()
  end)
end

M.leader = function(c)
  c = vim.api.nvim_replace_termcodes(c, true, true, true)
  if c == " " then
    vim.keymap.set({ "n", "v", "x" }, "<Space>", "<NOP>", { noremap = true, silent = true })
  end
  vim.g.mapleader = c
end

M.options = function(options)
  for scope, settings in pairs(options) do
    for key, value in pairs(settings) do
      vim[scope][key] = value
    end
  end
end

M.map = function(mode, lhs, rhs, opts)
  local options = { noremap = true }
  if opts then options = vim.tbl_extend("force", options, opts) end
  vim.keymap.set(mode, lhs, rhs, options)
end


return M
