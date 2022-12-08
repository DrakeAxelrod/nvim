return function()
  -- local t = require("tools")
  local handlers = require("plugins.language.handlers")
  local lsp_utils = require("utils.lsp")
  require("lsp-setup").setup({
    default_mappings = false,
    mappings = {},
    on_attach = function(client, bufnr) -- Global on_attach
      handlers.setup() -- vim.diagnostics.config setup
      --- @param fn fun(client: number, bufnr: number)
      for _, fn in ipairs(lsp_utils.on_attach_list) do
        fn(client, bufnr)
      end

      -- require("lsp-setup.utils").format_on_save(client) -- Formatting on save as default
      -- keybind this is you want it available
      -- require("lsp-setup.utils").disable_formatting(client)
    end,

    capabilities = handlers.capabilities(), -- Global capabilities
    -- servers = t.servers(), -- Configuration of LSP servers
  })
end
