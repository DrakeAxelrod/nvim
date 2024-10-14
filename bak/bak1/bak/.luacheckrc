---@diagnostic disable
-- vim: ft=lua tw=80

stds.nvim = {
  globals = {
    "lvim",
    "reload",
    vim = {
      fields = { "g" }
    },
    "TERMINAL",
    "USER",
    "C",
    "Config",
    "WORKSPACE_PATH",
    "JAVA_LS_EXECUTABLE",
    "MUtils",
    "USER_CONFIG_PATH",
    os = { fields = { "capture" } },
  },
  read_globals = {
    "jit",
    "os",
    "vim",
  },
}
std = "lua51+nvim"

-- Don't report unused self arguments of methods.
self = false

-- Rerun tests only if their modification time changed.
cache = true

ignore = {
  "631", -- max_line_length
  "212/_.*", -- unused argument, for vars with "_" prefix
}
