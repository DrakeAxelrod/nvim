local global = require("core.global")
local langs_setup = require("langs.utils")
local nvim_lsp_util = require("lspconfig/util")
local default_debouce_time = 150
local lang_configs = {}


local function sumneko_lua_opts()
	local opts = {
		flags = {
			debounce_text_changes = default_debouce_time,
		},
		autostart = true,
		filetypes = { "lua" },
		on_attach = function(client, bufnr)
			table.insert(global["langs"]["lua"]["pid"], client.rpc.pid)
			vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
			langs_setup.document_highlight(client)
			langs_setup.document_formatting(client)
		end,
		capabilities = langs_setup.get_capabilities(),
		settings = {
			Lua = {
				completion = { keywordSnippet = "Disable" },
				diagnostics = {
					globals = {
						vim = { fields = { "g", "opt" } },
						"use",
						"packer_plugins"
					},
					disable = { "lowercase-global" },
				},
				runtime = { version = "LuaJIT", path = vim.split(package.path, ";") },
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.expand("$VIMRUNTIME/lua/vim/lsp")] = true,
					},
				},
			},
		},
		root_dir = function(fname)
			return nvim_lsp_util.find_git_ancestor(fname) or vim.fn.getcwd()
		end,
	}
	return opts
end

local function lua_dev_pipe(opts)
	local lua_dev_loaded, lua_dev = pcall(require, "lua-dev")
	if not lua_dev_loaded then
		return opts
	end
	return lua_dev.setup({
		library = {
			vimruntime = true, -- runtime path
			types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
			-- plugins = true, -- installed opt or start plugins in packpath
			-- you can also specify the list of plugins to make available as a workspace library
			plugins = { "plenary.nvim" },
		},
		lspconfig = opts,
	})
end

lang_configs["lsp"] = function()
	local function start(server)
		local opts = lua_dev_pipe(sumneko_lua_opts())
		server:setup(opts)
	end

	langs_setup.setup_lsp("sumneko_lua", start)
end

return lang_configs
