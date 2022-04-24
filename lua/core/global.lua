local global = {}

require("core.debug") -- helps with dev

function global:load_variables()
  -- self.home = os.getenv("HOME")
	-- self.os = fs.os()
	-- self.path.cache = fs.get_cache()
	-- self.path.mods = fs.join(vim.fn.stdpath("config"), "lua", "modules")
	-- self.path.gconf = fs.join(vim.fn.stdpath("config"), "lua", "config", "global")
	-- self.path.conf = fs.join(vim.fn.stdpath("config"), "lua", "config", "custom")
	-- self.path.langs = fs.join(vim.fn.stdpath("config"), "lua", "languages", "global", "languages")
	-- self.path.lsp_langs = fs.join(vim.fn.stdpath("config"), "lua", "lsp", "languages")
	-- self.path.data = vim.fn.stdpath("data")
	-- self.path.lsp = fs.join(vim.fn.stdpath("data"), "lsp_servers")
	self.fs = require("core.fs")
	self.fn = require("core.fn")
	self.languages = {}
	self.current_cwd = vim.fn.getcwd()
	self.diagnostics = {}
	self.virtual_text = "no"
	self.pack_installer = nil
end

global:load_variables()

return global
