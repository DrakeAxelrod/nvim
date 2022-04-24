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
		Function = "  (Function)",
		Constructor = "   (Constructor)",
		Field = " ﰠ  (Field)",
		Variable = "[] (Variable)",
		Class = "   (Class)",
		Interface = " ﰮ  (Interface)",
		Module = "   (Module)",
		Property = " ﰠ  (Property)",
		Unit = "   (Unit)",
		Value = "   (Value)",
		Enum = " 練  (Enum)",
		Keyword = "   (Keyword)",
		Snippet = "   (Snippet)",
		Color = "   (Color)",
		File = "   (File)",
		Reference = "  (Reference)",
		Folder = "   (Folder)",
		EnumMember = "   (EnumMember)",
		Constant = "   (Constant)",
		Struct = "   (Struct)",
		Event = "  (Event)",
		Operator = "   (Operator)",
		TypeParameter = "  (TypeParameter)",
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
			fields = { "kind", "abbr", "menu" },
			format = function(entry, item)
				item.kind = lsp_symbols[item.kind]
				item.menu = ({
					nvim_lua = "(Nvim)",
					luasnip = "(Snippet)",
					nvim_lsp = "(LSP)",
					buffer = "(Buffer)",
					path = "(Path)",
				})[entry.source.name]
				return item
			end,
		},
		sources = {
			{	name = "luasnip" },
			{ name = "nvim_lsp" },
			{ name = "nvim_lua" },
    	{ name = "lua-dev" },
			{ name = "path" },
			{ name = "buffer" },
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		-- documentation = true,
		-- documentation = {
		--   border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
		-- },
		experimental = {
			ghost_text = true,
			native_menu = false,
		},
	})
end

function M.wilder()
  local wilder = require("wilder")
	local accent_color = "#4aa5f0"
  wilder.setup({modes = {":", "/", "?"}})
  wilder.set_option("use_python_remote_plugin", 0) -- Disable Python remote plugin
  wilder.set_option("pipeline", {
    wilder.branch(
      wilder.cmdline_pipeline({
        fuzzy = 1,
        fuzzy_filter = wilder.lua_fzy_filter(),
      }),
      wilder.vim_search_pipeline()
    )
  })
  wilder.set_option("renderer", wilder.popupmenu_renderer({
      highlighter = wilder.lua_fzy_highlighter(),
      highlights = {
        accent = wilder.make_hl("WilderAccent", "Pmenu", {{a = 1}, {a = 1}, { foreground = accent_color }}),
      },
      left = { " ", wilder.popupmenu_devicons() },
      right = { " ", wilder.popupmenu_scrollbar() },
      pumblend = 0,
      max_height = "50%",      -- max height of the palette
      min_height = 0,          -- set to the same as "max_height" for a fixed height window
      prompt_position = "top", -- "top" or "bottom" to set the location of the prompt
      reverse = 0,             -- set to 1 to reverse the order of the list, use in combination with "prompt_position"
    }
  ))
end

function M.github_copilot()
	vim.g.copilot_filetypes = {
		["*"] = false,
	}
	-- vim.api.nvim_set_var("copilot_no_tab_map", true)
	-- vim.keymap.set("i", "<C-A>", ":Copilot<CR>", { noremap = true, silent = true, expr = true})
	vim.cmd [[
		imap <silent><script><expr> <C-A> copilot#Accept("\<CR>")
		" let g:copilot_no_tab_map = v:true
	]]
end

return M
