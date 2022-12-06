pcall(require, "tools")
if vim.fn.exists("g:vscode") == 1 then
  return
else
  CONF.leader("<space>")
  CONF.colorscheme("onedarkpro")
  CONF.options("options")
  CONF.plugins("plugins")
  CONF.servers("servers")
  CONF.keymaps("keymaps")
  CONF.autocommands("autocommands")
  CONF.commands("commands")
  CONF.load()
end
