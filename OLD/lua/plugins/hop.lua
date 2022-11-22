return function()
  return {
    "phaazon/hop.nvim",
    branch = "v1",
    event = { "BufRead", "BufReadPre" },
    cmd = { "HopWord", "HopLine", "HopChar1" },
    config = function()
      require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
    end
  }
end
