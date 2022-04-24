local M = {}


function M.nvim_cmp()
	local cmp_status_ok, cmp = pcall(require, "cmp")
	if not cmp_status_ok then
		return
	end
	local snip_status_ok, luasnip = pcall(require, "luasnip")
	if not snip_status_ok then
		return
	end
	require("luasnip.loaders.from_vscode").lazy_load()
	local check_backspace = function()
		local col = vim.fn.col(".") - 1
		return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
	end
	local lsp_symbols = {
		Text = "   (Text) ",
		Method = "   (Method)",
		Function = "   (Function)",
		Constructor = "   (Constructor)",
		Field = " ﴲ  (Field)",
		Variable = "[] (Variable)",
		Class = "   (Class)",
		Interface = " ﰮ  (Interface)",
		Module = "   (Module)",
		Property = " 襁 (Property)",
		Unit = "   (Unit)",
		Value = "   (Value)",
		Enum = " 練 (Enum)",
		Keyword = "   (Keyword)",
		Snippet = "   (Snippet)",
		Color = "   (Color)",
		File = "   (File)",
		Reference = "   (Reference)",
		Folder = "   (Folder)",
		EnumMember = "   (EnumMember)",
		Constant = "   (Constant)",
		Struct = "   (Struct)",
		Event = "   (Event)",
		Operator = "   (Operator)",
		TypeParameter = "   (TypeParameter)",
	}
	cmp.setup({
		snippet = {
			expand = function(args)
				luasnip.lsp_expand(args.body)
			end,
		},
		mapping = {
			["<C-p>"] = cmp.mapping.select_prev_item(),
			["<C-n>"] = cmp.mapping.select_next_item(),
			["<C-d>"] = cmp.mapping.scroll_docs(-4),
			["<C-f>"] = cmp.mapping.scroll_docs(4),
			["<C-Space>"] = cmp.mapping.complete(),
			["<C-e>"] = cmp.mapping.close(),
			["<CR>"] = cmp.mapping.confirm({
				behavior = cmp.ConfirmBehavior.Replace,
				select = true,
			}),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif luasnip.expandable() then
					luasnip.expand()
				elseif luasnip.expand_or_jumpable() then
					luasnip.expand_or_jump()
				elseif check_backspace() then
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
		},
		formatting = {
			format = function(entry, item)
				item.kind = lsp_symbols[item.kind]
				item.menu = ({
					luasnip = "[Snippet]",
					nvim_lsp = "[LSP]",
					buffer = "[Buffer]",
					path = "[Path]",
				})[entry.source.name]
				return item
			end,
		},
		sources = {
			{
				name = "luasnip",
			},
			{
				name = "nvim_lsp",
			},
			{
				name = "path",
			},
			{
				name = "buffer",
			},
			{
				name = "crates",
			},
			{
				name = "latex_symbols",
			},
			-- {
			-- 	name = "orgmode",
			-- },
		},
	})
	cmp.setup.cmdline("/", {
		sources = {
			{ name = "buffer" },
		},
	})
	cmp.setup.cmdline(":", {
		sources = cmp.config.sources({
			{ name = "path" },
		}, {
			{ name = "cmdline" },
		}),
	})
end

function M.wilder()
  local wilder = require("wilder")
  wilder.setup({modes = {":", "/", "?"}})
  -- Disable Python remote plugin
  wilder.set_option("use_python_remote_plugin", 0)


  local accent_color = "#4aa5f0"
  -- local gradient = {
  --   "#f4468f", "#fd4a85", "#ff507a", "#ff566f", "#ff5e63",
  --   "#ff6658", "#ff704e", "#ff7a45", "#ff843d", "#ff9036",
  --   "#f89b31", "#efa72f", "#e6b32e", "#dcbe30", "#d2c934",
  --   "#c8d43a", "#bfde43", "#b6e84e", "#aff05b"
  -- }
  -- for i, fg in ipairs(gradient) do
  --   gradient[i] = wilder.make_hl("WilderGradient" .. i, "Pmenu", {{a = 1}, {a = 1}, {foreground = fg}})
  -- end

  wilder.set_option("pipeline", {
    wilder.branch(
      wilder.cmdline_pipeline({
        fuzzy = 1,
        fuzzy_filter = wilder.lua_fzy_filter(),
      }),
      wilder.vim_search_pipeline()
    )
  })

  -- wilder.set_option("renderer", wilder.popupmenu_renderer(
  --   wilder.popupmenu_palette_theme({
  --       highlighter = wilder.highlighter_with_gradient({wilder.lua_fzy_highlighter()}),
  --       left = {
  --         " ",
  --         wilder.popupmenu_devicons()
  --       },
  --       right = {
  --         " ",
  --         wilder.popupmenu_scrollbar()
  --       },
  --       highlights = {
  --         gradient = gradient, -- must be set
  --         -- selected_gradient key can be set to apply gradient highlighting for the selected candidate.
  --         -- accent = wilder.make_hl("WilderAccent", "Pmenu", {{a = 1}, {a = 1}, { foreground = accent_color }}),
  --       },
  --       -- "single", "double", "rounded" or "solid"
  --       -- can also be a list of 8 characters, see :h wilder#popupmenu_palette_theme() for more details
  --       border = "rounded",
  --       max_height = "50%",      -- max height of the palette
  --       min_height = 0,          -- set to the same as "max_height" for a fixed height window
  --       prompt_position = "top", -- "top" or "bottom" to set the location of the prompt
  --       reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with "prompt_position"
  --   })
  -- ))
  wilder.set_option("renderer", wilder.popupmenu_renderer({
      -- highlighter = wilder.highlighter_with_gradient({wilder.lua_fzy_highlighter()}),
      -- highlights = {
      --   gradient = gradient, -- must be set
      -- },
      highlighter = wilder.lua_fzy_highlighter(),
      highlights = {
        accent = wilder.make_hl("WilderAccent", "Pmenu", {{a = 1}, {a = 1}, { foreground = accent_color }}),
      },
      left = {
        " ",
        wilder.popupmenu_devicons()
      },
      right = {
        " ",
        wilder.popupmenu_scrollbar()
      },
      pumblend = 0,
      -- max_width = "50%",      -- max width of the popupmenu, can also be a number
      -- min_width = "30%",      -- minimum height of the popupmenu, can also be a number
      max_height = "50%",      -- max height of the palette
      min_height = 0,          -- set to the same as "max_height" for a fixed height window
      prompt_position = "top", -- "top" or "bottom" to set the location of the prompt
      reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with "prompt_position"
    }
  ))
end

return M
