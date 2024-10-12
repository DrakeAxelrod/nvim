local keymaps = require('keymaps')

return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v4.x',
    lazy = true,
    config = false,
  },
  {
    'williamboman/mason.nvim',
    lazy = false,
    config = true,
  },
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    event = 'InsertEnter',
    dependencies = {
      "L3MON4D3/LuaSnip",
      "rafamadriz/friendly-snippets",
      "lukas-reineke/cmp-under-comparator",
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
      -- Icons
      "onsails/lspkind.nvim",
    },
    config = function()
      local cmp = require('cmp')
      local lsp_zero = require('lsp-zero')
      local cmp_action = lsp_zero.cmp_action()
      local luasnip = require("luasnip")
      local comparator = require("cmp-under-comparator")
      local lspkind = require('lspkind')

      -- this is the function that loads the extra snippets
      -- from rafamadriz/friendly-snippets
      require('luasnip.loaders.from_vscode').lazy_load()

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
            -- require("copilot_cmp.comparators").prioritize,
            -- require("copilot_cmp.comparators").score,
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
        formatting = lsp_zero.cmp_format({details = true}),
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          -- confirm completion item
          ['<Enter>'] = cmp.mapping.confirm({ select = true }),

          -- trigger completion menu
          ['<C-Space>'] = cmp.mapping.complete(),

          -- scroll up and down the documentation window
          ['<C-u>'] = cmp.mapping.scroll_docs(-4),
          ['<C-d>'] = cmp.mapping.scroll_docs(4),

          -- navigate between snippet placeholders
          ['<C-f>'] = cmp_action.luasnip_jump_forward(),
          ['<C-b>'] = cmp_action.luasnip_jump_backward(),
        }),
        sources = {
          -- {
          --   name = "copilot",
          --   group_index = 2,
          -- },
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
          { name = "cmp_tabnine" },
          { name = "nvim_lua" },
          { name = 'luasnip', keyword_length = 2 },
          { name = 'buffer', keyword_length = 3 },
          { name = "calc" },
          { name = "emoji" },
          { name = "treesitter" },
          { name = "crates" },
          { name = "tmux" },
        },
        -- mapping = cmp.mapping.preset.insert({
        --   ['<C-Space>'] = cmp.mapping.complete(),
        --   ['<C-u>'] = cmp.mapping.scroll_docs(-4),
        --   ['<C-d>'] = cmp.mapping.scroll_docs(4),
        -- }),
        snippet = {
          expand = function(args)
            vim.snippet.expand(args.body)
          end,
        },
      })
    end
  },
  {
    'sontungexpt/better-diagnostic-virtual-text',
    dependencies = {
      { "lewis6991/gitsigns.nvim" },
    },
    event = { "LspAttach" },
    config = function(_)
        require('better-diagnostic-virtual-text').setup(opts)
    end
  },
  -- LSP
  {
    'neovim/nvim-lspconfig',
    cmd = {'LspInfo', 'LspInstall', 'LspStart'},
    event = {'BufReadPre', 'BufNewFile'},
    dependencies = {
      {'hrsh7th/cmp-nvim-lsp'},
      {'williamboman/mason.nvim'},
      {'williamboman/mason-lspconfig.nvim'},
      {"folke/which-key.nvim"},
      -- {
      --   'sontungexpt/better-diagnostic-virtual-text',
      --   lazy = true,
      -- },
    },
    config = function()
      local lsp_zero = require('lsp-zero')
      lsp_zero.extend_lspconfig({
        sign_text = true,
        float_border = 'rounded',
        lsp_attach = function(client, buf)
          keymaps.lsp_attach(client, buf)
          require("eagle").setup({
            -- override the default values found in config.lua
            -- debug_mode = true
            border = "rounded",
          })
        end,
        capabilities = require('cmp_nvim_lsp').default_capabilities()
      })

      require('mason-lspconfig').setup({
        ensure_installed = {},
        handlers = {
          -- this first function is the "default handler"
          -- it applies to every language server without a "custom handler"
          function(server_name)
            if server_name == "lua_ls" then
              return require('lspconfig')[server_name].setup({
                on_init = function(client)
                  lsp_zero.nvim_lua_settings(client, {})
                end,
              })
            else
              require('lspconfig')[server_name].setup({})
            end
          end,
        }
      })
    end
  },
  -- added after lsp-zero
  {
    "ray-x/lsp_signature.nvim",
    event = "LspAttach",
    event = "VeryLazy",
    opts = {},
    -- config = function(_, opts) require'lsp_signature'.setup(opts) end
  },
  {
    'nvimdev/lspsaga.nvim',
    dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons',     -- optional
    },
    event = "LspAttach",
    opts ={
      -- your configuration
      -- Options with default value
      -- "single" | "double" | "rounded" | "bold" | "plus"
      border_style = "single",
      --the range of 0 for fully opaque window (disabled) to 100 for fully
      --transparent background. Values between 0-30 are typically most useful.
      saga_winblend = 0,
      -- when cursor in saga window you config these to move
      move_in_saga = { prev = "<C-p>", next = "<C-n>" },
      -- Error, Warn, Info, Hint
      -- use emoji like
      -- { "🙀", "😿", "😾", "😺" }
      -- or
      -- { "😡", "😥", "😤", "😐" }
      -- and diagnostic_header can be a function type
      -- must return a string and when diagnostic_header
      -- is function type it will have a param `entry`
      -- entry is a table type has these filed
      -- { bufnr, code, col, end_col, end_lnum, lnum, message, severity, source }
      diagnostic_header = { " ", " ", " ", "ﴞ " },
      -- preview lines above of lsp_finder
      preview_lines_above = 0,
      -- preview lines of lsp_finder and definition preview
      max_preview_lines = 10,
      -- use emoji lightbulb in default
      code_action_icon = "",
      -- if true can press number to execute the codeaction in codeaction window
      code_action_num_shortcut = true,
      -- same as nvim-lightbulb but async
      code_action_lightbulb = {
        enable = false,
        enable_in_insert = true,
        cache_code_action = true,
        sign = true,
        update_time = 150,
        sign_priority = 20,
        virtual_text = true,
      },
      -- finder icons
      finder_icons = {
        def = "  ",
        ref = "諭 ",
        link = "  ",
      },
      -- finder do lsp request timeout
      -- if your project big enough or your server very slow
      -- you may need to increase this value
      finder_request_timeout = 1500,
      finder_action_keys = {
        open = { "o", "<CR>" },
        vsplit = "s",
        split = "i",
        tabe = "t",
        quit = { "q", "<ESC>" },
      },
      code_action_keys = {
        quit = "q",
        exec = "<CR>",
      },
      definition_action_keys = {
        edit = "<C-c>o",
        vsplit = "<C-c>v",
        split = "<C-c>i",
        tabe = "<C-c>t",
        quit = "q",
      },
      rename_action_quit = "<C-c>",
      rename_in_select = true,
      -- show symbols in winbar must nightly
      -- in_custom mean use lspsaga api to get symbols
      -- and set it to your custom winbar or some winbar plugins.
      -- if in_cusomt = true you must set in_enable to false
      symbol_in_winbar = {
        in_custom = false,
        enable = true,
        separator = " ",
        show_file = true,
        -- define how to customize filename, eg: %:., %
        -- if not set, use default value `%:t`
        -- more information see `vim.fn.expand` or `expand`
        -- ## only valid after set `show_file = true`
        file_formatter = "",
        click_support = false,
      },
      -- show outline
      show_outline = {
        win_position = "right",
        --set special filetype win that outline window split.like NvimTree neotree
        -- defx, db_ui
        win_with = "",
        win_width = 30,
        auto_enter = true,
        auto_preview = true,
        virt_text = "┃",
        jump_key = "o",
        -- auto refresh when change buffer
        auto_refresh = true,
      },
      -- custom lsp kind
      -- usage { Field = 'color code'} or {Field = {your icon, your color code}}
      custom_kind = {},
      -- if you don't use nvim-lspconfig you must pass your server name and
      -- the related filetypes into this table
      -- like server_filetype_map = { metals = { "sbt", "scala" } }
      server_filetype_map = {},
    }
  },
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
      -- options
      notification = {
        -- Options related to the notification window and buffer
        window = {
          normal_hl = "Comment",      -- Base highlight group in the notification window
          winblend = 0,             -- Background color opacity in the notification window
          border = "none",            -- Border around the notification window
          zindex = 45,                -- Stacking priority of the notification window
          max_width = 0,              -- Maximum width of the notification window
          max_height = 0,             -- Maximum height of the notification window
          x_padding = 1,              -- Padding from right edge of window boundary
          y_padding = 0,              -- Padding from bottom edge of window boundary
          align = "bottom",           -- How to align the notification window
          relative = "editor",        -- What the notification window position is relative to
        },
      },
    },
  },
  {
    "jinzhongjia/LspUI.nvim",
    event = "LspAttach",
    branch = "main",
    -- config = function()
    --   require("LspUI").setup({
    --   -- config options go here
    --   })
    -- end
  },
  {
    "soulis-1256/eagle.nvim",
    event = "LspAttach",
  },
  {
    "folke/lazydev.nvim",
    ft = "lua", -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = "luvit-meta/library", words = { "vim%.uv" } },
      },
    },
  },
  { "Bilal2453/luvit-meta", lazy = true }, -- optional `vim.uv` typings
  { -- optional completion source for require statements and module annotations
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, {
        name = "lazydev",
        group_index = 0, -- set group index to 0 to skip loading LuaLS completions
      })
    end,
  },
}