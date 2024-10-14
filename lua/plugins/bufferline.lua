return  {
  "akinsho/bufferline.nvim",
  dependencies = {
    -- "onsails/lspkind.nvim",
    "kyazdani42/nvim-web-devicons", -- OPTIONAL: if you want fancy icons
  },
  enabled = false,
  event = "VeryLazy",
  -- keys = {
  --   { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>", desc = "Toggle Pin" },
  --   { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete Non-Pinned Buffers" },
  --   { "<leader>bo", "<Cmd>BufferLineCloseOthers<CR>", desc = "Delete Other Buffers" },
  --   { "<leader>br", "<Cmd>BufferLineCloseRight<CR>", desc = "Delete Buffers to the Right" },
  --   { "<leader>bl", "<Cmd>BufferLineCloseLeft<CR>", desc = "Delete Buffers to the Left" },
  --   { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
  --   { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
  --   { "[b", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
  --   { "]b", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
  --   { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
  --   { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
  -- },
  opts = function()
    local bl = require("bufferline")
    return {
      options = {
        -- style_preset = bl.style_preset.slant, -- or bufferline.style_preset.minimal,
        -- stylua: ignore
        -- close_command = function(n) LazyVim.ui.bufremove(n) end,
        -- stylua: ignore
        -- right_mouse_command = function(n) LazyVim.ui.bufremove(n) end,
        diagnostics = "nvim_lsp",
        always_show_bufferline = true,
        -- diagnostics_indicator = function(_, _, diag)
        --   local icons = LazyVim.config.icons.diagnostics
        --   local ret = (diag.error and icons.Error .. diag.error .. " " or "")
        --     .. (diag.warning and icons.Warn .. diag.warning or "")
        --   return vim.trim(ret)
        -- end,
        -- indicator = {
        --   icon = "", --'▎', -- this should be omitted if indicator style is not 'icon'
        --   style = "underline", -- 'icon' | 'underline' | 'none',
        -- },
        hover = {
          enabled = true,
          delay = 200,
          reveal = {'close'}
        },
        separator_style = "slant", -- "slant" | "slope" | "thick" | "thin" | { 'any', 'any' },
        offsets = {
          {
            filetype = "neo-tree",
            text = "Neo-tree",
            highlight = "Directory",
            text_align = "left",
          },
        },
      },
    }
  end,
  -- config = function(_, opts)
  --   local bl = require("bufferline")
  --   bl.setup(opts)
  --   -- Fix bufferline when restoring a session
  --   vim.api.nvim_create_autocmd({ "BufAdd", "BufDelete" }, {
  --     callback = function()
  --       vim.schedule(function()
  --         pcall(nvim_bufferline)
  --       end)
  --     end,
  --   })
  -- end,
}
