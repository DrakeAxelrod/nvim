-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/draxel/.cache/xyz/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/draxel/.cache/xyz/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/draxel/.cache/xyz/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/draxel/.cache/xyz/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/draxel/.cache/xyz/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    after_files = { "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/Comment.nvim/after/plugin/Comment.lua" },
    config = { "\27LJ\2\n@\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\tlang\fComment\vconfig\bmod\tconf\0" },
    load_after = {
      ["nvim-ts-context-commentstring"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    after = { "friendly-snippets", "nvim-cmp" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["aerial.nvim"] = {
    after = { "nvim-lsp-installer" },
    config = { "\27LJ\2\n?\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\tlang\vaerial\vconfig\bmod\tconf\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after = { "nvim-lsp-installer" },
    after_files = { "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["cmp-nvim-lua"] = true,
      ["nvim-cmp"] = true,
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    after_files = { "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp-nvim-lsp-signature-help/after/plugin/cmp_nvim_lsp_signature_help.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    after = { "cmp-nvim-lsp" },
    after_files = { "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      cmp_luasnip = true,
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    after = { "cmp-nvim-lua" },
    after_files = { "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot-cmp"] = {
    after_files = { "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/copilot-cmp/after/plugin/copilot_cmp.lua" },
    load_after = {
      ["copilot.lua"] = true,
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    after = { "copilot-cmp" },
    config = { "\27LJ\2\n5\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\fcopilot\frequire-\1\0\4\0\3\0\0066\0\0\0009\0\1\0003\2\2\0)\3d\0B\0\3\1K\0\1\0\0\rdefer_fn\bvim\0" },
    load_after = {
      ["lualine.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["doom-one.nvim"] = {
    config = { "\27LJ\2\nC\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\veditor\rdoom-one\vconfig\bmod\tconf\0" },
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/doom-one.nvim",
    url = "https://github.com/NTBBloodbath/doom-one.nvim"
  },
  ["dressing.nvim"] = {
    config = { "\27LJ\2\nC\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\veditor\rdressing\vconfig\bmod\tconf\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/dressing.nvim",
    url = "https://github.com/stevearc/dressing.nvim"
  },
  fd = {
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/fd",
    url = "https://github.com/sharkdp/fd"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\n?\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\tlang\vfidget\vconfig\bmod\tconf\0" },
    load_after = {
      ["nvim-lsp-installer"] = true,
      ["nvim-lspconfig"] = true,
      ["plenary.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["filetype.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rfiletype\frequire\0" },
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["friendly-snippets"] = {
    after = { "nvim-cmp" },
    load_after = {
      LuaSnip = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fzy-lua-native"] = {
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/fzy-lua-native",
    url = "https://github.com/romgrk/fzy-lua-native"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n@\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\bgit\rgitsigns\vconfig\bmod\tconf\0" },
    load_after = {
      ["nvim-treesitter"] = true,
      ["plenary.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    commands = { "HopWord", "HopLine", "HopChar1" },
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["legendary.nvim"] = {
    config = { "\27LJ\2\nD\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\veditor\14legendary\vconfig\bmod\tconf\0" },
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/legendary.nvim",
    url = "https://github.com/mrjones2014/legendary.nvim"
  },
  ["lua-dev.nvim"] = {
    load_after = {
      ["nvim-lspconfig"] = true,
      ["plenary.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/lua-dev.nvim",
    url = "https://github.com/folke/lua-dev.nvim"
  },
  ["lualine.nvim"] = {
    after = { "copilot.lua" },
    config = { "\27LJ\2\nB\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\veditor\flualine\vconfig\bmod\tconf\0" },
    load_after = {},
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mini.nvim"] = {
    config = { "\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23modules.tools.mini\frequire\0" },
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/mini.nvim",
    url = "https://github.com/echasnovski/mini.nvim"
  },
  ["nui.nvim"] = {
    after = { "dressing.nvim" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nG\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\tlang\19nvim-autopairs\vconfig\bmod\tconf\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-nvim-lua", "cmp-nvim-lsp", "cmp-path", "cmp-nvim-lsp-signature-help", "copilot-cmp", "cmp-buffer", "cmp_luasnip" },
    config = { "\27LJ\2\nB\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\15completion\bcmp\vconfig\bmod\tconf\0" },
    load_after = {
      LuaSnip = true,
      ["friendly-snippets"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lsp-installer"] = {
    after = { "fidget.nvim" },
    config = { "\27LJ\2\nK\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\tlang\23nvim-lsp-installer\vconfig\bmod\tconf\0" },
    load_after = {
      ["aerial.nvim"] = true,
      ["cmp-nvim-lsp"] = true,
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    after = { "nvim-lsp-installer", "nvim-lsp-installer", "cmp-nvim-lsp", "aerial.nvim", "lua-dev.nvim", "fidget.nvim" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-nonicons"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-nonicons",
    url = "https://github.com/yamatsum/nvim-nonicons"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n@\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\ntools\vnotify\vconfig\bmod\tconf\0" },
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-treesitter-textobjects", "nvim-ts-autotag", "nvim-autopairs", "nvim-ts-rainbow", "gitsigns.nvim", "nvim-ts-context-commentstring" },
    config = { "\27LJ\2\nH\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\tlang\20nvim-treesitter\vconfig\bmod\tconf\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    after = { "Comment.nvim" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    after = { "telescope-github.nvim", "gitsigns.nvim", "lua-dev.nvim", "fidget.nvim" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ripgrep = {
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/ripgrep",
    url = "https://github.com/BurntSushi/ripgrep"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["telescope-command-palette.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/telescope-command-palette.nvim",
    url = "https://github.com/LinArcX/telescope-command-palette.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    after = { "telescope.nvim" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-github.nvim"] = {
    load_after = {
      ["plenary.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/telescope-github.nvim",
    url = "https://github.com/nvim-telescope/telescope-github.nvim"
  },
  ["telescope-media-files.nvim"] = {
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/telescope-media-files.nvim",
    url = "https://github.com/nvim-telescope/telescope-media-files.nvim"
  },
  ["telescope-smart-history.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/telescope-smart-history.nvim",
    url = "https://github.com/nvim-telescope/telescope-smart-history.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\nD\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\veditor\14telescope\vconfig\bmod\tconf\0" },
    load_after = {},
    loaded = true,
    needs_bufread = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-repeat"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-startuptime"] = {
    commands = { "StartupTime" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/vim-startuptime",
    url = "https://github.com/dstein64/vim-startuptime"
  },
  ["vim-wakatime"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  },
  ["wilder.nvim"] = {
    config = { "\27LJ\2\nE\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\15completion\vwilder\vconfig\bmod\tconf\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.config/xyz/runtime/site/pack/packer/opt/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^hop"] = "hop.nvim"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Config for: legendary.nvim
time([[Config for legendary.nvim]], true)
try_loadstring("\27LJ\2\nD\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\veditor\14legendary\vconfig\bmod\tconf\0", "config", "legendary.nvim")
time([[Config for legendary.nvim]], false)
-- Config for: mini.nvim
time([[Config for mini.nvim]], true)
try_loadstring("\27LJ\2\n2\0\0\3\0\2\0\0046\0\0\0'\2\1\0B\0\2\1K\0\1\0\23modules.tools.mini\frequire\0", "config", "mini.nvim")
time([[Config for mini.nvim]], false)
-- Config for: doom-one.nvim
time([[Config for doom-one.nvim]], true)
try_loadstring("\27LJ\2\nC\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\veditor\rdoom-one\vconfig\bmod\tconf\0", "config", "doom-one.nvim")
time([[Config for doom-one.nvim]], false)
-- Config for: nvim-notify
time([[Config for nvim-notify]], true)
try_loadstring("\27LJ\2\n@\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\ntools\vnotify\vconfig\bmod\tconf\0", "config", "nvim-notify")
time([[Config for nvim-notify]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rfiletype\frequire\0", "config", "filetype.nvim")
time([[Config for filetype.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-web-devicons ]]
vim.cmd [[ packadd nvim-nonicons ]]
vim.cmd [[ packadd nui.nvim ]]
vim.cmd [[ packadd dressing.nvim ]]

-- Config for: dressing.nvim
try_loadstring("\27LJ\2\nC\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\veditor\rdressing\vconfig\bmod\tconf\0", "config", "dressing.nvim")

vim.cmd [[ packadd ripgrep ]]
vim.cmd [[ packadd sqlite.lua ]]
vim.cmd [[ packadd telescope-smart-history.nvim ]]
vim.cmd [[ packadd telescope-command-palette.nvim ]]
vim.cmd [[ packadd fd ]]
vim.cmd [[ packadd fzy-lua-native ]]
vim.cmd [[ packadd telescope-fzf-native.nvim ]]
vim.cmd [[ packadd telescope.nvim ]]

-- Config for: telescope.nvim
try_loadstring("\27LJ\2\nD\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\veditor\14telescope\vconfig\bmod\tconf\0", "config", "telescope.nvim")

vim.cmd [[ packadd wilder.nvim ]]

-- Config for: wilder.nvim
try_loadstring("\27LJ\2\nE\0\0\4\0\5\0\a6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0B\0\3\1K\0\1\0\15completion\vwilder\vconfig\bmod\tconf\0", "config", "wilder.nvim")

time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopWord lua require("packer.load")({'hop.nvim'}, { cmd = "HopWord", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopLine lua require("packer.load")({'hop.nvim'}, { cmd = "HopLine", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopChar1 lua require("packer.load")({'hop.nvim'}, { cmd = "HopChar1", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file StartupTime lua require("packer.load")({'vim-startuptime'}, { cmd = "StartupTime", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'lua-dev.nvim'}, { ft = "lua" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-cmp', 'cmp-nvim-lua', 'hop.nvim', 'cmp-nvim-lsp', 'cmp-path', 'cmp-nvim-lsp-signature-help', 'copilot-cmp', 'cmp-buffer', 'cmp_luasnip', 'lua-dev.nvim', 'fidget.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'friendly-snippets', 'LuaSnip'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'lualine.nvim', 'lua-dev.nvim', 'fidget.nvim'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'friendly-snippets', 'nvim-cmp', 'copilot.lua', 'nvim-ts-autotag', 'nvim-autopairs', 'LuaSnip', 'cmp-nvim-lua', 'cmp-nvim-lsp', 'cmp-path', 'cmp-nvim-lsp-signature-help', 'copilot-cmp', 'cmp-buffer', 'cmp_luasnip'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-cmp', 'nvim-lsp-installer', 'nvim-treesitter-textobjects', 'nvim-lspconfig', 'nvim-ts-rainbow', 'cmp-nvim-lua', 'hop.nvim', 'plenary.nvim', 'vim-repeat', 'vim-wakatime', 'cmp-nvim-lsp', 'aerial.nvim', 'nvim-treesitter', 'cmp-path', 'cmp-nvim-lsp-signature-help', 'copilot-cmp', 'cmp-buffer', 'cmp_luasnip', 'nvim-ts-context-commentstring', 'lua-dev.nvim', 'fidget.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'Comment.nvim'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'nvim-lsp-installer', 'nvim-treesitter-textobjects', 'nvim-lspconfig', 'nvim-ts-rainbow', 'plenary.nvim', 'vim-repeat', 'vim-wakatime', 'aerial.nvim', 'nvim-treesitter', 'nvim-ts-context-commentstring'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
