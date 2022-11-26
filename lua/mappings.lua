local default_opts = {
  keymaps = {},
  commands = {},
  autocmds = {},
}

local keymaps = {
  -- map keys to a function
  { '<leader>h', function() print('hello world!') end, description = 'Say hello' },
}

local commands = {
  -- easily create user commands
  { ':SayHello', function() print('hello world!') end, description = 'Say hello as a command' },
}

local autocmds = {
  -- Create autocmds and augroups
  -- { 'BufWritePre', vim.lsp.buf.format, description = 'Format on save' },
  -- {
  --   name = 'MyAugroup',
  --   clear = true,
  --   -- autocmds here
  -- },
}

local functions = {
  -- Make arbitrary Lua functions that can be executed via the item finder
  -- { function() doSomeStuff() end, description = 'Do some stuff with a Lua function!' },
}

return {
  default_opts = default_opts,
  keymaps = keymaps,
  commands = commands,
  autocmds = autocmds,
  functions = functions,
}
