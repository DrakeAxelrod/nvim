-- if not prequire("which-key") then return end

local map = function(mode, lhs, rhs, desc, opts)
  desc = desc or "Not Provided"
  opts = opts or { noremap = true, silent = true, desc = desc }
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- test
-- map("n", "<leader>f", f("arg => print('hello world')"), "prints hello world")

-- File explorer
map("n", "<leader>e", ":Neotree source=filesystem position=right toggle=true<CR>", "Explorer")

-- Move between windows
map("n", "<C-h>", "<C-w>h", "Move to left window")
map("n", "<C-j>", "<C-w>j", "Move to bottom window")
map("n", "<C-k>", "<C-w>k", "Move to top window")
map("n", "<C-l>", "<C-w>l", "Move to right window")

map("n", "<leader>L", ":Lazy<CR>", "Lazy (Plugin Manager)")
