local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local opts = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  log_level = 2,
  root_dir = function()
    return vim.fn.getcwd()
  end,
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        path = runtime_path,
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
      },
      diagnostics = {
        globals = {
          "vim",
          "use",
          "describe",
          "it",
          "assert",
          "before_each",
          "after_each",
        },
      },
      disable = {
        "lowercase-global",
        "undefined-global",
        "unused-local",
        "unused-function",
        "unused-vararg",
        "trailing-space",
      },
      telemetry = {
        enable = false,
      },
    },
  },
}
local ok, lua_dev = pcall(require, "lua-dev")
if not ok then
  return opts
else
  return opts
end
