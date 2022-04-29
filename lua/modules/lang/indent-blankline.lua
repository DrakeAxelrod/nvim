-- https://github.com/lukas-reineke/indent-blankline.nvim
return function()
  local ok, bl = pcall(require, "indent_blankline")
  if not ok then
    return
  end
  bl.setup({
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
  })
end
