return function()
	return {
		{
			"hrsh7th/nvim-cmp",
			event = { "BufRead", "BufReadPre", "InsertEnter" },
			after = { "friendly-snippets", "LuaSnip" },
			requires = {
				{ "L3MON4D3/LuaSnip", event = { "InsertEnter", "CmdlineEnter" } },
				{ "rafamadriz/friendly-snippets", event = { "InsertEnter", "CmdlineEnter" } },
			},
			config = function()
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
				local kind_icons = require("theme").icons.kind
				cmp.setup({
					preselect = cmp.PreselectMode.None,
					formatting = {
						fields = { "kind", "abbr", "menu" },
						format = function(entry, vim_item)
							-- Kind icons
							vim_item.kind = ("%s"):format(kind_icons[vim_item.kind])
							-- NOTE: order matters
							vim_item.menu = ({
								nvim_lsp = "(lsp)",
								copilot = "(copilot)",
								nvim_lsp_signature_help = "(signature)",
								luasnip = "(snippet)",
								-- ["lua-dev"] = "(ldev)",
								-- nvim_lua = "(nvim)",
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
						-- { name = "nvim_lua", priority = 500 },
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
					experimental = {
						ghost_text = true,
						native_menu = false,
					},
					window = {
						completion = cmp.config.window.bordered(),
						documentation = cmp.config.window.bordered(),
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
				})
			end,
		},
		-- Snippet completion source
		{ "saadparwaiz1/cmp_luasnip", after = "nvim-cmp" },
		-- Lsp completion source
		{ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" },
		-- Buffer completion source
		{ "hrsh7th/cmp-buffer", after = "nvim-cmp" },
		-- Path completion source
		{ "hrsh7th/cmp-path", after = "nvim-cmp" },
		-- Nvim api completion source
		{ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" },
		-- Signature completion source
		{ "hrsh7th/cmp-nvim-lsp-signature-help", after = "nvim-cmp" },
		--> copilot <--
		{
			"zbirenbaum/copilot-cmp",
			after = { "nvim-cmp", "copilot.lua" },
			requires = {
				"zbirenbaum/copilot.lua",
				-- event = { "VimEnter" },
				-- config = function()
				-- 	vim.defer_fn(function()
				-- 		require("copilot").setup()
				-- 	end, 100)
				-- end,
			},
		},
	}
end
