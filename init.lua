if require("lib.api") then
  if Impatient() then
    vim.api.nvim_set_var("cursorhold_updatetime", 100)
    vim.api.nvim_set_var("mapleader", " ")
    vim.api.nvim_set_var("maplocalleader", " ")
    vim.keymap.set({"v", "n"}, "<space>", "<Nop>", { noremap = true })
    require("conf.opts")
    require("lib.pack")
    require("langs")
    require("conf.keys").common()
  end
end
