return function()
  local notify = prequire("notify")
  if not notify then
    return
  end

  local config = prequire("plugins.notify.config") or {}

  vim.notify = notify
  vim.notify.setup(config)
end
