local global = {
  path = {},
}
require "core.debug" -- helps with dev
local fs = require "core.fs"
local fn = require "core.fn"

function global:load_variables()
  self.fs = fs
  self.fn = fn
  self.langs = {}
  self.current_cwd = vim.fn.getcwd()
  self.diagnostics = {}
  self.virtual_text = "no"
  self.pack_installer = nil
end

global:load_variables()

return global
