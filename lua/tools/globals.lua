---@diagnostic disable: lowercase-global, duplicate-set-field, deprecated

-- 5.3 compatibility
local unpack = unpack or table.unpack
local loadstring = loadstring or load

--[[=============================[  Tables  ]=============================]]


table.unpack = table.unpack or unpack
--- returns the string representation of the table callable with {}:tostring()
--- @param self table the table to print
--- @return string the string representation of the table
table.tostring = function(self)
  return vim.inspect(self)
end

--- prints the table callable with {}:print()
--- @param self table the table to print
table.print = function(self)
  print(table.tostring(self))
end

-- map over keys
-- if multiple calls return the same key the result is undefined
--- @param self table the table to map over
--- @param f fun(key: any): any
--- @return table the mapped table
table.mapk = function(self, f)
  local tprime = {}
  for k, v in pairs(self) do
    tprime[f(k)] = v
  end
  return tprime
end

--- map over values
--- @param self table the table to map over
--- @param f fun(value: any): any
--- @return table the mapped table
table.mapv = function(self, f)
  local tprime = {}
  for k, v in pairs(self) do
    tprime[k] = f(v)
  end
  return tprime
end

--- map over keys and values
--- @param self table the table to map over
--- @param f fun(key: any, value: any): any
--- @return table the mapped table
table.mapkv = function(self, f)
  local tprime = {}
  for k, v in pairs(self) do
    k, v = f(k, v)
    tprime[k] = v
  end
  return tprime
end

--- map over table as list
--- @param self table list to map over
--- @param f fun(key: number, value: any): any
--- @return table the mapped table
table.map = function(self, f)
  local tprime = {}
  for i, v in ipairs(self) do
    tprime[i] = f(v)
  end
  return tprime
end

--[[=============================[  Strings  ]=============================]]
--

--- so you can s:tonumber()
--- @return number
string.tonumber = tonumber

--- python-style string formatting with %
--- @usage "hello %s" % "world" results in "hello world"
--- @param lhs string The string to format
--- @param rhs any The value to format into the string
--- @return string The formatted string
getmetatable("").__mod = function(lhs, rhs)
  if type(rhs) == "table" then
    return lhs:format(unpack(rhs))
  else
    return lhs:gsub("%%", "%%%%"):gsub("%%%%", "%%", 1):format(rhs)
  end
end

