local nvim_lsp_util = require("lspconfig/util")

local opts = {
  autostart = true,
  filetypes = { "lua" },
  settings = {
    Lua = {
      diagnostics = {
        diagnostics = {
          globals = {
            vim = { fields = { "g", "opt" } },
            "use",
            "packer_plugins"
          },
          disable = { "lowercase-global" },
        },
      },
      runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
          [vim.fn.stdpath "config" .. "/lua"] = true,
        },
      },
    },
  },
  root_dir = function(fname)
    return nvim_lsp_util.find_git_ancestor(fname) or vim.fn.getcwd()
  end,
}

local ok, lua_dev = pcall(require, "lua-dev")
if ok then
  opts = lua_dev.setup({
    library = {
      vimruntime = true, -- runtime path
      types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
      -- plugins = true, -- installed opt or start plugins in packpath
      -- you can also specify the list of plugins to make available as a workspace library
      plugins = { "plenary.nvim" },
    },
    lspconfig = opts,
  })
end

return opts
