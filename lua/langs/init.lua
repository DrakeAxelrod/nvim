local global = require("core.global")
local M = {}

M.filetypes = {
	["clojure"] = { "clojure", "edn" },
	["cmake"] = { "cmake" },
	["cpp"] = { "c", "cpp", "objc", "objcpp" },
	["cs"] = { "cs", "vb" },
	["css"] = { "css", "scss", "less" },
	["d"] = { "d" },
	["dart"] = { "dart" },
	["elixir"] = { "elixir", "eelixir" },
	["erlang"] = { "erlang" },
	["fortran"] = { "fortran" },
	["go"] = { "go", "gomod" },
	["graphql"] = { "graphql" },
	["groovy"] = { "groovy" },
	["html"] = { "html" },
	["java"] = { "java" },
	["json"] = { "json" },
	["jsts"] = {
		"javascript",
		"typescript",
		"javascriptreact",
		"typescriptreact",
	},
	["kotlin"] = { "kotlin" },
	["latex"] = { "bib", "tex" },
	["lua"] = { "lua" },
	["markdown"] = { "markdown" },
	["php"] = { "php" },
	["python"] = { "python" },
	["ruby"] = { "ruby" },
	["r"] = { "r", "rmd" },
	["rust"] = { "rust" },
	["shell"] = { "sh" },
	["sql"] = { "sql", "mysql" },
	["vim"] = { "vim" },
	["toml"] = { "toml" },
	["vue"] = { "vue" },
	["xml"] = { "xml", "xsd", "xsl", "xslt", "svg" },
	["yaml"] = { "yaml" },
}

M.setup = function()
	local filetype = vim.bo.filetype
	local proj_root_path = vim.fn.getcwd()
	for lang, v in pairs(M.filetypes) do
		for _, v2 in pairs(v) do
			if v2 == filetype then
				if lang == "jsts" and global.fs.is_file(global.fs.join(proj_root_path, "angular.json")) then
					M.start_language("angular", proj_root_path)
					M.start_language("jsts", proj_root_path)
				elseif lang == "jsts" and global.fs.is_file(global.fs.join(proj_root_path, "ember-cli-build.js")) then
					M.start_language("ember", proj_root_path)
					M.start_language("jsts", proj_root_path)
				else
					M.start_language(lang, proj_root_path)
				end
			end
		end
	end
end

function M.start_language(lang, proj_root_path)
	if global["langs"][lang] ~= nil then
		if global["langs"][lang]["proj_root_path"] == proj_root_path then
			-- nothing
			return
		else
			if global.fn.is_file(global.fs.join(proj_root_path, ".xyz", ("%s.lua"):format(lang))) then
				M.kill_server(lang)
				M.pre_init_language(lang, proj_root_path, "custom")
				M.init_language(lang, proj_root_path)
			elseif global["langs"][lang]["lsp_type"] == "global" then
				-- nothing
				return
			else
				M.kill_server(lang)
				M.pre_init_language(lang, proj_root_path, "global")
				M.init_language(lang, proj_root_path)
			end
		end
	else
		M.pre_init_language(lang, proj_root_path, "global")
		M.init_language(lang, proj_root_path)
	end
end

M.pre_init_language = function(lang, proj_root_path, lsp_type)
	global.current_pwd = proj_root_path
	global["langs"][lang] = {}
	global["langs"][lang]["proj_root_path"] = proj_root_path
	global["langs"][lang]["pid"] = {}
	global["langs"][lang]["lsp_type"] = lsp_type
end

function M.kill_server(lang)
	if next(global["langs"][lang]["pid"]) ~= nil then
		for _, pid in pairs(global["langs"][lang]["pid"]) do
			os.execute(("kill -9 %s > /dev/null 2>&1"):format(pid))
		end
	end
end

function M.init_language(lang, proj_root_path)
	-- gconf = global, cconf = custom, cont = merged
	local lang_conf, lang_gconf, lang_cconf, providers
	providers = global.fs.join(vim.fn.stdpath("config"), "lua", "langs", "providers")
	lang_gconf = dofile(global.fs.join(providers, ("%s.lua"):format(lang)))
	if global.fs.is_file(global.fs.join(proj_root_path, ".xyz", ("%s.lua"):format(lang))) then
		lang_cconf = dofile(global.fs.join(proj_root_path, ".xyz", ("%s.lua"):format(lang)))
		lang_conf = vim.tbl_deep_extend("force", lang_gconf, lang_cconf)
	else
		lang_conf = lang_gconf
	end
	for _, func in pairs(lang_conf) do
		func()
	end
	vim.cmd("e")
end

return M
