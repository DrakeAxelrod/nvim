
-- https://github.com/williamboman/nvim-lsp-installer
return function()
  local ok, lsp_installer = pcall(require, "nvim-lsp-installer")
  if not ok then
    return
  end
  local icons = require("lib.icons")
  lsp_installer.settings({
    ui = {
      icons = {
        server_installed = icons.ui.download,
        server_pending = icons.ui.pause,
        server_uninstalled = icons.ui.cross,
      },
    },
  })
end
