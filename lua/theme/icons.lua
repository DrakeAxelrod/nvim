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
  Copilot = ""
}

M.kind_with_space = {}
for k, v in pairs(M.kind) do
  M.kind_with_space[k] = v .. " "
end

M.git = {
  LineAdded = "",
  LineModified = "",
  LineRemoved = "",
  FileDeleted = "", -- "✖",
  FileIgnored = "◌", -- ""
  FileRenamed = "➜",
  FileStaged = "S", -- "",
  FileUnmerged = "",
  FileUnstaged = "", --"",
  FileUntracked = "", --"U",
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
  AltCheck = "✓",
  ChevronRight = ">",
  ChevronShortDown = "",
  ChevronShortLeft = "",
  ChevronShortRight = "",
  ChevronShortUp = "",
  Circle = "",
  SmallCircle = "", --"",
  SmallEmptyCircle = "o",
  Square = "",
  SquareUnFilled = "",
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
  BoldLineMiddle = "┃",
  LastIndentMarker = "└",
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
  MagnifyingGlass = "",
  Link = "",
  AltLink = "",
  TriangleShortArrowDown = "",
  TriangleShortArrowLeft = "",
  TriangleShortArrowRight = "",
  TriangleShortArrowUp = "",
}

M.installer = {
  Working = "",
  Error = "",
  Success = "",
  Removed = "",
  Moved = "",
  -- working_sym = "ﰭ",
  -- error_sym = "",
  -- done_sym = "",
  -- removed_sym = "",
  -- moved_sym = "ﰳ",
}

M.Statusline = {
  Scrollbar = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" },
  -- Scrollbar = { "⣾", "⣽", "⣻", "⢿", "⡿", "⣟", "⣯", "⣷" },
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
  Lightning = "",
  AltLightning = "ﴞ",
  Esclamation = "",
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

return M
