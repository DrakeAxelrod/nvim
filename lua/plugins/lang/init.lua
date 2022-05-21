return function()
	return {
		"williamboman/nvim-lsp-installer",
		after = "nvim-lspconfig",
		event = { "BufRead", "BufNewFile" },
		cmd = { "LspInfo", "LspInstall", "LspUninstall", "LspUpdate", "LspEnable", "LspDisable" },
		requires = {
			{ "neovim/nvim-lspconfig", module = "lspconfig" },
			{ "jose-elias-alvarez/null-ls.nvim" },
			{ "tamago324/nlsp-settings.nvim" },
			{ "b0o/SchemaStore.nvim" },
			{ "p00f/clangd_extensions.nvim" },
		},
		-- config = require("plugins.lsp_installer"),
		config = function()
			local fs = require("lib").fs
			-- local theme = require("theme")

			local installer_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
			if not installer_ok then
				return
			end

			local lspconfig_ok, lspconfig = pcall(require, "lspconfig")
			if not lspconfig_ok then
				return
			end

			local servers = {
				"sumneko_lua",
				"bashls",
			}
			lsp_installer.setup({
				automatic_installation = true,
				ui = {
					icons = {
						server_installed = "✓",
						server_pending = "➜",
						server_uninstalled = "✗",
					},
					keymaps = {
						toggle_server_expand = "<CR>",
						install_server = "i",
						update_server = "u",
						check_server_version = "c",
						update_all_servers = "U",
						check_outdated_servers = "C",
						uninstall_server = "X",
					},
				},
				log_level = vim.log.levels.INFO,
			})

      require("plugins.lang.handlers").setup()
			for _, server in pairs(servers) do
				local opts = {
					on_attach = require("plugins.lang.handlers").common_on_attach,
					capabilities = require("plugins.lang.handlers").common_capabilities(),
				}

				if fs.exists(fs.join(vim.fn.stdpath("config"), "lua", "plugins", "lang", "providers", server .. ".lua")) then
					local overides = require("plugins.lang.providers." .. server)
					opts = vim.tbl_deep_extend("force", overides, opts)
				end

				lspconfig[server].setup(opts)
			end

			require("plugins.lang.null-ls").setup()
		end,
	}
end
