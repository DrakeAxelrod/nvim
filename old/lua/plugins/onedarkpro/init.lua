return function()
  local odp = prequire("onedarkpro")
  if not odp then
    return
  end

  local config = prequire("plugins.onedarkpro.config") or {}

  odp.setup(config)
  vim.cmd [[colorscheme onedark_vivid]]
end
