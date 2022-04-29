-- https://github.com/kosayoda/nvim-lightbulb

return function()
  vim.api.nvim_create_autocmd(
    { "CursorHold", "CursorHoldI" },
    {
    pattern = { "*" },
    callback = function()
      require("nvim-lightbulb").update_lightbulb()
    end
  })
end
