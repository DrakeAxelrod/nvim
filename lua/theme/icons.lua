local M = {}

M.kind = {
  Array = "",
  Boolean = "蘒",
  Class = "",
  Color = "",
  Constant = "",
  Constructor = "",
  Enum = "",
  EnumMember = "",
  Event = "",
  Field = "",
  File = "",
  Folder = "",
  Function = "",
  Interface = "",
  Key = "",
  Keyword = "",
  Method = "",
  Module = "",
  Namespace = "",
  Null = "ﳠ",
  Number = "",
  Object = "",
  Operator = "",
  Package = "",
  Property = "",
  Reference = "",
  Snippet = "",
  String = "",
  Struct = "",
  Text = "",
  TypeParameter = "",
  Unit = "",
  Value = "",
  Variable = "",
}

M.kind_with_space = {}
for k, v in pairs(M.kind) do
  M.kind_with_space[k] = v .. " "
end

M.git = {
  LineAdded = "",
  LineModified = "",
  LineRemoved = "",
  FileDeleted = "",
  FileIgnored = "◌",
  FileRenamed = "➜",
  FileStaged = "S",
  FileUnmerged = "",
  FileUnstaged = "",
  FileUntracked = "U",
  Diff = "",
  Repo = "",
  Octoface = "",
  Branch = "",
}

M.ui = {
  ArrowCircleDown = "",
  ArrowCircleLeft = "",
  ArrowCircleRight = "",
  ArrowCircleUp = "",
  BoldArrowDown = "",
  BoldArrowLeft = "",
  BoldArrowRight = "",
  BoldArrowUp = "",
  BoldClose = "",
  BoldDividerLeft = "",
  BoldDividerRight = "",
  BoldLineLeft = "▎",
  BookMark = "",
  BoxChecked = "",
  Bug = "",
  Stacks = " ",
  Scopes = "",
  Watches = "",
  DebugConsole = " ",
  Calendar = "",
  Check = "",
  ChevronRight = ">",
  ChevronShortDown = "",
  ChevronShortLeft = "",
  ChevronShortRight = "",
  ChevronShortUp = "",
  Circle = "",
  Close = "",
  CloudDownload = "",
  Code = "",
  Comment = "",
  Dashboard = "",
  DividerLeft = "",
  DividerRight = "",
  DoubleChevronRight = "»",
  Ellipsis = "…",
  EmptyFolder = "",
  EmptyFolderOpen = "",
  File = "",
  FileSymlink = "",
  Files = "",
  FindFile = "",
  FindText = "",
  Fire = "",
  Folder = "",
  FolderOpen = "",
  FolderSymlink = "",
  Forward = "",
  Gear = "",
  History = "",
  Lightbulb = "",
  LineLeft = "▏",
  LineMiddle = "│",
  List = "",
  Lock = "",
  NewFile = "",
  Note = "",
  Package = "",
  Pencil = "",
  Plus = "",
  Project = "",
  Search = "",
  SignIn = "",
  SignOut = "",
  Tab = "",
  Table = "",
  Target = "",
  Telescope = "",
  Text = "",
  Tree = "",
  Triangle = "契",
  TriangleShortArrowDown = "",
  TriangleShortArrowLeft = "",
  TriangleShortArrowRight = "",
  TriangleShortArrowUp = "",
}

M.diagnostics = {
  BoldError = "",
  Error = "",
  BoldWarning = "",
  Warning = "",
  BoldInformation = "",
  Information = "",
  BoldQuestion = "",
  Question = "",
  BoldHint = "",
  Hint = "",
  Debug = "",
  Trace = "✎",
}

M.misc = {
  Robot = "ﮧ",
  Squirrel = "",
  Tag = "",
  Watch = "",
  Smiley = "ﲃ",
  Package = "",
  CircuitBoard = "",
  Tip = "",
  Terminal = "" -- 
}

M.get = function(section, name)
  return M[section][name:sub(1, 1):upper() .. name:sub(2)]
end

return M

-- error = "",
-- warning = "",
-- information = "",
-- question = "",
-- hint = "",
-- error = "",
-- warning = "",
-- information = "",
-- question = "",
-- hint = "",
-- lock = "", --    
-- circle = "", --  
-- bigcircle = "", -- ,
-- bigunfilledcircle = "", -- ﱣ
-- close = "", --      ﯇
-- newfile = "", --     
-- search = "", --  
-- lightbulb = "", --   ﯦ ﯧ  
-- project = "", --   
-- dashboard = "", -- ﵁ 舘
-- history = "", --   
-- comment = "", --        
-- bug = "", --  
-- code = "", --   
-- telescope = "", --   
-- gear = "", --   
-- package = "", -- 
-- list = "",
-- signin = "", -- 
-- check = "", --                 
-- fire = "",
-- tree = "侮", --  串  侮 滑
-- note = "",
-- bookmark = "",
-- pencil = "",
-- stacks = " ",
-- scopes = "",
-- watches = "",
-- -- chevronright = "",
-- chevronright = ">", --    
-- arrow = "➜",
-- table = "",
-- calendar = "",
-- update = "", -- 
-- download = "", --      
-- pause = "", --    
-- cross = "", --    
-- ok = "", --   
-- expand = "ﬕ",
-- spinnerframes = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
-- documents = {
--   arrow = {
--     open = "",
--     closed = "",
--   },
--   folder = {
--     default = "",
--     open = "",
--     symlink = "",
--     empty = "",
--     empty_open = "",
--   },
--   file = {
--     default = "",
--     symlink = "",
--     files = "",
--   },
--   git = {
--     unstaged = "",
--     staged = "s",
--     unmerged = "",
--     renamed = "➜",
--     deleted = "",
--     untracked = "u",
--     ignored = "◌",
--   },
-- },

-- local kind = {
--   Array = "",
--   Boolean = "⊨",
--   Text = "",
--   Method = "",
--   Function = "",
--   Constructor = "",
--   -- Field = "ﰠ",
--   Field = "",
--   Variable = "",
--   Class = "ﴯ",
--   Interface = "",
--   Module = "",
--   Property = "",
--   Unit = "",
--   Value = "",
--   Enum = "",
--   -- Enum = "ℰ",
--   -- Keyword = "",
--   Key = "",
--   Snippet = "",
--   Color = "",
--   File = "",
--   -- File = "",
--   Reference = "",
--   Folder = "",
--   EnumMember = "",
--   -- Constant = "",
--   Constant = "",
--   String = "𝓐",
--   Struct = "",
--   -- Struct = "𝓢",
--   Event = "",
--   Operator = "",
--   -- TypeParameter = "",
--   TypeParameter = "𝙏",
--   Object = "⦿",
--   Number = "#",
--   Null = "NULL",
-- }

--[[
       ﯏ ﯐ ﯑ ﯒ ﯓ ﯔ ﯕ ﯖ ﯗ ﯘ ﯙ ﯚ ﯛ ﯜ ﯝ ﯞ ﯟ ﯠ ﯡ ﯢ ﯣ ﯤ ﯥ ﯦ ﯧ ﯨ ﯩ ﯪ ﯫ ﯬ ﯭ ﯮ ﯯ ﯰ ﯱ ﯲ ﯳ ﯴ ﯵ ﯶ ﯷ ﯸ ﯹ ﯺ ﯻ ﯼ ﯽ ﯾ ﯿ                                                                                                                                                                                                                                                                                                                                                                                                                                                                    

]]
