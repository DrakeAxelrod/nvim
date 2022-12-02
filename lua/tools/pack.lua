
local M = {}

M.data_dir = joinpath(vim.fn.stdpath "data", "site")
M.nvim_path = vim.fn.stdpath "config"
M.plugins_dir = joinpath(M.nvim_path, "lua", "plugins")
M.packer_compiled = joinpath(M.data_dir, "lua", "packer_compiled.lua")
M.set_plugins_dir = function(dir)
  M.plugins_dir = joinpath(M.nvim_path, "lua", dir)
end

local uv, api = vim.loop, vim.api

local packer = nil
local Packer = {}
Packer.__index = Packer

function Packer:load_plugins()
  self.repos = {}

  local get_plugins_list = function()
    -- git all files and directories in the modules dir
    -- local modules = vim.fn.globpath(modules_dir, "*", true, true)
    -- recursively search for all files named plugins.lua
    local list = vim.fn.globpath(M.plugins_dir, "**/plugins.lua", true, true)
    -- remove all files that are not named plugins.lua
    for i, f in ipairs(list) do
      list[i] = string.match(f, "lua/(.+).lua$")
    end
    return list
  end

  local plugins_file = get_plugins_list()
  for _, m in ipairs(plugins_file) do
    require(m)
  end
end

function Packer:load_packer()
  if not packer then
    api.nvim_command "packadd packer.nvim"
    packer = require "packer"
  end
  packer.init {
    compile_path = M.packer_compiled,
    disable_commands = true,
    display = {
      open_fn = require("packer.util").float,
      working_sym = "ﰭ",
      error_sym = "",
      done_sym = "",
      removed_sym = "",
      moved_sym = "ﰳ",
    },
    git = { clone_timeout = 120 },
  }
  packer.reset()
  local use = packer.use
  self:load_plugins()
  use { "wbthomason/packer.nvim", opt = true }
  for _, repo in ipairs(self.repos) do
    use(repo)
  end
end

function Packer:init_ensure_plugins()
  local packer_dir = joinpath(M.data_dir, "pack", "packer", "opt", "packer.nvim")
  local state = uv.fs_stat(packer_dir)
  if not state then
    local cmd = "!git clone https://github.com/wbthomason/packer.nvim " .. packer_dir
    api.nvim_command(cmd)
    uv.fs_mkdir(M.data_dir .. "lua", 511, function()
      assert "make compile path dir failed"
    end)
    self:load_packer()
    packer.sync()
  end
end

function Packer:cli_compile()
  self:load_packer()
  packer.compile()
  vim.defer_fn(function()
    vim.cmd "q"
  end, 1000)
end

local plugins = setmetatable(M, {
  __index = function(_, key)
    if key == "Packer" then
      return Packer
    end
    if not packer then
      Packer:load_packer()
    end
    return packer[key]
  end,
})

function plugins.ensure_plugins()
  Packer:init_ensure_plugins()
end

function plugins.register_plugin(repo)
  if not Packer.repos then
    Packer.repos = {}
  end
  table.insert(Packer.repos, repo)
end

function plugins.auto_compile()
  local file = api.nvim_buf_get_name(0)
  if not file:match(M.nvim_path) then
    return
  end

  if file:match "plugins.lua" then
    plugins.clean()
  end
  plugins.compile()
  require "packer_compiled"
end

function plugins.load_compile()
  if vim.fn.filereadable(M.packer_compiled) == 1 then
    require "packer_compiled"
  end

  local cmds = {
    "Compile",
    "Install",
    "Update",
    "Sync",
    "Clean",
    "Status",
  }

  for _, cmd in ipairs(cmds) do
    api.nvim_create_user_command("Packer" .. cmd, function()
      require("tools.pack")[string.lower(cmd)]()
    end, {})
  end

  local PackerHooks = vim.api.nvim_create_augroup("PackerHooks", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    group = PackerHooks,
    pattern = "PackerCompileDone",
    callback = function()
      vim.notify("Compile Done!", vim.log.levels.INFO, { title = "Packer" })
      dofile(vim.env.MYVIMRC)
    end,
  })

  api.nvim_create_autocmd("BufWritePost", {
    pattern = "*.lua",
    callback = function()
      plugins.auto_compile()
    end,
    desc = "Auto Compile the neovim config which write in lua",
  })
end

return plugins
