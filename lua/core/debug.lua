P = vim.pretty_print

-- P(vim.opt.rtp._value)
-- local a = vim.regex("word")
-- print(a("hello word"))

function vim_rtp()
  return vim.opt.rtp._value
end

function inspect(name)
  vim.opt[name]:get()
end
