local helpers = require("plugins.cmp.helpers")
local icons = require("theme.icons")
local M = {}

local before = {
  { "L3MON4D3/LuaSnip" },
  { "rafamadriz/friendly-snippets" },
  { "lukas-reineke/cmp-under-comparator" },
}

local after = {
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
}

local copilot = require("plugins.cmp.copilot")

table.insert(before, {
  "zbirenbaum/copilot-cmp",
  requires = { copilot },
  function()
    require("copilot_cmp").setup {
      method = "getCompletionsCycling",
      formatters = {
        label = require("copilot_cmp.format").format_label_text,
        insert_text = require("copilot_cmp.format").format_insert_text,
        -- insert_text = require("copilot_cmp.format").remove_existing,
        preview = require("copilot_cmp.format").deindent,
      },
    }
  end
})

table.insert(M, {
  "hrsh7th/nvim-cmp",
  requires = before,
  deps = after,
  function()
    local cmp = require("cmp")
    local luasnip = require("luasnip")
    local comparator = require("cmp-under-comparator")
    cmp.setup({
      completion = {
        ---@usage The minimum length of a word to complete on.
        keyword_length = 1,
      },
      experimental = {
        ghost_text = false,
        native_menu = false,
      },
      preselect = cmp.PreselectMode.None,
      sorting = {
        priority_weight = 2,
        comparators = {
          require("copilot_cmp.comparators").prioritize,
          require("copilot_cmp.comparators").score,
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.score,
          comparator.under,
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      },
      formatting = {
        fields = { "kind", "abbr", "menu" },
        max_width = 0,
        kind_icons = icons.kind,
        source_names = {
          nvim_lsp = "(LSP)",
          emoji = "(Emoji)",
          path = "(Path)",
          calc = "(Calc)",
          cmp_tabnine = "(Tabnine)",
          vsnip = "(Snippet)",
          luasnip = "(Snippet)",
          buffer = "(Buffer)",
          tmux = "(TMUX)",
          copilot = "(Copilot)",
          treesitter = "(TreeSitter)",
        },
        duplicates = {
          buffer = 1,
          path = 1,
          nvim_lsp = 0,
          luasnip = 1,
        },
        duplicates_default = 0,
        format = function(entry, vim_item)
          vim_item.kind = ("%s"):format(icons.kind[vim_item.kind])
          -- NOTE: order matters
          vim_item.menu = ({
            nvim_lsp = "(LSP)",
            emoji = "(Emoji)",
            path = "(Path)",
            calc = "(Calc)",
            cmp_tabnine = "(Tabnine)",
            vsnip = "(Snippet)",
            luasnip = "(Snippet)",
            buffer = "(Buffer)",
            tmux = "(TMUX)",
            copilot = "(Copilot)",
            treesitter = "(TreeSitter)",
            nvim_lsp_signature_help = "(Signature)",
            neodev = "(Neodev)",
            nvim_lua = "(Nvim)",
          })[entry.source.name]
          return vim_item
        end,
      },
      snippet = {
        expand = function(args)
          require("luasnip").lsp_expand(args.body)
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert {
        ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
        ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
        ["<Down>"] = cmp.mapping(cmp.mapping.select_next_item { behavior = cmp.SelectBehavior.Select }, { "i" }),
        ["<Up>"] = cmp.mapping(cmp.mapping.select_prev_item { behavior = cmp.SelectBehavior.Select }, { "i" }),
        ["<C-d>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-y>"] = cmp.mapping {
          i = cmp.mapping.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false },
          c = function(fallback)
            if cmp.visible() then
              cmp.confirm { behavior = cmp.ConfirmBehavior.Replace, select = false }
            else
              fallback()
            end
          end,
        },
        ["<Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_locally_jumpable() then
            luasnip.expand_or_jump()
          elseif helpers.jumpable(1) then
            luasnip.jump(1)
          elseif helpers.has_words_before() then
            fallback()
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end, { "i", "s" }),
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<C-e>"] = cmp.mapping.abort(),
        ["<CR>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            local confirm_opts = { select = true, behavior = cmp.ConfirmBehavior.Replace }
            local is_insert_mode = function()
              return vim.api.nvim_get_mode().mode:sub(1, 1) == "i"
            end
            if is_insert_mode() then -- prevent overwriting brackets
              confirm_opts.behavior = cmp.ConfirmBehavior.Insert
            end
            if cmp.confirm(confirm_opts) then
              return -- success, exit early
            end
          end
          fallback() -- if not exited early, always fallback
        end),
      },
      sources = {
        {
          name = "copilot",
          group_index = 2,
        },
        {
          name = "nvim_lsp",
          entry_filter = function(entry, ctx)
            local kind = require("cmp.types").lsp.CompletionItemKind[entry:get_kind()]
            if kind == "Snippet" and ctx.prev_context.filetype == "java" then
              return false
            end
            if kind == "Text" then
              return false
            end
            return true
          end,
        },

        { name = "path" },
        { name = "luasnip" },
        { name = "cmp_tabnine" },
        { name = "nvim_lua" },
        { name = "buffer" },
        { name = "calc" },
        { name = "emoji" },
        { name = "treesitter" },
        { name = "crates" },
        { name = "tmux" },
      },
    })
  end
})

return M
