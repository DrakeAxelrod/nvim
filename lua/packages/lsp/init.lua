local handlers = require "packages.lsp.handlers"

return {
  {
    "junnplus/lsp-setup.nvim",
    requires = {
      {
        "neovim/nvim-lspconfig",
        -- function()
        --   local lspconfig = require("lspconfig")
        -- end
      },
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "yamatsum/nvim-nonicons",
    },
    function()
      local servers = {}
      local path = vim.fn.stdpath("config") .. "/lua/packages/lsp/servers"
      -- get all contents of the directory
      for _, file in ipairs(vim.fn.readdir(path)) do
        -- get the file name without the extension
        local name = file:match("(.*)%.lua")
        -- if the file name is not nil
        if name then
          local server = require("packages.lsp.servers." .. name)
          server.disabled = server.disabled or false
          if not server.disabled then
            servers[name] = server
          end
        end
      end
      require("lsp-setup").setup {
        -- Default mappings
        -- gD = 'lua vim.lsp.buf.declaration()',
        -- gd = 'lua vim.lsp.buf.definition()',
        -- gt = 'lua vim.lsp.buf.type_definition()',
        -- gi = 'lua vim.lsp.buf.implementation()',
        -- gr = 'lua vim.lsp.buf.references()',
        -- K = 'lua vim.lsp.buf.hover()',
        -- ['<C-k>'] = 'lua vim.lsp.buf.signature_help()',
        -- ['<space>rn'] = 'lua vim.lsp.buf.rename()',
        -- ['<space>ca'] = 'lua vim.lsp.buf.code_action()',
        -- ['<space>f'] = 'lua vim.lsp.buf.formatting()',
        -- ['<space>e'] = 'lua vim.diagnostic.open_float()',
        -- ['[d'] = 'lua vim.diagnostic.goto_prev()',
        -- [']d'] = 'lua vim.diagnostic.goto_next()',
        default_mappings = true,
        -- Custom mappings, will overwrite the default mappings for the same key
        -- Example mappings for telescope pickers:
        -- gd = 'lua require"telescope.builtin".lsp_definitions()',
        -- gi = 'lua require"telescope.builtin".lsp_implementations()',
        -- gr = 'lua require"telescope.builtin".lsp_references()',
        mappings = {},
        -- Global on_attach
        on_attach = function(client, bufnr)
          -- Support custom the on_attach function for global
          -- Formatting on save as default
          require("lsp-setup.utils").format_on_save(client)
        end,
        -- Global capabilities
        capabilities = handlers.common_capabilities(),
        -- Configuration of LSP servers
        servers = servers,
      }
    end,
  },
}
