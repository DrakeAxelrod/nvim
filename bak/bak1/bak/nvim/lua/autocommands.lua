local t = require("tools")

t.augroup("UserMisc")(function(ac)
  -- highlight on yank
  ac("TextYankPost", {
    pattern = "*",
  }, function()
    vim.highlight.on_yank { higroup = "IncSearch", timeout = 200 }
  end)

  ac("BufEnter", {
      desc = "Wrap on enter for json files",
      pattern = { "*.json", "*.jsonc" }
    }, function()
      vim.wo.wrap = true
  end)

  ac("FileType", {
    desc = "Attach treesitter highlight for zsh files",
    pattern = "zsh"
  }, function()
      require("nvim-treesitter.highlight").attach(0, "bash")
  end)

  ac("FileType", {
    desc = "Disable miniindent for NvimTree, Telescope and startup",
    pattern = "NvimTree,Telescope,startup"
  }, function()
      vim.b.miniindentscope_disable = true
  end)

  ac("TermOpen", {
    pattern = "*"
  }, function()
    vim.cmd("setlocal statusline= listchars= nonumber norelativenumber")
    -- vim.cmd("startinsert")
  end)

  -- ac("TermClose", {
  --   pattern = "*"
  -- }, function()
  --   vim.cmd([[call feedkeys("\<cr>")"]])
  -- end)

  ac("VimResized", {
    desc = "Auto resize windows",
    pattern = "*"
  }, function()
      vim.cmd "wincmd ="
  end)

end)

-- vim.api.nvim_create_autocmd('BufWinEnter', {
--   pattern = '*',
--   callback = function()
--     if vim.bo.filetype == 'Neotree' then
--       require'bufferline.api'.set_offset(31, 'FileTree')
--     end
--   end
-- })

-- vim.api.nvim_create_autocmd('BufWinLeave', {
--   pattern = '*',
--   callback = function()
--     if vim.fn.expand('<afile>'):match('Neotree') then
--       require'bufferline.api'.set_offset(0)
--     end
--   end
-- })
