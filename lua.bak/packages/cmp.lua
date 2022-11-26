local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match '%s' == nil
end

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

return {
  {
    "hrsh7th/nvim-cmp",
    requires = {
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
      { "lukas-reineke/cmp-under-comparator" },
      { "onsails/lspkind.nvim" },
    },
    deps = {
      -- Snippet completion source
      "saadparwaiz1/cmp_luasnip",
      -- Lsp completion source
      "hrsh7th/cmp-nvim-lsp",
      -- Buffer completion source
      "hrsh7th/cmp-buffer",
      -- Path completion source
      "hrsh7th/cmp-path",
      -- Nvim api completion source
      "hrsh7th/cmp-nvim-lua",
      -- Signature completion source
      "hrsh7th/cmp-nvim-lsp-signature-help",
      -- copilot completion source
      {
        "zbirenbaum/copilot-cmp",
        requires = { "zbirenbaum/copilot.lua" },
        function()
          require("copilot_cmp").setup {
            method = "getCompletionsCycling",
            formatters = {
              label = require("copilot_cmp.format").format_label_text,
              insert_text = require("copilot_cmp.format").format_insert_text,
              preview = require("copilot_cmp.format").deindent,
            },
          }
        end,
      },
    },
    function()
      local cmp = require "cmp"
      local luasnip = require 'luasnip'
      luasnip.setup { region_check_events = 'InsertEnter', delete_check_events = 'InsertEnter' }
      require('luasnip.loaders.from_vscode').lazy_load()
      local kind_icons = require "lspkind"
      cmp.setup {
        preselect = cmp.PreselectMode.None,
        formatting = {
          fields = { "kind", "abbr", "menu" },
          format = function(entry, vim_item)
            vim_item.kind = ("%s"):format(kind_icons[vim_item.kind])
            -- NOTE: order matters
            vim_item.menu = ({
              nvim_lsp = "(lsp)",
              copilot = "(copilot)",
              nvim_lsp_signature_help = "(signature)",
              luasnip = "(snippet)",
              ["neodev"] = "(neodev)",
              nvim_lua = "(nvim)",
              buffer = "(buffer)",
              path = "(path)",
            })[entry.source.name]
            return vim_item
          end,
        },
        sources = {
          { name = "copilot", priority = 1000 },
          { name = "nvim_lsp", priority = 900 },
          { name = "nvim_lsp_signature_help", priority = 900 },
          { name = "luasnip", priority = 750 },
          { name = "nvim_lua", priority = 500 },
          { name = "neodev", priority = 500 },
          { name = "buffer", priority = 500 },
          { name = "path", priority = 200 },
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        duplicates = {
          nvim_lsp = 1,
          luasnip = 1,
          buffer = 1,
          path = 1,
        },
        confirm_opts = {
          behavior = cmp.ConfirmBehavior.Replace,
          select = false,
        },
        completion = {
          completeopt = "menu,menuone,noinsert",
          keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%(-\w*\)*\)]],
          ---@usage The minimum length of a word to complete on.
          keyword_length = 1,
        },
        sorting = {
          comparators = {
            -- The built-in comparators:
            cmp.config.compare.offset,
            cmp.config.compare.exact,
            cmp.config.compare.score,
            require("cmp-under-comparator").under,
            cmp.config.compare.kind,
            cmp.config.compare.sort_text,
            cmp.config.compare.length,
            cmp.config.compare.order,
          },
        },
        experimental = {
          ghost_text = true,
          native_menu = false,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = {
          ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
          ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
          ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
          ["<C-y>"] = cmp.config.disable,
          ["<C-p>"] = cmp.mapping.select_prev_item(),
          ["<C-n>"] = cmp.mapping.select_next_item(),
          ["<C-e>"] = cmp.mapping {
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
          },
          ["<cr>"] = cmp.mapping.confirm { select = true, behavior = cmp.ConfirmBehavior.Replace },
          ["<tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            elseif has_words_before() then
              cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<s-tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { "i", "s" }),
        },
      }
    end,
  },
}
