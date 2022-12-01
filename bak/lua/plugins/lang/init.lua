local handlers = require "plugins.lang.handlers"
local lspsaga = require("plugins.lang.lspsaga")
local t = require "tools"

local M = {}

local before = {
  { "neovim/nvim-lspconfig" },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  -- { "yamatsum/nvim-nonicons" },
  { "SmiteshP/nvim-navic" },
  { "folke/neodev.nvim" },
  -- lspsaga,
}

local after = {
  {
    "utilyre/barbecue.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "smiteshp/nvim-navic",
      "kyazdani42/nvim-web-devicons", -- optional
    },
    function()
      require("barbecue").setup()
    end,
  }
}

local servers = function()
  local s = {}
  local path = joinpath(vim.fn.stdpath "config", "lua", "plugins", "lang", "servers")
  local files = readdir(path)
  for _, file in ipairs(files) do
    if file then
      local server = require("plugins.lang.servers." .. file)
      server.disabled = server.disabled or false
      if not server.disabled then
        s[file] = server
      end
    end
  end
  return s
end

table.insert(M, {
  "junnplus/lsp-setup.nvim",
  requires = before,
  deps = after,
  function()
    require("lsp-setup").setup {
      default_mappings = false,
      mappings = {},
      -- Global on_attach
      on_attach = function(client, bufnr)
        --- @param fn fun(client: number, bufnr: number)
        for _, fn in ipairs(t.on_attach_list) do
          fn(client, bufnr)
        end

        -- commons defaults
        handlers.setup()

        -- Formatting on save as default
        require("lsp-setup.utils").format_on_save(client)
        -- keybind this is you want it available
        -- require("lsp-setup.utils").disable_formatting(client)
      end,
      -- Global capabilities
      capabilities = handlers.capabilities(),
      -- Configuration of LSP servers
      servers = servers(),
    }
  end,
})

return M
