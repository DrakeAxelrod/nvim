local global = require("core.global")
local package_root = global.fs.join(global.fs.get_runtime(), "site", "pack")
local packer_compiled = global.fs.join(global.fs.get_runtime(), "packer_compiled.vim")
local compile_dir = global.fs.join(global.fs.get_runtime(), "site", "lua")
local compile_to_lua = global.fs.join(global.fs.get_runtime(), "site", "lua", "packer_compiled.lua")
local packer = nil

local Packer = {}
Packer.__index = Packer

function Packer:load_plugins()
	self.repos = {}
	for repo, conf in pairs(require("modules")) do
		if conf ~= false then
			self.repos[#self.repos + 1] = vim.tbl_extend("force", { repo }, conf)
		end
	end
end

local function convert_compile_file()
	local lines = {}
	local lnum = 1
	lines[#lines + 1] = "vim.cmd [[packadd packer.nvim]]\n"
	for line in io.lines(packer_compiled) do
		lnum = lnum + 1
		if lnum > 15 then
			lines[#lines + 1] = line .. "\n"
			if line == "END" then
				break
			end
		end
	end
	table.remove(lines, #lines)
	if vim.fn.isdirectory(compile_dir) ~= 1 then
		os.execute("mkdir -p " .. compile_dir)
	end
	if vim.fn.filereadable(compile_to_lua) == 1 then
		os.remove(compile_to_lua)
	end
	local file = io.open(compile_to_lua, "w")
	for _, line in ipairs(lines) do
		file:write(line)
	end
	file:close()
	os.remove(packer_compiled)
end

function Packer:load_packer()
	print("packer")
	if not packer then
		vim.cmd("packadd packer.nvim")
		packer = require("packer")
	end
	packer.init({
		package_root   	= package_root,
		compile_path 		= packer_compiled,
		git = { clone_timeout = 300 },
		display = {
			open_fn = function()
				return require("packer.util").float({ border = "single" })
			end,
		},
	})
	packer.reset()
	local use = packer.use
	self:load_plugins()
	use({ "wbthomason/packer.nvim", opt = true })
	for _, repo in ipairs(self.repos) do
		use(repo)
	end
	packer.on_complete = vim.schedule_wrap(function()
		packer.compile()
		packer.on_compile_done = vim.schedule_wrap(function()
			convert_compile_file()
		end)
	end)
end

function Packer:init_packer()
	local packer_path = global.fs.join(package_root, "packer", "opt", "packer.nvim")
	if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
		vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", packer_path })
		self:load_packer()
		packer.install()
	end
end

local plugins = setmetatable({}, {
	__index = function(_, key)
		if not packer then
			Packer:load_packer()
		end
		return packer[key]
	end,
})

function plugins.load_pack()
	Packer:init_packer()
	if vim.fn.filereadable(compile_to_lua) == 1 then
		require("packer_compiled")
	end

	vim.cmd([[command! PackerSync lua require("core.pack").sync()]])
	vim.cmd([[command! PackerStatus  lua require("core.pack").status()]])
end

return plugins
