if not import then require("core.globals") end
if not core.augroup then require("core.fn") end
if not core.plugins then require("core.pack") end


core._inner.apply_options = function()
  for scope, settings in pairs(core._inner.options) do
    for key, value in pairs(settings) do
      vim[scope][key] = value
    end
  end
end

core._inner.apply_keymaps = function()
  for k, v in ipairs(core._inner.keymaps) do
    if type(k) == "number" then

    end
  end
end

core._inner.apply_commands = function()
end

core._inner.apply_autocommands = function()
end

core.load = function()
  pcall(require, core.options_dir)
  pcall(require, core.keymaps_dir)
  pcall(require, core.commands_dir)
  pcall(require, core.autocommands_dir)
  core._inner.apply_options()
  core._inner.apply_plugins()
  core._inner.apply_keymaps()
  core._inner.apply_commands()
  core._inner.apply_autocommands()
end