--- string... split(string, pattern. max) - break up string on pattern
--- @param self table: string
--- @param pat string - default value for pattern is to split on whitespace
--- @param max number - default value for max is infinity
--- @return any
string.split = function(self, pat, max)
  pat = pat or "%s+"
  max = max or nil
  local count = 0
  local i = 1
  local result = { 1 }

  local function splitter(sof, eof)
    result[#result] = self:sub(result[#result], sof - 1)
    result[#result + 1] = eof
  end

  if pat == "" then
    return self
  end

  self:gsub("()" .. pat .. "()", splitter, max)

  result[#result] = self:sub(result[#result], #self)

  return unpack(result)
end

--- string trim(string) - remove whitespace from start and end of string
--- @param self string
--- @return string, number - trimmed string, number of characters trimmed
string.trim = function(self)
  return self:gsub("^%s*", ""):gsub("%s*$", "")
end

--- string join(seperator, ...) - concatenate strings
--- @param sep string
--- @param ... string
--- @return string
string.join = function(sep, ...)
  return table.concat({ ... }, sep)
end

--- rfind - as string.find() only backwards
--- @param self string to search
--- @param pattern string lua regex to search for
--- @param rinit number initial position to start search from
--- @param plain boolean whether to treat pattern as plain text
--- @return number, number start and end of match
string.rfind = function(self, pattern, rinit, plain)
  self = self:sub(1, rinit)

  local old_R = {}
  local R = { self:find(pattern, 1, plain) }

  while true do
    if R[1] == nil then
      return unpack(old_R)
    end
    old_R, R = R, { self:find(pattern, R[2] + 1) }
  end
end

--- Checks if a string is empty or nil
--- @param self string to check
--- @return boolean
string.isempty = function(self)
  return self == nil or self == ""
end

--[[=============================[  IO  ]=============================]]
--

-- printf(format, ...)
--- @param ... string to print
printf = function(...)
  ---@diagnostic disable-next-line: undefined-field
  return io.output():printf(...)
end

--- printf to standard error
--- @param ... any
eprintf = function(...)
  ---@diagnostic disable-next-line: undefined-field
  return io.stderr:printf(...)
end

--- bind to io tables, so that file:printf(...) becomes legal
getmetatable(io.stdout).__index.printf = function(self, ...)
  return self:write(string.format(...))
end

--- read a file into a string
--- @param path string
--- @return string
io.readfile = function(path)
  local fd = assert(io.open(path, "rb"))
  local buf = assert(fd:read "*a")
  fd:close()
  return buf
end

--- write a string to a file
--- @param path string path to file
--- @param data string string to write
--- @return boolean
io.writefile = function(path, data)
  local fd = assert(io.open(path, "wb"))
  assert(fd:write(data))
  fd:close()
  return true
end

--- Check if a file exists and is readable
--- @param path string path to file
--- @param mode string - default is "r"
--- @return boolean
io.exists = function(path, mode)
  local fd = io.open(path, mode or "r")
  if fd then
    fd:close()
    return true
  end
  return false
end

--[[=============================[  General  ]=============================]]

--- Deep copy a table (or other value)
--- @param value any the value to copy
--- @return any
function deepcopy(value)
  local orig_type = type(value)
  local copy
  if orig_type == "table" then
    copy = {}
    for orig_key, orig_value in next, value, nil do
      copy[deepcopy(orig_key)] = deepcopy(orig_value)
    end
    setmetatable(copy, deepcopy(getmetatable(value)))
  else -- number, string, boolean, etc
    copy = value
  end
  return copy
end

--- "safe require", returns nil,error if require fails rather than
--- throwing an error
--- @param ... any the arguments to pass to require
--- @return any the result of require
srequire = function(...)
  local s, r = pcall(require, ...)
  if s then
    return r
  end
  return nil
end

-- source all the core config files
-- for _, name in ipairs(core_conf_files) do
--   local path = string.format("%s/core/%s", vim.fn.stdpath("config"), name)
--   local source_cmd = "source " .. path
--   vim.cmd(source_cmd)
-- end

brequire = function(...)
  vim.cmd("source %s" % joinpath(vim.fn.stdpath("config"), ...))
end


get_relative_dir = function()
  local init_path = debug.getinfo(1, "S").source
  return init_path:sub(2):match("(.*[/\\])"):sub(1, -2)
end

rrequire = function(...)
  return assert(loadfile(joinpath(get_relative_dir(), ...)))
end

--- import(mod, fn) - import a module and call a function with it
--- if the module is not found, do nothing
--- @param mod string - the module to import
--- @param fn fun(mod) - the function to call with the module as an argument
import = function(mod, fn)
  local m = srequire(mod)
  if m then
    fn(m)
  end
end

--- fast one-liner lambda creation
--- @usage local a = f("a => a + 1") -- a is a function that adds 1 to its argument
--- @param src string - the lambda to create
--- @return fun(...) - the created function
function f(src)
  return assert(loadstring("return function(" .. src:gsub(" => ", ") return ") .. " end"))()
end

--- Get field from metatable, return nil if no metatable
--- @param v any - the object to get the field from
--- @param k string - the field to get
--- @return any
getmetafield = function(v, k)
  local mt = getmetatable(v)
  return mt and rawget(mt, k)
end

--- As tonumber/tostring, but casts to bool
--- @param v any - the value to cast
--- @return boolean
toboolean = function(v)
  return not not v
end

--- returns the path seperator for the current OS
--- @return string
pathsep = function()
  if package.config:sub(1, 1) == "\\" then
    return "\\"
  else
    return "/"
  end
end

--- returns a string joined by the path seperator
--- @param ... any to join
--- @return string joined string
joinpath = function(...)
  return table.concat({ ... }, pathsep())
end

--- returns whether a file is executable
--- @param path string - the path to the file
--- @return boolean
executable = function(path)
  if vim.fn.executable(path) > 0 then
    return true
  end
  return false
end

--- check whether a feature exists in Nvim
--- @feat: string
---   the feature name, like `nvim-0.7` or `unix`.
--- return: bool
has = function(feat)
  if vim.fn.has(feat) == 1 then
    return true
  end

  return false
end

get_nvim_version = function()
  local v = vim.version()
  return string.format("%d.%d.%d", v.major, v.minor, v.patch)
end

--- global wrapper for vim.pretty_print
--- @param ... any - the value to print
dump = function(...)
  vim.pretty_print(...)
end

--- reloads a module
--- @param mod string - the module to reload
reload = function(mod)
  for name, _ in pairs(package.loaded) do
    if name:match("^" .. mod) then
      package.loaded[name] = nil
      require(name)
      return
    end
  end
end

local ok, plenary_reload = pcall(require, "plenary.reload")
if not ok then
  reloader = reload
else
  reloader = plenary_reload.reload_module
end

--- reloads a module and all of its dependencies
--- @param ... string - the module to reload
--- @return any
RELOAD = function(...)
  return reloader(...)
end

--- reloads a module and all of its dependencies
--- @param ... string - the module to reload
R = function(...)
  RELOAD(...)
  return require(...)
end

--- reads all files and directories in a directory and returns them as a table
--- @param dir string - the path to the directory
--- @return table
readdir = function(dir)
  local packages_dir = vim.fn.stdpath "config" .. "/lua/" .. dir .. "/"
  if vim.fn.empty(vim.fn.glob(packages_dir)) > 0 then
    return {}
  end
  return vim.tbl_map(function(file)
    return file:match "(.*)%.lua" or file
  end, vim.fn.readdir(packages_dir))
end

--[[=============================[  Log  ]=============================]]

Log = {
  level = {
    DEBUG = 1,
    ERROR = 4,
    INFO = 2,
    OFF = 5,
    TRACE = 0,
    WARN = 3
  }
}

-- --- Log a debug message
-- --- @param msg string the message to log
-- --- @param opt? table the options to pass to log
-- Log.debug = function(msg, opt)
--   opt = opt or {}
--   vim.notify(msg, Log.level.DEBUG, opt)
-- end

-- --- Log an error message
-- --- @param msg string the message to log
-- --- @param opt? table the options to pass to log
-- Log.error = function(msg, opt)
--   opt = opt or {}
--   vim.notify(msg, Log.level.ERROR, opt)
-- end

-- --- Log an info message
-- --- @param msg string the message to log
-- --- @param opt? table the options to pass to log
-- Log.info = function(msg, opt)
--   opt = opt or {}
--   vim.notify(msg, Log.level.INFO, opt)
-- end

-- --- Log a trace message
-- --- @param msg string the message to log
-- --- @param opt? table the options to pass to log
-- Log.trace = function(msg, opt)
--   opt = opt or {}
--   vim.notify(msg, Log.level.TRACE, opt)
-- end

-- --- Log a warn message
-- --- @param msg string the message to log
-- --- @param opt? table the options to pass to log
-- Log.warn = function(msg, opt)
--   opt = opt or {}
--   vim.notify(msg, Log.level.WARN, opt)
-- end

CONF = nil

--- Packer plugin specification
--- @class Plugin : table
--- @field [1] string The name repo in the format of `user/repo`
--- @field disable? boolean Mark a plugin as inactive
--- @field as? string Specifies an alias under which to install the plugin
--- @field installer? fun(): any Specifies custom installer. See "custom installers" below.
--- @field updater? fun():any Specifies custom updater. See "custom installers" below.
--- @field after? string | table Specifies plugins to load before this plugin. See "sequencing" below
--- @field rtp? string Specifies a subdirectory of the plugin to add to runtimepath.
--- @field opt? boolean Manually marks a plugin as optional.
--- @field bufread? boolean Manually specifying if a plugin needs BufRead after being loaded
--- @field branch? string Specifies a git branch to use
--- @field tag? string Specifies a git tag to use. Supports '*' for "latest tag"
--- @field commit? string Specifies a git commit to use
--- @field lock? boolean Skip updating this plugin in updates/syncs. Still cleans.
--- @field run? string | fun(): any | table Post-update/install hook. See "update/install hooks".
--- @field requires? string | table Specifies plugin dependencies. See "dependencies".
--- @field rocks? string | table Specifies Luarocks dependencies for the plugin
--- @field config? string | fun(): any Specifies code to run after this plugin is loaded.
--- @field setup? string | fun(): any Specifies code to run before this plugin is loaded. The code is ran even if the plugin is waiting for other conditions (ft, cond...) to be met.
--- @field cmd? string | table Specifies commands which load this plugin. Can be an autocmd pattern. imply lazy-loading and imply opt = true.
--- @field ft? string | table Specifies filetypes which load this plugin. imply lazy-loading and imply opt = true.
--- @field keys? string | table Specifies maps which load this plugin. See "Keybindings". imply lazy-loading and imply opt = true.
--- @field event? string | table Specifies autocommand events which load this plugin. imply lazy-loading and imply opt = true.
--- @field fn? string | table Specifies functions which load this plugin. imply lazy-loading and imply opt = true.
--- @field cond? string | fun(): any | table of strings/functions Specifies a conditional test to load this plugin. imply lazy-loading and imply opt = true. imply lazy-loading and imply opt = true.
--- @field module? string | table Specifies Lua module names for require. When requiring a string which starts with one of these module names, the plugin will be loaded. imply lazy-loading and imply opt = true.
--- @field module_pattern? string | table Specifies Lua pattern of Lua module names for require. When requiring a string which matches one of these patterns, the plugin will be loaded. imply lazy-loading and imply opt = true.
Plugin = {
  [1] = 'username/example',
  disable = nil,
  as = nil,
  installer = nil,
  updater = nil,
  after = nil,
  rtp = nil,
  opt = nil,
  bufread = nil,
  branch = nil,
  tag = nil,
  commit = nil,
  lock = nil,
  run = nil,
  requires = nil,
  rocks = nil,
  config = nil,
  setup = nil,
  cmd = nil,
  ft = nil,
  keys = nil,
  event = nil,
  fn = nil,
  cond = nil,
  module = nil,
  module_pattern = nil
}
