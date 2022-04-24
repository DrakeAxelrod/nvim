local ts_util = require "nvim-lsp-ts-utils"
return {
  init_options = ts_util.init_options,
  cmd = { "typescript-language-server", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },

  on_attach = function(client)
    ts_util.setup { auto_inlay_hints = false }
    ts_util.setup_client(client)
  end,
}