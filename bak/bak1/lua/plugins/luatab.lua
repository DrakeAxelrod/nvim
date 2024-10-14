return {
  'alvarosevilla95/luatab.nvim',
  enabled = false,
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opt = {
    -- title = function() return '' end,
    -- modified = function() return '' end,
    -- windowCount = function() return '' end,
    -- devicon = function() return '' end,
    -- separator = function() return '' end,
  },
  config = function(_, opts)
    require('luatab').setup(opts or {})
  end,
}