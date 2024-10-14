local setup = function(server_name)
  local lsp_zero = require("lsp-zero")
  require("lspconfig")[server_name].setup({
    on_init = function(client)
      lsp_zero.nvim_lua_settings(client, {

      })
    end,
  })
end

return setup