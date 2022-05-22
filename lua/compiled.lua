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
local package_path_str = "/home/draxel/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/draxel/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/draxel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/draxel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/draxel/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
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
    after_files = { "/home/draxel/.local/share/nvim/site/pack/packer/opt/Comment.nvim/after/plugin/Comment.lua" },
    config = { "\27LJ\2\nß\3\0\1\b\0\18\00006\1\0\0'\3\1\0B\1\2\2+\2\0\0009\3\2\0009\4\2\0019\4\3\4\5\3\4\0X\3\aÄ6\3\0\0'\5\4\0B\3\2\0029\3\5\3B\3\1\2\18\2\3\0X\3\16Ä9\3\6\0009\4\6\0019\4\a\4\4\3\4\0X\3\5Ä9\3\6\0009\4\6\0019\4\b\4\5\3\4\0X\3\6Ä6\3\0\0'\5\4\0B\3\2\0029\3\t\3B\3\1\2\18\2\3\0006\3\0\0'\5\n\0B\3\2\0029\3\v\0035\5\14\0009\6\2\0009\a\2\0019\a\f\a\5\6\a\0X\6\2Ä'\6\r\0X\a\1Ä'\6\15\0=\6\16\5=\2\17\5D\3\2\0\rlocation\bkey\16__multiline\1\0\0\14__default\tline\28calculate_commentstring&ts_context_commentstring.internal\30get_visual_start_location\6V\6v\fcmotion\24get_cursor_location#ts_context_commentstring.utils\nblock\nctype\18Comment.utils\frequireh\1\0\6\0\a\0\0146\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0\6Ä9\2\3\0015\4\5\0003\5\4\0=\5\6\4B\2\2\1K\0\1\0K\0\1\0\rpre_hook\1\0\0\0\nsetup\fComment\frequire\npcall\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  ["FixCursorHold.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/FixCursorHold.nvim",
    url = "https://github.com/antoinemadec/FixCursorHold.nvim"
  },
  LuaSnip = {
    after = { "nvim-cmp" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["SchemaStore.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/SchemaStore.nvim",
    url = "https://github.com/b0o/SchemaStore.nvim"
  },
  ["aerial.nvim"] = {
    commands = { "AerialToggle", "AerialOpen", "AerialInfo" },
    config = { "\27LJ\2\n\v\0\1\1\0\0\0\1L\0\2\0 \b\1\0\5\0\28\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0024\3\0\0=\3\b\0025\3\t\0004\4\0\0=\4\n\3=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0005\4\17\0=\4\18\0033\4\19\0=\4\20\3=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\0025\3\26\0=\3\27\2B\0\2\1K\0\1\0\rmarkdown\1\0\1\17update_delay\3¨\2\15treesitter\1\0\1\17update_delay\3¨\2\blsp\1\0\3\23update_when_errors\2\17update_delay\3¨\2\31diagnostics_trigger_update\2\nfloat\roverride\0\15min_height\1\3\0\0\3\b\4ö≥ÊÃ\tô≥Ê˝\3\1\0\3\vborder\frounded\rrelative\vcursor\15max_height\4Õô≥Ê\fÃô≥ˇ\3\vguides\1\0\4\14last_item\v‚îî‚îÄ\15whitespace\a  \15nested_top\t‚îÇ \rmid_item\v‚îú‚îÄ\14max_width\1\3\0\0\3(\4ö≥ÊÃ\tô≥¶˛\3\vignore\14filetypes\1\0\3\rbuftypes\fspecial\rwintypes\fspecial\21unlisted_buffers\2\nicons\16filter_kind\1\t\0\0\nClass\16Constructor\tEnum\rFunction\14Interface\vModule\vMethod\vStruct\rbackends\1\0\20\18update_events\28TextChanged,InsertLeave\16show_guides\1\18post_jump_cmd\15normal! zz\23link_folds_to_tree\1\23link_tree_to_folds\2\14min_width\3\n\14nerd_font\tauto\19open_automatic\1\19close_behavior\tauto\21default_bindings\2\22default_direction\17prefer_right\20close_on_select\1\22disable_max_lines\3êN\21disable_max_size\3Ä≠‚\4\26placement_editor_edge\1\19highlight_mode\16split_width\22highlight_closest\2\23highlight_on_hover\1\22highlight_on_jump\3¨\2\17manage_folds\1\1\4\0\0\15treesitter\blsp\rmarkdown\nsetup\vaerial\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/aerial.nvim",
    url = "https://github.com/stevearc/aerial.nvim"
  },
  ["alpha-nvim"] = {
    config = { "\27LJ\2\n„\1\0\0\v\1\15\0\0306\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2-\4\0\0009\4\4\0046\6\0\0009\6\1\0069\6\5\6'\b\6\0B\6\2\2'\a\a\0'\b\b\0'\t\t\0'\n\n\0B\4\6\2'\5\v\0)\6\0\0)\a\1\0B\2\5\0A\0\0\2'\1\f\0\18\3\1\0009\1\r\1\18\4\0\0B\1\3\2'\2\14\0L\1\2\0\2¿\14draxel.io\vformat\22loaded %s plugins\6*\nstart\vpacker\tpack\tsite\tdata\fstdpath\tjoin\rglobpath\blen\afn\bvimï\r\1\0\f\0002\2m6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0eÄ6\2\1\0'\4\3\0B\2\2\0029\2\4\0026\3\1\0'\5\5\0B\3\2\0029\3\6\0036\4\1\0'\6\a\0B\4\2\0029\5\b\0049\5\t\0055\6\v\0'\a\f\0\18\t\a\0009\a\r\a'\n\14\0B\a\3\0?\a\0\0=\6\n\0059\5\b\0049\5\15\0054\6\6\0009\a\16\4'\t\17\0009\n\18\0039\n\19\n9\n\20\n'\v\21\0&\n\v\n'\v\22\0B\a\4\2>\a\1\0069\a\16\4'\t\23\0009\n\24\0039\n\25\n'\v\26\0&\n\v\n'\v\27\0B\a\4\2>\a\2\0069\a\16\4'\t\28\0009\n\24\0039\n\29\n'\v\30\0&\n\v\n'\v\31\0B\a\4\2>\a\3\0069\a\16\4'\t \0009\n\24\0039\n!\n'\v\"\0&\n\v\n'\v#\0B\a\4\2>\a\4\0069\a\16\4'\t$\0009\n%\0039\n&\n'\v'\0&\n\v\n'\v(\0B\a\4\0?\a\1\0=\6\n\0053\5)\0009\6\b\0049\6*\6\18\a\5\0B\a\1\2=\a\n\0069\6\b\0049\6*\0069\6+\6'\a-\0=\a,\0069\6\b\0049\6\t\0069\6+\6'\a.\0=\a,\0069\6\b\0049\6\15\0069\6+\6'\a/\0=\a,\0069\6+\0049\6+\6+\a\2\0=\a0\0069\0061\0019\b+\4B\6\2\0012\0\0ÄK\0\1\0K\0\1\0\nsetup\14noautocmd\fKeyword\fInclude\tType\ahl\topts\vfooter\0\f:qa<CR>\n Quit\nerror\16diagnostics\6q$:e ~/.config/nvim/init.lua <CR>\f Config\tgear\6c\30:Telescope live_grep <CR>\15 Find text\tlist\6t\28:Telescope frecency<CR>\18 Recent files\fhistory\aui\6r :ene <BAR> startinsert <CR>\14 New file\fdefault\tfile\14documents\6e\vbutton\fbuttons\a]]\vformatI  \\(_)_%s      /  |  \\                           *   *  .   .       \1\f\0\0I                                        __                          I           ___     ___    ___   __  __ /\\_\\    ___ ___              I          / _ `\\  / __`\\ / __`\\/\\ \\/\\ \\\\/\\ \\  / __` __`\\            I         /\\ \\/\\ \\/\\  __//\\ \\_\\ \\ \\ \\_/ |\\ \\ \\/\\ \\/\\ \\/\\ \\           I         \\ \\_\\ \\_\\ \\____\\ \\____/\\ \\___/  \\ \\_\\ \\_\\ \\_\\ \\_\\          I          \\/_/\\/_/\\/____/\\/___/  \\/__/    \\/_/\\/_/\\/_/\\/_/          I                                                                    I      .-.      _______                           .  '  *   .  . '   I     {}``; |==|_______D                                . *  -+-  .  I     / ('        /|\\                             . '   * .    '  *  I (  /  |        / | \\                                * .  ' .  .-+- \bval\vheader\fsection\27alpha.themes.dashboard\nicons\ntheme\afs\blib\nalpha\frequire\npcall\25ÄÄ¿ô\4\vÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/alpha-nvim",
    url = "https://github.com/goolord/alpha-nvim"
  },
  ["cheatsheet.nvim"] = {
    config = { "\27LJ\2\nÜ\3\0\0\a\0\15\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\6\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\a\0036\4\0\0'\6\4\0B\4\2\0029\4\b\4=\4\t\0036\4\0\0'\6\4\0B\4\2\0029\4\n\4=\4\v\0036\4\0\0'\6\4\0B\4\2\0029\4\f\4=\4\r\3=\3\14\2B\0\2\1K\0\1\0\23telescope_mappings\n<C-E>\25edit_user_cheatsheet\n<C-Y>\21copy_cheat_value\v<A-CR>\22select_or_execute\t<CR>\1\0\0\31select_or_fill_commandline!cheatsheet.telescope.actions\1\0\3#include_only_installed_plugins\2\24bundled_cheatsheets\2\31bundled_plugin_cheatsheets\2\nsetup\15cheatsheet\frequire\0" },
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/cheatsheet.nvim",
    url = "https://github.com/sudormrfbin/cheatsheet.nvim"
  },
  ["clangd_extensions.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/clangd_extensions.nvim",
    url = "https://github.com/p00f/clangd_extensions.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/draxel/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-nvim-lsp"] = {
    after_files = { "/home/draxel/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp/after/plugin/cmp_nvim_lsp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    after_files = { "/home/draxel/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help/after/plugin/cmp_nvim_lsp_signature_help.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/draxel/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-path"] = {
    after_files = { "/home/draxel/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  cmp_luasnip = {
    after_files = { "/home/draxel/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["copilot-cmp"] = {
    after_files = { "/home/draxel/.local/share/nvim/site/pack/packer/opt/copilot-cmp/after/plugin/copilot_cmp.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/copilot-cmp",
    url = "https://github.com/zbirenbaum/copilot-cmp"
  },
  ["copilot.lua"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/copilot.lua",
    url = "https://github.com/zbirenbaum/copilot.lua"
  },
  ["filetype.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rfiletype\frequire\0" },
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  ["friendly-snippets"] = {
    after = { "nvim-cmp" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  ["fzy-lua-native"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/fzy-lua-native",
    url = "https://github.com/romgrk/fzy-lua-native"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n\a\0\0\6\0\27\0\"6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\0029\3\26\1\18\5\2\0B\3\2\1K\0\1\0\nsetup\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3Ë\a\19preview_config\1\0\5\bcol\3\1\rrelative\vcursor\brow\3\0\nstyle\fminimal\vborder\frounded&current_line_blame_formatter_opts\1\0\1\18relative_time\1\28current_line_blame_opts\1\0\4\14virt_text\2\18virt_text_pos\beol\ndelay\3Ë\a\22ignore_whitespace\1\fkeymaps\1\0\2\fnoremap\2\vbuffer\2\nsigns\1\0\t\vlinehl\1\20update_debounce\3»\1\18sign_priority\3\6\20max_file_length\3¿∏\2\nnumhl\1\14word_diff\1\23current_line_blame\1\15signcolumn\2\24attach_to_untracked\2\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ttext\6_\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\b‚Äæ\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\6-\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ttext\6~\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ttext\6+\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\rgitsigns\frequire\npcall\0" },
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hop.nvim"] = {
    commands = { "HopWord", "HopLine", "HopChar1" },
    config = { "\27LJ\2\nU\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tkeys\28etovxqpdygfblzhckisuran\nsetup\bhop\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/hop.nvim",
    url = "https://github.com/phaazon/hop.nvim"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["lush.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/lush.nvim",
    url = "https://github.com/rktjmp/lush.nvim"
  },
  ["neo-tree.nvim"] = {
    commands = { "Neotree" },
    config = { "\27LJ\2\n[\0\1\3\0\a\0\n6\1\0\0009\1\1\0019\1\2\1\a\1\3\0X\1\4Ä6\1\0\0009\1\4\1'\2\6\0=\2\5\1K\0\1\0\tauto\15signcolumn\awo\rneo-tree\rfiletype\abo\bvimì\14\1\0\a\0/\00096\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\6\0005\3\b\0005\4\a\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\0035\4\14\0=\4\15\0035\4\16\0=\4\17\0035\4\19\0005\5\18\0=\5\20\4=\4\21\3=\3\22\0025\3\23\0005\4\24\0005\5\25\0=\5\26\0045\5\27\0005\6\28\0=\6\29\5=\5\30\4=\4\31\3=\3 \0025\3$\0005\4!\0005\5\"\0=\5#\4=\4%\0035\4'\0005\5&\0=\5\31\4=\4 \3=\3(\0025\3)\0005\4*\0=\4\31\3=\3\21\0024\3\3\0005\4+\0003\5,\0=\5-\4>\4\1\3=\3.\2B\0\2\1K\0\1\0\19event_handlers\fhandler\0\1\0\1\nevent\21vim_buffer_enter\1\0\a\agp\rgit_push\agr\20git_revert_file\aga\17git_add_file\agg\24git_commit_and_push\agu\21git_unstage_file\6A\16git_add_all\agc\15git_commit\1\0\1\rposition\nfloat\15filesystem\1\0\0\1\0\b\t<bs>\16navigate_up\6R\rset_root\a[g\22prev_git_modified\6f\21filter_on_submit\n<c-x>\17clear_filter\6/\17fuzzy_finder\a]g\22next_git_modified\6H\18toggle_hidden\19filtered_items\1\0\3\27use_libuv_file_watcher\2\26hijack_netrw_behavior\17open_current\24follow_current_file\2\17hide_by_name\1\5\0\0\14.DS_Store\14thumbs.db\17node_modules\16__pycache__\1\0\3\fvisible\1\20hide_gitignored\1\18hide_dotfiles\1\vwindow\rmappings\6a\vconfig\1\0\1\14show_path\tnone\1\2\0\0\badd\f<space>\1\2\1\0\16toggle_node\vnowait\1\1\0\22\6S\15open_split\t<cr>\topen\18<2-LeftMouse>\topen\6p\25paste_from_clipboard\6t\16open_tabnew\6.\18toggle_hidden\6!\rset_root\6o\topen\6R\frefresh\6s\16open_vsplit\6q\17close_window\6m\tmove\6?\14show_help\6c\tcopy\6x\21cut_to_clipboard\6y\22copy_to_clipboard\6r\vrename\6d\vdelete\6A\18add_directory\6H\5\6w\28open_with_window_picker\6C\15close_node\1\0\2\nwidth\3\25\rposition\nright\30default_component_configs\15git_status\fsymbols\1\0\0\1\0\t\vstaged\b‚úì\rmodified\bÔëÑ\runstaged\bÔò∞\fignored\6.\14untracked\b‚òÖ\frenamed\b‚ûú\fdeleted\bÔëò\nadded\bÔÜñ\rconflict\bÓúß\tname\1\0\3\14highlight\20NeoTreeFileName\26use_git_status_colors\2\19trailing_slash\2\rmodified\1\0\2\vsymbol\b[+]\14highlight\20NeoTreeModified\ticon\1\0\5\fdefault\bÓòí\17folder_empty\bÔêî\16folder_open\bÓóæ\18folder_closed\bÓóø\14highlight\20NeoTreeFileIcon\vindent\1\0\5\fpadding\3\0\16indent_size\3\2\19with_expanders\1\14highlight\24NeoTreeIndentMarker\17with_markers\2\14container\1\0\0\1\0\1\26enable_character_fade\2\1\0\2\23enable_diagnostics\1\23popup_border_style\frounded\nsetup\rneo-tree\frequire$neo_tree_remove_legacy_commands\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neogit = {
    config = { "\27LJ\2\n˛\4\0\0\5\0$\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\3=\3\r\0025\3\14\0=\3\15\0025\3\17\0005\4\16\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\3=\3\31\0025\3!\0005\4 \0=\4\"\3=\3#\2B\0\2\1K\0\1\0\rmappings\vstatus\1\0\0\1\0\1\6B\16BranchPopup\rsections\vrecent\1\0\1\vfolded\2\runmerged\1\0\1\vfolded\1\runpulled\1\0\1\vfolded\2\fstashes\1\0\1\vfolded\2\vstaged\1\0\1\vfolded\1\runstaged\1\0\1\vfolded\1\14untracked\1\0\0\1\0\1\vfolded\1\17integrations\1\0\1\rdiffview\1\nsigns\thunk\1\3\0\0\5\5\titem\1\3\0\0\6>\6v\fsection\1\0\0\1\3\0\0\6>\6v\17commit_popup\1\0\1\tkind\nsplit\1\0\b\17auto_refresh\2\"disable_builtin_notifications\1\26use_magit_keybindings\1\tkind\btab\18disable_signs\1\17disable_hint\1!disable_context_highlighting\1 disable_commit_confirmation\1\nsetup\vneogit\frequire\0" },
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/neogit",
    url = "https://github.com/TimUntersberger/neogit"
  },
  ["nlsp-settings.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/nlsp-settings.nvim",
    url = "https://github.com/tamago324/nlsp-settings.nvim"
  },
  ["nui.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\nT\0\1\6\0\5\0\f6\1\0\0006\3\1\0009\3\2\3\18\5\0\0B\3\2\0A\1\0\0019\1\3\0\a\1\4\0X\1\2Ä+\1\1\0L\1\2\0K\0\1\0\naa $$\tline\finspect\bvim\nprintÍ\b\1\0\r\0/\2x6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\3\4\0005\5\5\0005\6\a\0005\a\6\0=\a\b\0065\a\t\0=\a\n\6=\6\v\0055\6\f\0=\6\r\0055\6\14\0005\a\15\0=\a\16\0066\a\17\0009\a\18\a'\t\19\0'\n\20\0'\v\21\0B\a\4\2=\a\22\6=\6\23\5B\3\2\0019\3\24\0\18\5\1\0'\a\25\0'\b\25\0'\t\26\0B\5\4\0A\3\0\0019\3\27\0004\5\3\0\18\6\1\0'\b\28\0'\t\28\0005\n\29\0B\6\4\2\18\b\6\0009\6\30\0069\t\31\2'\v \0B\t\2\0A\6\1\2\18\b\6\0009\6\30\0069\t!\2'\v\"\0)\f\3\0B\t\3\0A\6\1\2\18\b\6\0009\6#\0069\t$\2B\t\1\0A\6\1\2\18\b\6\0009\6%\0069\t\31\2'\v&\0B\t\2\0A\6\1\2\18\b\6\0009\6'\0069\t$\2B\t\1\0A\6\1\0?\6\0\0B\3\2\0019\3\27\0004\5\3\0\18\6\1\0'\b\25\0'\t\25\0'\n\26\0B\6\4\2\18\b\6\0009\6\30\0063\t(\0B\6\3\0?\6\0\0B\3\2\0016\3\0\0'\5)\0B\3\2\0029\4\27\0004\6\3\0\18\a\1\0'\t*\0'\n*\0'\v\b\0B\a\4\2\18\t\a\0009\a\30\a9\n+\0035\f,\0B\n\2\0A\a\1\2>\a\1\6\18\a\1\0'\t\28\0'\n\28\0'\v\b\0B\a\4\2\18\t\a\0009\a\30\a9\n-\0035\f.\0B\n\2\0A\a\1\0?\a\1\0B\4\2\1K\0\1\0\1\2\0\0\rfunction\19is_not_ts_node\1\3\0\0\vstring\fcomment\15is_ts_node\6%\28nvim-autopairs.ts-conds\0\fwith_cr\axx\rwith_del\tnone\14with_move\bxxx\27not_before_regex_check\a%%\26not_after_regex_check\14with_pair\1\3\0\0\btex\nlatex\6$\14add_rules\btex\a$$\radd_rule\14fast_wrap\fpattern\5\b%s+\25 [%'%\"%)%>%]%)%}%,] \tgsub\vstring\nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\a\fend_key\6$\16check_comma\2\tkeys\31qwertyuiopzxcvbnmasdfghjkl\19highlight_grey\vLineNr\14highlight\rPmenuSel\bmap\n<M-e>\voffset\3\0\21disable_filetype\1\3\0\0\20TelescopePrompt\18spectre_panel\14ts_config\15javascript\1\3\0\0\vstring\20template_string\blua\1\0\1\tjava\1\1\3\0\0\vstring\vsource\1\0\1\rcheck_ts\2\nsetup\25nvim-autopairs.conds\24nvim-autopairs.rule\19nvim-autopairs\frequire\3ÄÄ¿ô\4\5ÄÄ¿ô\4\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    after = { "cmp-nvim-lsp-signature-help", "copilot-cmp", "cmp-nvim-lua", "cmp-path", "cmp_luasnip", "cmp-buffer", "cmp-nvim-lsp" },
    config = { "\27LJ\2\nó\1\0\0\6\0\b\2\0276\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\2\23\0\0\0\b\0\1\0X\1\17Ä6\1\0\0009\1\1\0019\1\4\1'\3\3\0B\1\2\2\18\3\1\0009\1\5\1\18\4\0\0\18\5\0\0B\1\4\2\18\3\1\0009\1\6\1'\4\a\0B\1\3\2X\2\3Ä+\1\1\0X\2\1Ä+\1\2\0L\1\2\0\a%s\nmatch\bsub\fgetline\6.\bcol\afn\bvim\2\0◊\1\0\2\a\1\a\0\14'\2\1\0\18\4\2\0009\2\2\2-\5\0\0009\6\0\0018\5\6\5B\2\3\2=\2\0\0015\2\4\0009\3\5\0009\3\6\0038\2\3\2=\2\3\1L\1\2\0\5¿\tname\vsource\1\0\6\fluasnip\14(snippet)\tpath\v(path)\fcopilot\14(copilot)\28nvim_lsp_signature_help\16(signature)\rnvim_lsp\n(lsp)\vbuffer\r(buffer)\tmenu\vformat\a%s\tkind-\0\1\4\1\2\0\5-\1\0\0009\1\0\0019\3\1\0B\1\2\1K\0\1\0\3¿\tbody\15lsp_expandÓ\1\0\1\3\3\6\0%-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\27Ä-\1\1\0009\1\2\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\3\1B\1\1\1X\1\18Ä-\1\1\0009\1\4\1B\1\1\2\15\0\1\0X\2\4Ä-\1\1\0009\1\5\1B\1\1\1X\1\tÄ-\1\2\0B\1\1\2\15\0\1\0X\2\3Ä\18\1\0\0B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\3¿\4¿\19expand_or_jump\23expand_or_jumpable\vexpand\15expandable\21select_next_item\fvisibleé\1\0\1\4\2\4\0\23-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\rÄ-\1\1\0009\1\2\1)\3ˇˇB\1\2\2\15\0\1\0X\2\5Ä-\1\1\0009\1\3\1)\3ˇˇB\1\2\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\3¿\tjump\rjumpable\21select_prev_item\fvisible·\n\1\0\14\0F\0Ä\0016\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0wÄ6\2\0\0006\4\1\0'\5\3\0B\2\3\3\14\0\2\0X\4\1Ä2\0qÄ6\4\1\0'\6\4\0B\4\2\0029\4\5\4B\4\1\0013\4\6\0006\5\1\0'\a\a\0B\5\2\0029\5\b\0059\5\t\0059\6\n\0015\b\r\0009\t\v\0019\t\f\t=\t\14\b5\t\16\0005\n\15\0=\n\17\t3\n\18\0=\n\19\t=\t\20\b4\t\a\0005\n\21\0>\n\1\t5\n\22\0>\n\2\t5\n\23\0>\n\3\t5\n\24\0>\n\4\t5\n\25\0>\n\5\t5\n\26\0>\n\6\t=\t\27\b5\t\29\0003\n\28\0=\n\30\t=\t\31\b5\t \0=\t!\b5\t$\0009\n\"\0019\n#\n=\n%\t=\t&\b5\t'\0=\t(\b5\t)\0=\t*\b5\t.\0009\n+\0019\n,\n9\n-\nB\n\1\2=\n(\t9\n+\0019\n,\n9\n-\nB\n\1\2=\n/\t=\t,\b5\t2\0009\n0\0019\n1\nB\n\1\2=\n3\t9\n0\0019\n4\nB\n\1\2=\n5\t9\n0\0019\n6\n)\f¸ˇB\n\2\2=\n7\t9\n0\0019\n6\n)\f\4\0B\n\2\2=\n8\t9\n0\0019\n9\nB\n\1\2=\n:\t9\n0\0019\n;\nB\n\1\2=\n<\t9\n0\0019\n=\n5\f>\0009\r\"\0019\r#\r=\r%\fB\n\2\2=\n?\t9\n0\0013\f@\0005\rA\0B\n\3\2=\nB\t9\n0\0013\fC\0005\rD\0B\n\3\2=\nE\t=\t0\bB\6\2\0012\0\0ÄK\0\1\0K\0\1\0K\0\1\0\f<S-Tab>\1\3\0\0\6i\6s\0\n<Tab>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nclose\14<C-Space>\rcomplete\n<C-f>\n<C-d>\16scroll_docs\n<C-n>\21select_next_item\n<C-p>\1\0\0\21select_prev_item\fmapping\18documentation\1\0\0\rbordered\vwindow\vconfig\17experimental\1\0\2\16native_menu\1\15ghost_text\2\15completion\1\0\3\16completeopt\26menu,menuone,noinsert\20keyword_pattern/\\%(-\\?\\d\\+\\%(\\.\\d\\+\\)\\?\\|\\h\\w*\\%(-\\w*\\)*\\)\19keyword_length\3\1\17confirm_opts\rbehavior\1\0\1\vselect\1\fReplace\20ConfirmBehavior\15duplicates\1\0\4\fluasnip\3\1\tpath\3\1\vbuffer\3\1\rnvim_lsp\3\1\fsnippet\vexpand\1\0\0\0\fsources\1\0\2\rpriority\3»\1\tname\tpath\1\0\2\rpriority\3Ù\3\tname\vbuffer\1\0\2\rpriority\3Ó\5\tname\fluasnip\1\0\2\rpriority\3Ñ\a\tname\28nvim_lsp_signature_help\1\0\2\rpriority\3Ñ\a\tname\rnvim_lsp\1\0\2\rpriority\3Ë\a\tname\fcopilot\15formatting\vformat\0\vfields\1\0\0\1\4\0\0\tkind\tabbr\tmenu\14preselect\1\0\0\tNone\18PreselectMode\nsetup\tkind\nicons\ntheme\0\14lazy_load luasnip.loaders.from_vscode\fluasnip\bcmp\frequire\npcall\0" },
    load_after = {
      LuaSnip = true,
      ["friendly-snippets"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-lsp-installer"] = {
    commands = { "LspInfo", "LspInstall", "LspUninstall", "LspUpdate", "LspEnable", "LspDisable" },
    config = { "\27LJ\2\n‹\a\0\0\23\0)\0`6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\3\0006\3\0\0'\4\4\0B\1\3\3\14\0\1\0X\3\1ÄK\0\1\0006\3\3\0006\5\0\0'\6\5\0B\3\3\3\14\0\3\0X\5\1ÄK\0\1\0005\5\6\0009\6\a\0025\b\b\0005\t\n\0005\n\t\0=\n\v\t5\n\f\0=\n\r\t=\t\14\b6\t\15\0009\t\16\t9\t\17\t9\t\18\t=\t\19\bB\6\2\0016\6\0\0'\b\20\0B\6\2\0029\6\a\6B\6\1\0016\6\21\0\18\b\5\0B\6\2\4H\t.Ä5\v\23\0006\f\0\0'\14\20\0B\f\2\0029\f\22\f=\f\24\v6\f\0\0'\14\20\0B\f\2\0029\f\25\fB\f\1\2=\f\26\v9\f\27\0009\14\28\0006\16\15\0009\16\29\0169\16\30\16'\18\31\0B\16\2\2'\17 \0'\18!\0'\19\"\0'\20#\0\18\21\n\0'\22$\0&\21\22\21B\14\a\0A\f\0\2\15\0\f\0X\r\fÄ6\f\0\0'\14%\0\18\15\n\0&\14\15\14B\f\2\0026\r\15\0009\r&\r'\15'\0\18\16\f\0\18\17\v\0B\r\4\2\18\v\r\0008\f\n\0049\f\a\f\18\14\v\0B\f\2\1F\t\3\3R\t–\1276\6\0\0'\b(\0B\6\2\0029\6\a\6B\6\1\1K\0\1\0\25plugins.lang.null-ls\nforce\20tbl_deep_extend\28plugins.lang.providers.\t.lua\14providers\tlang\fplugins\blua\vconfig\fstdpath\afn\tjoin\vexists\17capabilities\24common_capabilities\14on_attach\1\0\0\21common_on_attach\npairs\26plugins.lang.handlers\14log_level\tINFO\vlevels\blog\bvim\aui\fkeymaps\1\0\a\23update_all_servers\6U\18update_server\6u\21uninstall_server\6X\27check_outdated_servers\6C\25toggle_server_expand\t<CR>\19install_server\6i\25check_server_version\6c\nicons\1\0\0\1\0\3\19server_pending\b‚ûú\23server_uninstalled\b‚úó\21server_installed\b‚úì\1\0\1\27automatic_installation\2\nsetup\1\4\0\0\16sumneko_lua\vbashls\tccls\14lspconfig\23nvim-lsp-installer\npcall\afs\blib\frequire\0" },
    load_after = {
      ["nvim-lspconfig"] = true
    },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lspconfig"] = {
    after = { "nvim-lsp-installer" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-notify"] = {
    config = { "\27LJ\2\n‡\1\0\0\4\0\a\0\r6\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0006\0\0\0009\0\1\0009\0\3\0005\2\4\0005\3\5\0=\3\6\2B\0\2\1K\0\1\0\nicons\1\0\5\nTRACE\b‚úé\nDEBUG\bÔÜà\tINFO\bÔ†µ\nERROR\bÔôô\tWARN\bÔî©\1\0\5\vrender\fdefault\22background_colour\vNormal\18minimum_width\0032\ftimeout\3à'\vstages\nslide\nsetup\frequire\vnotify\bvim\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-treesitter"] = {
    after = { "nvim-ts-autotag", "nvim-ts-context-commentstring", "nvim-autopairs", "nvim-ts-rainbow" },
    commands = { "TSInstall", "TSInstallInfo", "TSInstallSync", "TSUninstall", "TSUpdate", "TSUpdateSync", "TSDisableAll", "TSEnableAll" },
    config = { "\27LJ\2\nÇ\v\0\0\t\0;\0[6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\3\0006\3\0\0'\4\4\0B\1\3\3\14\0\1\0X\3\1ÄK\0\1\0009\3\5\0025\5\a\0005\6\6\0=\6\b\0055\6\t\0=\6\n\0055\6\v\0005\a\f\0=\a\r\6=\6\14\0055\6\15\0004\a\0\0=\a\16\6=\6\17\0055\6\19\0005\a\18\0=\a\20\0065\a\21\0=\a\r\6=\6\22\0055\6\23\0004\a\0\0=\a\r\0065\a\24\0=\a\25\6=\6\26\0055\6\27\0=\6\28\0055\6\29\0005\a\30\0=\a\r\6=\6\31\0055\6 \0004\a\a\0009\b!\0>\b\1\a9\b\"\0>\b\2\a9\b#\0>\b\3\a9\b$\0>\b\4\a9\b%\0>\b\5\a9\b&\0>\b\6\a=\a\2\0065\a'\0=\a\r\6=\6(\0055\6)\0005\a*\0005\b+\0=\b,\a=\a-\6=\6.\0055\0060\0005\a/\0=\a1\0065\a2\0=\a3\6=\0064\0055\0065\0005\a6\0=\a\16\6=\0067\5B\3\2\0016\3\3\0006\5\0\0'\0068\0B\3\3\3\14\0\3\0X\5\1ÄK\0\1\0009\5\5\0045\a9\0004\b\0\0=\b:\aB\5\2\1K\0\1\0\rpatterns\1\0\3\rthrottle\2\venable\1\14max_lines\3\0\23treesitter-context\17textsubjects\1\0\2\6.\23textsubjects-smart\6;\21textsubjects-big\1\0\1\venable\1\16textobjects\vselect\1\0\1\venable\1\tswap\1\0\0\1\0\1\venable\1\26context_commentstring\vconfig\20javascriptreact\1\0\1\18style_element\r{/*%s*/}\1\0\a\vsvelte\16<!-- %s -->\tjson\5\bvue\16<!-- %s -->\thtml\16<!-- %s -->\15typescript\n// %s\bcss\r/* %s */\tscss\r/* %s */\1\0\1\venable\2\frainbow\1\2\0\0\thtml\ngreen\tblue\tcyan\fmagenta\vyellow\nwhite\1\0\2\18extended_mode\1\venable\2\fautotag\1\2\0\0\bxml\1\0\1\venable\2\14autopairs\1\0\1\venable\2\15playground\16keybindings\1\0\n\21toggle_hl_groups\6i\30toggle_injected_languages\6t\27toggle_anonymous_nodes\6a\vupdate\6R\28toggle_language_display\6I\19focus_language\6f\21unfocus_language\6F\14show_help\6?\14goto_node\t<cr>\24toggle_query_editor\6o\1\0\3\venable\2\15updatetime\3\25\20persist_queries\1\vindent\1\3\0\0\bcss\tyaml\venable\1\0\0\1\2\0\0\20javascriptreact\26incremental_selection\fkeymaps\1\0\1\venable\2\14highlight\fdisable\1\3\0\0\bcss\nlatex\1\0\2&additional_vim_regex_highlighting\2\venable\2\19ignore_install\1\2\0\0\5\21ensure_installed\1\0\1\17sync_install\1\1\2\0\0\blua\nsetup\28nvim-treesitter.configs\npcall\vcolors\ntheme\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-ts-rainbow"] = {
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow",
    url = "https://github.com/p00f/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["smart-splits.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/smart-splits.nvim",
    url = "https://github.com/mrjones2014/smart-splits.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["telescope-file-browser.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\17file_browser\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope-github.nvim"] = {
    config = { "\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\agh\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/telescope-github.nvim",
    url = "https://github.com/nvim-telescope/telescope-github.nvim"
  },
  ["telescope-packer.nvim"] = {
    config = { "\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\vpacker\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/telescope-packer.nvim",
    url = "https://github.com/nvim-telescope/telescope-packer.nvim"
  },
  ["telescope-smart-history.nvim"] = {
    config = { "\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\18smart_history\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/telescope-smart-history.nvim",
    url = "https://github.com/nvim-telescope/telescope-smart-history.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    config = { "\27LJ\2\nN\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\14ui-select\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-smart-history.nvim", "telescope-github.nvim", "telescope-frecency.nvim", "telescope-packer.nvim", "telescope-file-browser.nvim", "telescope-ui-select.nvim", "telescope-fzf-native.nvim" },
    config = { "\27LJ\2\nZ\0\3\6\0\2\2\r)\3»\0\1\3\1\0X\3\5Ä6\3\0\0009\3\1\3\24\5\0\1D\3\2\0X\3\4Ä6\3\0\0009\3\1\3\24\5\1\1D\3\2\0K\0\1\0\nfloor\tmathµÊÃô\19ô≥Ê˛\3ÁÃô≥\6≥Êåˇ\3Ω\19\1\0\19\0a\1´\0016\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0£Ä6\2\0\0006\4\1\0'\5\3\0B\2\3\3\15\0\2\0X\4\3Ä9\4\4\1'\6\3\0B\4\2\0016\4\0\0006\6\1\0'\a\5\0B\4\3\3\15\0\4\0X\6\3Ä9\6\4\1'\b\5\0B\6\2\0016\6\1\0'\b\6\0B\6\2\0029\6\a\0069\6\b\0066\a\1\0'\t\t\0B\a\2\0029\b\n\0015\n2\0005\v\v\0005\f\f\0=\f\r\v5\f\14\0=\f\15\v5\f\16\0=\f\17\v6\f\1\0'\14\18\0B\f\2\0029\f\19\f9\f\20\f=\f\21\v6\f\1\0'\14\18\0B\f\2\0029\f\22\f9\f\20\f=\f\23\v6\f\1\0'\14\18\0B\f\2\0029\f\24\f9\f\20\f=\f\25\v6\f\1\0'\14\18\0B\f\2\0029\f\26\f=\f\26\v5\f\27\0=\f\28\v5\f \0005\r\29\0003\14\30\0=\14\31\r=\r!\f5\r\"\0=\r#\f5\r%\0005\14$\0=\14!\r=\r&\f=\f'\v5\f(\0=\f)\v6\f\1\0'\14*\0B\f\2\0029\f+\f=\f,\v5\f-\0=\f.\v6\f\1\0'\14*\0B\f\2\0029\f/\f=\f0\v9\f\2\aB\f\1\2=\f1\v=\v3\n5\v5\0005\f4\0=\f6\v5\f7\0005\r8\0=\r9\f=\f:\v5\f;\0=\f<\v5\f@\0005\r>\0005\14=\0=\14?\r=\r1\f=\fA\v=\vB\n5\vD\0005\fC\0=\fE\v5\fF\0=\fG\v4\f\3\0006\r\1\0'\15H\0B\r\2\0029\rI\r4\15\0\0B\r\2\0?\r\0\0=\fJ\v5\fK\0005\rL\0=\rM\f5\rR\0\18\14\6\0006\16N\0009\16O\16'\18P\0B\16\2\2'\17Q\0B\14\3\2=\14S\r\18\14\6\0006\16N\0009\16O\16'\18P\0B\16\2\2'\17T\0'\18U\0B\14\4\2=\14V\r\18\14\6\0006\16N\0009\16O\16'\18P\0B\16\2\2'\17W\0B\14\3\2=\14X\r=\rY\f=\fZ\v5\f[\0009\r\\\aB\r\1\2=\r1\f=\f6\v5\f^\0005\r]\0=\r'\f=\f_\v=\v`\nB\b\2\1K\0\1\0K\0\1\0\15extensions\vpacker\1\0\0\1\0\1\vheight\4\0ÄÄÄˇ\3\25telescope_fb_browser\1\0\2\fgrouped\2\16cwd_to_path\2\rfrecency\15workspaces\fproject\14Documents\tdata\nshare\v.local\vconfig\1\0\0\f.config\tHOME\vgetenv\aos\20ignore_patterns\1\3\0\0\f*.git/*\f*/tmp/*\1\0\3\21disable_devicons\1\16show_scores\1\19show_unindexed\2\14ui-select\17get_dropdown\21telescope.themes\15fzy_native\1\0\2\28override_generic_sorter\2\25override_file_sorter\2\bfzf\1\0\0\1\0\4\28override_generic_sorter\1\25override_file_sorter\2\nfuzzy\2\14case_mode\15smart_case\fpickers\afd\1\0\0\6n\1\0\0\1\0\1\akj\nclose\14live_grep\1\0\2\19only_sort_text\2\vhidden\2\15find_files\17find_command\1\5\0\0\afd\16--type=file\r--hidden\17--smart-case\1\0\1\vhidden\2\17file_browser\1\0\0\1\0\2\vhidden\2\16cwd_to_path\2\rdefaults\1\0\0\rmappings\19generic_sorter\29get_generic_fuzzy_sorter\25file_ignore_patterns\1\5\0\0\17node_modules\t.git\vtarget\vvendor\16file_sorter\19get_fuzzy_file\22telescope.sorters\22vimgrep_arguments\1\n\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\r--hidden\18--glob=!.git/\18layout_config\tflex\1\0\0\1\0\1\18preview_width\4Õô≥Ê\fÃô≥ˇ\3\rvertical\1\0\4\nwidth\4Õô≥Ê\fÃô≥ˇ\3\19preview_height\4\0ÄÄÄˇ\3\vmirror\1\vheight\4ÊÃô≥\6ÊÃπˇ\3\15horizontal\1\0\3\19preview_cutoff\3x\nwidth\4ÊÃô≥\6ÊÃπˇ\3\vheight\4Õô≥Ê\fÃô≥ˇ\3\18preview_width\0\1\0\4\nwidth\4ÊÃô≥\6ÊÃπˇ\3\20prompt_position\btop\vheight\4≥ÊÃô\3≥Ê¨ˇ\3\18results_width\4ö≥ÊÃ\tô≥¶ˇ\3\fhistory\1\0\1\nlimit\3d\27buffer_previewer_maker\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\fset_env\1\0\1\14COLORTERM\14truecolor\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚ï≠\b‚ïÆ\b‚ïØ\b‚ï∞\17path_display\1\2\0\0\rtruncate\1\0\f\vborder\2\15treesitter\2\23selection_strategy\nreset\21sorting_strategy\14ascending\20layout_strategy\15horizontal\19color_devicons\2\18prompt_prefix\n Ôë´ \26dynamic_preview_title\2\20selection_caret\tÔÅ§ \17entry_prefix\a  \15multi_icon\bÔÅß\17initial_mode\vinsert\nsetup\14core.keys\tjoin\afs\blib\vaerial\19load_extension\vnotify\14telescope\frequire\npcall\3ÄÄ¿ô\4\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["toggleterm.nvim"] = {
    config = { "\27LJ\2\ny\0\1\2\0\6\1\0159\1\0\0\a\1\1\0X\1\3Ä)\1\15\0L\1\2\0X\1\bÄ9\1\0\0\a\1\2\0X\1\5Ä6\1\3\0009\1\4\0019\1\5\1\24\1\0\1L\1\2\0K\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14directionµÊÃô\19ô≥Ê˛\3±\3\1\0\5\0\17\0\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0024\3\0\0=\3\6\0025\3\b\0005\4\a\0=\4\t\3=\3\n\0025\3\v\0005\4\f\0=\4\n\3=\3\r\2B\0\2\0016\0\0\0'\2\14\0B\0\2\0029\0\1\0006\2\0\0'\4\15\0B\2\2\0029\2\16\2B\0\2\1K\0\1\0\rTerminal\24toggleterm.terminal\14core.keys\15float_opts\1\0\2\15background\vNormal\vborder\fSpecial\1\0\2\vborder\vcurved\rwinblend\3\0\15highlights\vNormal\1\0\0\1\0\1\nguibg\abg\20shade_filetypes\tsize\1\0\a\20start_in_insert\2\17persist_size\2\18close_on_exit\2\17open_mapping\n<c-t>\14direction\15horizontal\17hide_numbers\2\20shade_terminals\2\0\nsetup\15toggleterm\frequire\0" },
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["vim-repeat"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/vim-repeat",
    url = "https://github.com/tpope/vim-repeat"
  },
  ["vim-surround"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/opt/vim-surround",
    url = "https://github.com/tpope/vim-surround"
  },
  ["vim-wakatime"] = {
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/vim-wakatime",
    url = "https://github.com/wakatime/vim-wakatime"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\nÀ\a\0\0\t\0)\00026\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0006\2\1\0'\4\3\0B\2\2\0029\3\4\0029\4\5\0015\6\v\0005\a\6\0005\b\a\0=\b\b\a5\b\t\0=\b\n\a=\a\f\0065\a\r\0=\a\14\0065\a\15\0=\a\16\0065\a\17\0009\b\18\0039\b\19\b=\b\20\a=\a\4\0065\a\21\0=\a\22\0065\a\23\0005\b\24\0=\b\25\a=\a\26\0065\a\28\0005\b\27\0=\b\29\a5\b\30\0=\b\31\a=\a \0065\a!\0=\a\"\0065\a$\0005\b#\0=\b%\a5\b&\0=\b'\a=\a(\6B\4\2\1K\0\1\0\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmin\3\20\bmax\0032\vheight\1\0\2\nalign\tleft\fspacing\3\3\1\0\2\bmin\3\4\bmax\3\25\vwindow\fpadding\1\5\0\0\3\0\3\0\3\0\3\0\1\0\2\vborder\frounded\rposition\vbottom\19popup_mappings\1\0\2\14scroll_up\n<c-u>\16scroll_down\n<c-d>\14separator\narrow\aui\1\0\2\15breadcrumb\b‚Ä¶\ngroup\6+\15key_labels\1\0\3\f<space>\bSPC\t<cr>\bRET\n<tab>\bTAB\14operators\1\0\v\6c\vChange\6y\16Yank (copy)\t<lt>\16Indent left\6>\17Indent right\6d\vDelete\azf\16Create fold\6!#Filter though external program\agc\rComments\ag~\16Toggle case\agu\14Lowercase\agU\14Uppercase\fplugins\1\0\3\rtriggers\tauto\19ignore_missing\1\14show_help\2\rspelling\1\0\2\fenabled\2\16suggestions\3\20\fpresets\1\0\a\14operators\2\6z\2\6g\2\bnav\2\fmotions\2\17text_objects\2\fwindows\2\1\0\2\14registers\2\nmarks\2\nsetup\nicons\ntheme\14which-key\frequire\npcall\0" },
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["wilder.nvim"] = {
    config = { "\27LJ\2\nÁ\5\0\0\16\0'\2C6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\2\4\0009\3\5\0015\5\a\0005\6\6\0=\6\b\5B\3\2\0019\3\t\1'\5\n\0)\6\0\0B\3\3\0019\3\t\1'\5\v\0004\6\3\0009\a\f\0019\t\r\0015\v\14\0009\f\15\1B\f\1\2=\f\16\vB\t\2\0029\n\17\1B\n\1\0A\a\1\0?\a\0\0B\3\3\0019\3\t\1'\5\18\0009\6\19\0015\b\21\0009\t\20\1B\t\1\2=\t\22\b5\t\30\0009\n\23\1'\f\24\0'\r\25\0004\14\4\0005\15\26\0>\15\1\0145\15\27\0>\15\2\0145\15\28\0=\2\29\15>\15\3\14B\n\4\2=\n\31\t=\t \b5\t!\0009\n\"\1B\n\1\0?\n\1\0=\t#\b5\t$\0009\n%\1B\n\1\0?\n\1\0=\t&\bB\6\2\0A\3\1\1K\0\1\0\nright\24popupmenu_scrollbar\1\2\0\0\6 \tleft\23popupmenu_devicons\1\2\0\0\6 \15highlights\vaccent\1\0\0\15foreground\1\0\0\1\0\1\6a\3\1\1\0\1\6a\3\1\nPmenu\17WilderAccent\fmake_hl\16highlighter\1\0\5\15max_height\b50%\freverse\3\0\rpumblend\3\0\15min_height\3\0\20prompt_position\btop\24lua_fzy_highlighter\23popupmenu_renderer\rrenderer\24vim_search_pipeline\17fuzzy_filter\19lua_fzy_filter\1\0\1\nfuzzy\3\1\21cmdline_pipeline\vbranch\rpipeline\29use_python_remote_plugin\15set_option\nmodes\1\0\0\1\4\0\0\6:\6/\6?\nsetup\tblue\vwilder\vcolors\ntheme\frequire\3ÄÄ¿ô\4\5ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/draxel/.local/share/nvim/site/pack/packer/start/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^aerial"] = "aerial.nvim",
  ["^lspconfig"] = "nvim-lspconfig",
  ["^neo%-tree"] = "neo-tree.nvim",
  ["^nui"] = "nui.nvim",
  ["^smart%-splits"] = "smart-splits.nvim",
  ["^telescope"] = "telescope.nvim"
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

-- Setup for: FixCursorHold.nvim
time([[Setup for FixCursorHold.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1d\0=\1\2\0K\0\1\0\26cursorhold_updatetime\6g\bvim\0", "setup", "FixCursorHold.nvim")
time([[Setup for FixCursorHold.nvim]], false)
-- Config for: gitsigns.nvim
time([[Config for gitsigns.nvim]], true)
try_loadstring("\27LJ\2\n\a\0\0\6\0\27\0\"6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0005\2\14\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\0035\4\f\0=\4\r\3=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\0025\3\20\0=\3\21\0025\3\22\0=\3\23\0025\3\24\0=\3\25\0029\3\26\1\18\5\2\0B\3\2\1K\0\1\0\nsetup\17watch_gitdir\1\0\2\17follow_files\2\rinterval\3Ë\a\19preview_config\1\0\5\bcol\3\1\rrelative\vcursor\brow\3\0\nstyle\fminimal\vborder\frounded&current_line_blame_formatter_opts\1\0\1\18relative_time\1\28current_line_blame_opts\1\0\4\14virt_text\2\18virt_text_pos\beol\ndelay\3Ë\a\22ignore_whitespace\1\fkeymaps\1\0\2\fnoremap\2\vbuffer\2\nsigns\1\0\t\vlinehl\1\20update_debounce\3»\1\18sign_priority\3\6\20max_file_length\3¿∏\2\nnumhl\1\14word_diff\1\23current_line_blame\1\15signcolumn\2\24attach_to_untracked\2\17changedelete\1\0\4\nnumhl\21GitSignsChangeNr\ttext\6_\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\14topdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\b‚Äæ\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vdelete\1\0\4\nnumhl\21GitSignsDeleteNr\ttext\6-\vlinehl\21GitSignsDeleteLn\ahl\19GitSignsDelete\vchange\1\0\4\nnumhl\21GitSignsChangeNr\ttext\6~\vlinehl\21GitSignsChangeLn\ahl\19GitSignsChange\badd\1\0\0\1\0\4\nnumhl\18GitSignsAddNr\ttext\6+\vlinehl\18GitSignsAddLn\ahl\16GitSignsAdd\rgitsigns\frequire\npcall\0", "config", "gitsigns.nvim")
time([[Config for gitsigns.nvim]], false)
-- Config for: neogit
time([[Config for neogit]], true)
try_loadstring("\27LJ\2\n˛\4\0\0\5\0$\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\a\0005\4\6\0=\4\b\0035\4\t\0=\4\n\0035\4\v\0=\4\f\3=\3\r\0025\3\14\0=\3\15\0025\3\17\0005\4\16\0=\4\18\0035\4\19\0=\4\20\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\3=\3\31\0025\3!\0005\4 \0=\4\"\3=\3#\2B\0\2\1K\0\1\0\rmappings\vstatus\1\0\0\1\0\1\6B\16BranchPopup\rsections\vrecent\1\0\1\vfolded\2\runmerged\1\0\1\vfolded\1\runpulled\1\0\1\vfolded\2\fstashes\1\0\1\vfolded\2\vstaged\1\0\1\vfolded\1\runstaged\1\0\1\vfolded\1\14untracked\1\0\0\1\0\1\vfolded\1\17integrations\1\0\1\rdiffview\1\nsigns\thunk\1\3\0\0\5\5\titem\1\3\0\0\6>\6v\fsection\1\0\0\1\3\0\0\6>\6v\17commit_popup\1\0\1\tkind\nsplit\1\0\b\17auto_refresh\2\"disable_builtin_notifications\1\26use_magit_keybindings\1\tkind\btab\18disable_signs\1\17disable_hint\1!disable_context_highlighting\1 disable_commit_confirmation\1\nsetup\vneogit\frequire\0", "config", "neogit")
time([[Config for neogit]], false)
-- Config for: cheatsheet.nvim
time([[Config for cheatsheet.nvim]], true)
try_loadstring("\27LJ\2\nÜ\3\0\0\a\0\15\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\6\0006\4\0\0'\6\4\0B\4\2\0029\4\5\4=\4\a\0036\4\0\0'\6\4\0B\4\2\0029\4\b\4=\4\t\0036\4\0\0'\6\4\0B\4\2\0029\4\n\4=\4\v\0036\4\0\0'\6\4\0B\4\2\0029\4\f\4=\4\r\3=\3\14\2B\0\2\1K\0\1\0\23telescope_mappings\n<C-E>\25edit_user_cheatsheet\n<C-Y>\21copy_cheat_value\v<A-CR>\22select_or_execute\t<CR>\1\0\0\31select_or_fill_commandline!cheatsheet.telescope.actions\1\0\3#include_only_installed_plugins\2\24bundled_cheatsheets\2\31bundled_plugin_cheatsheets\2\nsetup\15cheatsheet\frequire\0", "config", "cheatsheet.nvim")
time([[Config for cheatsheet.nvim]], false)
-- Config for: wilder.nvim
time([[Config for wilder.nvim]], true)
try_loadstring("\27LJ\2\nÁ\5\0\0\16\0'\2C6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\1\0\0'\3\3\0B\1\2\0029\2\4\0009\3\5\0015\5\a\0005\6\6\0=\6\b\5B\3\2\0019\3\t\1'\5\n\0)\6\0\0B\3\3\0019\3\t\1'\5\v\0004\6\3\0009\a\f\0019\t\r\0015\v\14\0009\f\15\1B\f\1\2=\f\16\vB\t\2\0029\n\17\1B\n\1\0A\a\1\0?\a\0\0B\3\3\0019\3\t\1'\5\18\0009\6\19\0015\b\21\0009\t\20\1B\t\1\2=\t\22\b5\t\30\0009\n\23\1'\f\24\0'\r\25\0004\14\4\0005\15\26\0>\15\1\0145\15\27\0>\15\2\0145\15\28\0=\2\29\15>\15\3\14B\n\4\2=\n\31\t=\t \b5\t!\0009\n\"\1B\n\1\0?\n\1\0=\t#\b5\t$\0009\n%\1B\n\1\0?\n\1\0=\t&\bB\6\2\0A\3\1\1K\0\1\0\nright\24popupmenu_scrollbar\1\2\0\0\6 \tleft\23popupmenu_devicons\1\2\0\0\6 \15highlights\vaccent\1\0\0\15foreground\1\0\0\1\0\1\6a\3\1\1\0\1\6a\3\1\nPmenu\17WilderAccent\fmake_hl\16highlighter\1\0\5\15max_height\b50%\freverse\3\0\rpumblend\3\0\15min_height\3\0\20prompt_position\btop\24lua_fzy_highlighter\23popupmenu_renderer\rrenderer\24vim_search_pipeline\17fuzzy_filter\19lua_fzy_filter\1\0\1\nfuzzy\3\1\21cmdline_pipeline\vbranch\rpipeline\29use_python_remote_plugin\15set_option\nmodes\1\0\0\1\4\0\0\6:\6/\6?\nsetup\tblue\vwilder\vcolors\ntheme\frequire\3ÄÄ¿ô\4\5ÄÄ¿ô\4\0", "config", "wilder.nvim")
time([[Config for wilder.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: alpha-nvim
time([[Config for alpha-nvim]], true)
try_loadstring("\27LJ\2\n„\1\0\0\v\1\15\0\0306\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2-\4\0\0009\4\4\0046\6\0\0009\6\1\0069\6\5\6'\b\6\0B\6\2\2'\a\a\0'\b\b\0'\t\t\0'\n\n\0B\4\6\2'\5\v\0)\6\0\0)\a\1\0B\2\5\0A\0\0\2'\1\f\0\18\3\1\0009\1\r\1\18\4\0\0B\1\3\2'\2\14\0L\1\2\0\2¿\14draxel.io\vformat\22loaded %s plugins\6*\nstart\vpacker\tpack\tsite\tdata\fstdpath\tjoin\rglobpath\blen\afn\bvimï\r\1\0\f\0002\2m6\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1Ä2\0eÄ6\2\1\0'\4\3\0B\2\2\0029\2\4\0026\3\1\0'\5\5\0B\3\2\0029\3\6\0036\4\1\0'\6\a\0B\4\2\0029\5\b\0049\5\t\0055\6\v\0'\a\f\0\18\t\a\0009\a\r\a'\n\14\0B\a\3\0?\a\0\0=\6\n\0059\5\b\0049\5\15\0054\6\6\0009\a\16\4'\t\17\0009\n\18\0039\n\19\n9\n\20\n'\v\21\0&\n\v\n'\v\22\0B\a\4\2>\a\1\0069\a\16\4'\t\23\0009\n\24\0039\n\25\n'\v\26\0&\n\v\n'\v\27\0B\a\4\2>\a\2\0069\a\16\4'\t\28\0009\n\24\0039\n\29\n'\v\30\0&\n\v\n'\v\31\0B\a\4\2>\a\3\0069\a\16\4'\t \0009\n\24\0039\n!\n'\v\"\0&\n\v\n'\v#\0B\a\4\2>\a\4\0069\a\16\4'\t$\0009\n%\0039\n&\n'\v'\0&\n\v\n'\v(\0B\a\4\0?\a\1\0=\6\n\0053\5)\0009\6\b\0049\6*\6\18\a\5\0B\a\1\2=\a\n\0069\6\b\0049\6*\0069\6+\6'\a-\0=\a,\0069\6\b\0049\6\t\0069\6+\6'\a.\0=\a,\0069\6\b\0049\6\15\0069\6+\6'\a/\0=\a,\0069\6+\0049\6+\6+\a\2\0=\a0\0069\0061\0019\b+\4B\6\2\0012\0\0ÄK\0\1\0K\0\1\0\nsetup\14noautocmd\fKeyword\fInclude\tType\ahl\topts\vfooter\0\f:qa<CR>\n Quit\nerror\16diagnostics\6q$:e ~/.config/nvim/init.lua <CR>\f Config\tgear\6c\30:Telescope live_grep <CR>\15 Find text\tlist\6t\28:Telescope frecency<CR>\18 Recent files\fhistory\aui\6r :ene <BAR> startinsert <CR>\14 New file\fdefault\tfile\14documents\6e\vbutton\fbuttons\a]]\vformatI  \\(_)_%s      /  |  \\                           *   *  .   .       \1\f\0\0I                                        __                          I           ___     ___    ___   __  __ /\\_\\    ___ ___              I          / _ `\\  / __`\\ / __`\\/\\ \\/\\ \\\\/\\ \\  / __` __`\\            I         /\\ \\/\\ \\/\\  __//\\ \\_\\ \\ \\ \\_/ |\\ \\ \\/\\ \\/\\ \\/\\ \\           I         \\ \\_\\ \\_\\ \\____\\ \\____/\\ \\___/  \\ \\_\\ \\_\\ \\_\\ \\_\\          I          \\/_/\\/_/\\/____/\\/___/  \\/__/    \\/_/\\/_/\\/_/\\/_/          I                                                                    I      .-.      _______                           .  '  *   .  . '   I     {}``; |==|_______D                                . *  -+-  .  I     / ('        /|\\                             . '   * .    '  *  I (  /  |        / | \\                                * .  ' .  .-+- \bval\vheader\fsection\27alpha.themes.dashboard\nicons\ntheme\afs\blib\nalpha\frequire\npcall\25ÄÄ¿ô\4\vÄÄ¿ô\4\0", "config", "alpha-nvim")
time([[Config for alpha-nvim]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\nÀ\a\0\0\t\0)\00026\0\0\0006\2\1\0'\3\2\0B\0\3\3\14\0\0\0X\2\1ÄK\0\1\0006\2\1\0'\4\3\0B\2\2\0029\3\4\0029\4\5\0015\6\v\0005\a\6\0005\b\a\0=\b\b\a5\b\t\0=\b\n\a=\a\f\0065\a\r\0=\a\14\0065\a\15\0=\a\16\0065\a\17\0009\b\18\0039\b\19\b=\b\20\a=\a\4\0065\a\21\0=\a\22\0065\a\23\0005\b\24\0=\b\25\a=\a\26\0065\a\28\0005\b\27\0=\b\29\a5\b\30\0=\b\31\a=\a \0065\a!\0=\a\"\0065\a$\0005\b#\0=\b%\a5\b&\0=\b'\a=\a(\6B\4\2\1K\0\1\0\23triggers_blacklist\6v\1\3\0\0\6j\6k\6i\1\0\0\1\3\0\0\6j\6k\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmin\3\20\bmax\0032\vheight\1\0\2\nalign\tleft\fspacing\3\3\1\0\2\bmin\3\4\bmax\3\25\vwindow\fpadding\1\5\0\0\3\0\3\0\3\0\3\0\1\0\2\vborder\frounded\rposition\vbottom\19popup_mappings\1\0\2\14scroll_up\n<c-u>\16scroll_down\n<c-d>\14separator\narrow\aui\1\0\2\15breadcrumb\b‚Ä¶\ngroup\6+\15key_labels\1\0\3\f<space>\bSPC\t<cr>\bRET\n<tab>\bTAB\14operators\1\0\v\6c\vChange\6y\16Yank (copy)\t<lt>\16Indent left\6>\17Indent right\6d\vDelete\azf\16Create fold\6!#Filter though external program\agc\rComments\ag~\16Toggle case\agu\14Lowercase\agU\14Uppercase\fplugins\1\0\3\rtriggers\tauto\19ignore_missing\1\14show_help\2\rspelling\1\0\2\fenabled\2\16suggestions\3\20\fpresets\1\0\a\14operators\2\6z\2\6g\2\bnav\2\fmotions\2\17text_objects\2\fwindows\2\1\0\2\14registers\2\nmarks\2\nsetup\nicons\ntheme\14which-key\frequire\npcall\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: filetype.nvim
time([[Config for filetype.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rfiletype\frequire\0", "config", "filetype.nvim")
time([[Config for filetype.nvim]], false)
-- Config for: toggleterm.nvim
time([[Config for toggleterm.nvim]], true)
try_loadstring("\27LJ\2\ny\0\1\2\0\6\1\0159\1\0\0\a\1\1\0X\1\3Ä)\1\15\0L\1\2\0X\1\bÄ9\1\0\0\a\1\2\0X\1\5Ä6\1\3\0009\1\4\0019\1\5\1\24\1\0\1L\1\2\0K\0\1\0\fcolumns\6o\bvim\rvertical\15horizontal\14directionµÊÃô\19ô≥Ê˛\3±\3\1\0\5\0\17\0\0286\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0024\3\0\0=\3\6\0025\3\b\0005\4\a\0=\4\t\3=\3\n\0025\3\v\0005\4\f\0=\4\n\3=\3\r\2B\0\2\0016\0\0\0'\2\14\0B\0\2\0029\0\1\0006\2\0\0'\4\15\0B\2\2\0029\2\16\2B\0\2\1K\0\1\0\rTerminal\24toggleterm.terminal\14core.keys\15float_opts\1\0\2\15background\vNormal\vborder\fSpecial\1\0\2\vborder\vcurved\rwinblend\3\0\15highlights\vNormal\1\0\0\1\0\1\nguibg\abg\20shade_filetypes\tsize\1\0\a\20start_in_insert\2\17persist_size\2\18close_on_exit\2\17open_mapping\n<c-t>\14direction\15horizontal\17hide_numbers\2\20shade_terminals\2\0\nsetup\15toggleterm\frequire\0", "config", "toggleterm.nvim")
time([[Config for toggleterm.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd popup.nvim ]]
vim.cmd [[ packadd nvim-notify ]]

-- Config for: nvim-notify
try_loadstring("\27LJ\2\n‡\1\0\0\4\0\a\0\r6\0\0\0006\1\2\0'\3\1\0B\1\2\2=\1\1\0006\0\0\0009\0\1\0009\0\3\0005\2\4\0005\3\5\0=\3\6\2B\0\2\1K\0\1\0\nicons\1\0\5\nTRACE\b‚úé\nDEBUG\bÔÜà\tINFO\bÔ†µ\nERROR\bÔôô\tWARN\bÔî©\1\0\5\vrender\fdefault\22background_colour\vNormal\18minimum_width\0032\ftimeout\3à'\vstages\nslide\nsetup\frequire\vnotify\bvim\0", "config", "nvim-notify")

vim.cmd [[ packadd plenary.nvim ]]
vim.cmd [[ packadd copilot.lua ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspInfo lua require("packer.load")({'nvim-lsp-installer'}, { cmd = "LspInfo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspInstall lua require("packer.load")({'nvim-lsp-installer'}, { cmd = "LspInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspUninstall lua require("packer.load")({'nvim-lsp-installer'}, { cmd = "LspUninstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspUpdate lua require("packer.load")({'nvim-lsp-installer'}, { cmd = "LspUpdate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspEnable lua require("packer.load")({'nvim-lsp-installer'}, { cmd = "LspEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file LspDisable lua require("packer.load")({'nvim-lsp-installer'}, { cmd = "LspDisable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AerialToggle lua require("packer.load")({'aerial.nvim'}, { cmd = "AerialToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AerialOpen lua require("packer.load")({'aerial.nvim'}, { cmd = "AerialOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file AerialInfo lua require("packer.load")({'aerial.nvim'}, { cmd = "AerialInfo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSInstall lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSInstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSInstallInfo lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSInstallInfo", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSInstallSync lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSInstallSync", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSUninstall lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSUninstall", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSUpdate lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSUpdate", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSUpdateSync lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSUpdateSync", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSDisableAll lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSDisableAll", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neotree lua require("packer.load")({'neo-tree.nvim'}, { cmd = "Neotree", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopWord lua require("packer.load")({'hop.nvim'}, { cmd = "HopWord", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopLine lua require("packer.load")({'hop.nvim'}, { cmd = "HopLine", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file HopChar1 lua require("packer.load")({'hop.nvim'}, { cmd = "HopChar1", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file TSEnableAll lua require("packer.load")({'nvim-treesitter'}, { cmd = "TSEnableAll", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args>, mods = "<mods>" }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'nvim-cmp', 'friendly-snippets', 'LuaSnip', 'nvim-ts-autotag', 'nvim-autopairs'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufNewFile * ++once lua require("packer.load")({'nvim-treesitter', 'FixCursorHold.nvim', 'vim-repeat', 'nvim-lsp-installer', 'Comment.nvim'}, { event = "BufNewFile *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'nvim-cmp', 'vim-surround', 'nvim-treesitter', 'FixCursorHold.nvim', 'vim-repeat', 'hop.nvim', 'nvim-lsp-installer', 'Comment.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au CmdlineEnter * ++once lua require("packer.load")({'friendly-snippets', 'LuaSnip'}, { event = "CmdlineEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufReadPre * ++once lua require("packer.load")({'nvim-cmp', 'vim-surround', 'hop.nvim'}, { event = "BufReadPre *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
