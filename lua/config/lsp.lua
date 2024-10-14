
local M = {}

M.defaults = function()
  --[[ LSP ]]
  local lspconfig_defaults = require("lspconfig").util.default_config
  lspconfig_defaults.capabilities = vim.tbl_deep_extend(
    "force",
    lspconfig_defaults.capabilities,
    require("cmp_nvim_lsp").default_capabilities()
  )

  local diagnostic_signs = {
    { name = "DiagnosticSignError", text = " " },
    { name = "DiagnosticSignWarn", text = " " },
    { name = "DiagnosticSignInfo", text = " " },
    { name = "DiagnosticSignHint", text = "󰌵" },
  }
  for _, sign in ipairs(diagnostic_signs) do
    vim.fn.sign_define(sign.name, { text = sign.text, texthl = sign.name })
  end

  --[[ LSP Zero ]]

  local lsp_zero = require("lsp-zero")
  lsp_zero.extend_lspconfig({
    sign_text = true,
    float_border = 'rounded',
    -- lsp_attach = function(client, buf)
      -- keymaps.lsp_attach(client, buf)
    -- end,
    capabilities = require('cmp_nvim_lsp').default_capabilities()
  })

  --[[ Mason ]]

  require("mason").setup({})
  require("mason-lspconfig").setup({
    ensure_installed = {
      "lua_ls",
      "rust_analyzer",
      "tinymist",
      "gopls",
      "bashls",
      "pyright",
    },
    handlers = {
      -- this first function is the "default handler"
      -- it applies to every language server without a "custom handler"
      function(server_name)
        require("lspconfig")[server_name].setup({})
      end,

      lua_ls = require("config.servers.lua_ls"),
    }
  })

  --[[ Completion ]]

  local cmp = require("cmp")
  local cmp_action = lsp_zero.cmp_action()
  local cmp_format = lsp_zero.cmp_format({details = true})

  -- this is the function that loads the extra snippets
  -- from rafamadriz/friendly-snippets
  require("luasnip.loaders.from_vscode").lazy_load()

  vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
  cmp.setup({
    experimental = {
      ghost_text = {
        hl_group = "CmpGhostText",
      },
    },
    completion = {
      completeopt = "menu,menuone,noinsert,noselect",
    },
    sources = {
      {name = "path"},
      {name = "nvim_lsp"},
      {name = "luasnip", keyword_length = 2},
      {name = "buffer", keyword_length = 3},
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      -- confirm completion item
      ["<CR>"] = cmp.mapping.confirm({ select = false }),
      ["<Tab>"] = cmp.mapping.confirm({ select = true }),

      -- trigger completion menu
      ["<C-Space>"] = cmp.mapping.complete(),

      -- scroll up and down the documentation window
      ["<C-u>"] = cmp.mapping.scroll_docs(-4),
      ["<C-d>"] = cmp.mapping.scroll_docs(4),

      -- navigate between snippet placeholders
      ["<C-f>"] = cmp_action.luasnip_jump_forward(),
      ["<C-b>"] = cmp_action.luasnip_jump_backward(),

    }),
    -- note: if you are going to use lsp-kind (another plugin)
    -- replace the line below with the function from lsp-kind
    formatting = cmp_format,
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    }),
    matching = { disallow_symbol_nonprefix_matching = false }
  })

  --[[ Eagle ]]
  vim.api.nvim_create_autocmd('LspAttach', {
    callback = function(event)
      -- this is the function that loads the extra snippets
      -- from rafamadriz/friendly-snippets
      require("eagle").setup({
        border = "rounded", -- rounded, single, double, shadow
        -- override the default values found in config.lua
      })
    end,
  })
end


return M