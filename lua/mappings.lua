local default_opts = {
  keymaps = {
    silent = true,
    noremap = true,
  },
  commands = {},
  autocmds = {},
}

local keymaps = {
  { "<esc>", "<Esc>:noh<CR>", description = "Remove search highlights in normal mode", mode = { "n" } },
  { "<space>", "<nop>", description = "Dont move cursor on space", mode = { "n", "x" } },
  -- map keys to a function
  { "<leader>e", ":NvimTreeToggle<cr>", description = "Toggle NvimTree", mode = { "n" } },
  -- hop
  { "<leader>j", ":HopWord<cr>", description = "Hop!", mode = { "n" } },
  -- splits
  { "<leader>-", ":new<cr>", description = "Horizonal split", mode = { "n" } },
  { "<leader>\\", ":vnew<cr>", description = "Vertical split", mode = { "n" } },
  -- indentation
  { "<", "<gv", description = "Indent left", mode = { "v" } },
  { ">", ">gv", description = "Indent right", mode = { "v" } },
  { "<tab>", ">>_", description = "Indent line", mode = { "n" } },
  { "<s-tab>", "<<_", description = "Unindent line", mode = { "n" } },
  { "<s-tab>", "<c-d>", description = "Unindent line", mode = { "i" } },
  { "<tab>", ">gv", description = "Indent line", mode = { "v" } },
  { "<s-tab>", "<gv", description = "Unindent line", mode = { "v" } },
  -- move lines
  { "<a-j>", ":m .+1<cr>==", description = "Move line down", mode = { "n" } },
  { "<a-k>", ":m .-2<cr>==", description = "Move line up", mode = { "n" } },
  { "<a-j>", ":m '>+1<cr>gv=gv", description = "Move line down", mode = { "v" } },
  { "<a-k>", ":m '<-2<cr>gv=gv", description = "Move line up", mode = { "v" } },
  { "<a-j>", ":m '>+1<cr>gv-gv", description = "Move line down", mode = { "x" } },
  { "<a-k>", ":m '<-2<cr>gv-gv", description = "Move line up", mode = { "x" } },
  -- move between windows
  { "<c-h>", ":SmartCursorMoveLeft", description = "Move to left window", mode = { "n" } },
  { "<c-j>", ":SmartCursorMoveDown", description = "Move to bottom window", mode = { "n" } },
  { "<c-k>", ":SmartCursorMoveUp", description = "Move to top window", mode = { "n" } },
  { "<c-l>", ":SmartCursorMoveRight", description = "Move to right window", mode = { "n" } },
  -- resize windows
  { "<s-h>", ":SmartCursorMoveLeft", description = "Resize Left", mode = { "n" } },
  { "<s-j>", ":SmartCursorMoveDown", description = "Resize Down", mode = { "n" } },
  { "<s-k>", ":SmartCursorMoveUp", description = "Resize Up", mode = { "n" } },
  { "<s-l>", ":SmartCursorMoveRight", description = "Resize Right", mode = { "n" } },
  -- move between tabs
  { "<a-h>", ":tabprevious<cr>", description = "Move to left tab", mode = { "n" } },
  { "<a-l>", ":tabnext<cr>", description = "Move to right tab", mode = { "n" } },
  -- terminal mode
  { "<esc>", "<C-\\><C-N>", description = "Escape Terminal", mode = { "n" } },
  { "<esc>", "<C-\\><C-N><C-w>h", description = "Move to left window", mode = { "t" } },
  { "<esc>", "<C-\\><C-N><C-w>j", description = "Move to bottom window", mode = { "t" } },
  { "<esc>", "<C-\\><C-N><C-w>k", description = "Move to top window", mode = { "t" } },
  { "<esc>", "<C-\\><C-N><C-w>l", description = "Move to right window", mode = { "t" } },
  -- command mode
  { "<c-j>", 'pumvisible() ? "\\<C-n>" : "\\<C-j>"', { expr = true, noremap = true }, mode = { "c" } },
  { "<c-k>", 'pumvisible() ? "\\<C-p>" : "\\<C-k>"', { expr = true, noremap = true }, mode = { "c" } },
  
}

local commands = {
  -- easily create user commands
  {
    ":SayHello",
    function()
      print "hello world!"
    end,
    description = "Say hello as a command",
  },
}

local autocmds = {
  {
    "BufEnter",
    function()
      vim.wo.wrap = true
    end,
    opts = {
      pattern = { "*.json", "*.jsonc" },
    },
    description = "Wrap on enter for json files",
  },
  {
    "FileType",
    function()
      require("nvim-treesitter.highlight").attach(0, "bash")
    end,
    opts = {
      pattern = "zsh",
    },
    description = "Attach treesitter highlight for zsh files",
  },
  {
    "FileType",
    function()
      vim.b.miniindentscope_disable = true
    end,
    opts = {
      pattern = "NvimTree,Telescope,startup",
    },
    description = "Disable miniindent for NvimTree, Telescope and startup",
  },
  {
    "VimResized",
    function()
      vim.cmd "wincmd ="
    end,
    opts = {
      pattern = "*",
    },
    description = "Auto resize windows",
  },
}

local functions = {
  -- Make arbitrary Lua functions that can be executed via the item finder
  -- { function() doSomeStuff() end, description = 'Do some stuff with a Lua function!' },
}

return {
  default_opts = default_opts,
  keymaps = keymaps,
  commands = commands,
  autocmds = autocmds,
  functions = functions,
}
