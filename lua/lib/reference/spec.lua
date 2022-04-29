---@module Module
---@field repo string username/example
---@field disable? true|false Mark a plugin as inactive
---@field as? string Specifies an alias under which to install the plugin
---@field installer? function Specifies custom installer. See "custom installers" below.
---@field updater? function Specifies custom updater. See "custom installers" below
---@field after? string|list Specifies plugins to load before this plugin. See "sequencing" below
---@field rtp? string Specifies a subdirectory of the plugin to add to runtimepath.
---@field opt? boolean Manually marks a plugin as optional.
---@field branch? string Specifies a git branch to use
---@field tag? string Specifies a git tag to use. Supports '*' for "latest tag"
---@field commit? string Specifies a git commit to use
---@field lock? boolean Skip updating this plugin in updates/syncs. Still cleans.
---@field run?  string|function|table Post-update/install hook. See "update/install hooks".
---@field requires? string|list Specifies plugin dependencies. See "dependencies".
---@field rocks? string|list Specifies Luarocks dependencies for the plugin
---@field config? string|function Specifies code to run after this plugin is loaded.
---@field setup? string|function Specifies code to run before this plugin is loaded. The setup key implies opt = true.
---@meta The following keys all imply lazy-loading and imply opt = true
---@field cmd? string|list Specifies commands which load this plugin. Can be an autocmd pattern.
---@field ft? string|list Specifies filetypes which load this plugin.
---@field keys? string|list Specifies maps which load this plugin. See "Keybindings".
---@field event? string|list Specifies autocommand events which load this plugin.
---@field fn? string|list Specifies functions which load this plugin.
---@field cond? string|function|[strings|functions] Specifies a conditional test to load this plugin
---@field module? string|list Specifies Lua module names for require. When requiring a string which starts with one of these module names, the plugin will be loaded.
---@field module_pattern? string|list Specifies Lua pattern of Lua module names for require. When requiring a string which matches one of these patterns, the plugin will be loaded.

-- ```ts
-- interface Module {
--   // username/example
--   repo: string
--   // Mark a plugin as inactive
--   disable?: true|false
--   // Specifies an alias under which to install the plugin
--   as?: string
--   // Specifies custom installer. See "custom installers" below.
--   installer?: function
--   // Specifies custom updater. See "custom installers" below
--   updater?: function
--   // Specifies plugins to load before this plugin. See "sequencing" below
--   after?: string|list
--   // Specifies a subdirectory of the plugin to add to runtimepath.
--   rtp?: string
--   // Manually marks a plugin as optional.
--   opt?: boolean
--   // Specifies a git branch to use
--   branch?: string
--   // Specifies a git tag to use. Supports '*' for "latest tag"
--   tag?: string
--   // Specifies a git commit to use
--   commit?: string
--   // Skip updating this plugin in updates/syncs. Still cleans.
--   lock?: boolean
--   // Post-update/install hook. See "update/install hooks".
--   run?: string|function|table
--   // Specifies plugin dependencies. See "dependencies".
--   requires?: string|list
--   // Specifies Luarocks dependencies for the plugin
--   rocks?: string|list
--   // Specifies code to run after this plugin is loaded.
--   config?: string|function
--   // Specifies code to run before this plugin is loaded. The setup key implies opt = true.
--   setup?: string|function
--   /* Hint: The following keys all imply lazy-loading and imply opt = true */
--   // Specifies commands which load this plugin. Can be an autocmd pattern.
--   cmd?: string|list
--   // Specifies filetypes which load this plugin.
--   ft?: string|list
--   // Specifies maps which load this plugin. See "Keybindings".
--   keys?: string|list
--   // Specifies autocommand events which load this plugin.
--   event?: string|list
--   // Specifies functions which load this plugin.
--   fn?: string|list
--   // Specifies a conditional test to load this plugin
--   cond?: string|function|[strings|functions]
--   // Specifies Lua module names for require. 
--   // When requiring a string which starts with one of these module names,
--   // the plugin will be loaded.
--   module?: string|list
--   // Specifies Lua pattern of Lua module names for require. 
--   // When requiring a string which matches one of these patterns,
--   // the plugin will be loaded.
--   module_pattern?: string|list
-- }
--```
---@class Module
local Module
