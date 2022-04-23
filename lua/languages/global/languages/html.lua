-- Install Lsp server
-- :LspInstall html

local global = require("core.global")
local languages_setup = require("languages.global.utils")
local nvim_lsp_util = require("lspconfig/util")
local default_debouce_time = 150

local language_configs = {}

language_configs["lsp"] = function()
	local function start_html(server)
		server:setup({
			flags = {
				debounce_text_changes = default_debouce_time,
			},
			autostart = true,
			filetypes = { "html" },
			on_attach = function(client, bufnr)
				table.insert(global["languages"]["html"]["pid"], client.rpc.pid)
				vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
				languages_setup.document_highlight(client)
				languages_setup.document_formatting(client)
			end,
			capabilities = languages_setup.get_capabilities(),
			root_dir = function(fname)
				return nvim_lsp_util.find_git_ancestor(fname) or vim.fn.getcwd()
			end,
		})
	end
	languages_setup.setup_lsp("html", start_html)
end

return language_configs
