-- https://github.com/github/copilot.vim -- original (needed to make second work)
-- https://github.com/zbirenbaum/copilot.lua
return function()
  vim.defer_fn(function()
    require("copilot").setup()
  end, 100)
end
