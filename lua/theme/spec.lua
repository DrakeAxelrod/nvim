local M = {}
M.lush = require("lush")
M.hsl = M.lush.hsl
M.hsluv = M.lush.hsluv
-- M.colors = {
--   background = "#353b49",
--   foreground = "#c8d0e0",
--   red = "#bf616a",
--   br_red = "#d57880",
--   yellow = "#ebcb8b",
--   green = "#a3be8c",
--   blue = "#5e81ac",
--   br_blue = "#81a1c1",
--   magenta = "#b988b0",
--   cyan = "#88c0d0",
--   orange = "#d08f70",
--   gray = "#6c7a96",
--   white = "#c8d0e0",
--   black = "#353b49",
--   -- "#4c566a",
--   br_black = "#646a76",
--   br_white = "#fbf1c7",
-- }
local onedark = {
  background = "#23272e",
  foreground = "#d7dae0",
  red = "#e05561",
  br_red = "#ff616e",
  yellow = "#d18f52",
  br_yellow = "#f0a45d",
  green = "#8cc265",
  br_green ="#a5e075",
  blue = "#4aa5f0",
  br_blue = "#4dc4ff",
  magenta = "#c162de",
  br_magenta = "#de73ff",
  cyan = "#42b3c2",
  br_cyan = "#4cd1e0",
  orange = "#f0a45d",
  gray = "#abb2bf",
  white = "#e6e6e6",
  br_white = "#d7dae0",
  black = "#3f4451",
  br_black = "#4f5666",
}

M.colors = onedark
M.theme = M.lush(function()
  return {
    SpecialKey                             { fg=M.colors.blue, }, -- SpecialKey     xxx ctermfg=81 guifg=#5e81ac
    EndOfBuffer                            { fg=M.colors.br_black, }, -- EndOfBuffer    xxx guifg=#646a76
    TermCursor                             { gui="reverse", }, -- TermCursor     xxx cterm=reverse gui=reverse
    GitSignsAddInline                      { TermCursor }, -- GitSignsAddInline xxx links to TermCursor
    GitSignsDeleteInline                   { TermCursor }, -- GitSignsDeleteInline xxx links to TermCursor
    GitSignsChangeInline                   { TermCursor }, -- GitSignsChangeInline xxx links to TermCursor
    NonText                                { fg=M.colors.br_black, }, -- NonText        xxx ctermfg=12 guifg=#646a76
    GitSignsCurrentLineBlame               { NonText }, -- GitSignsCurrentLineBlame xxx links to NonText
    TelescopePreviewHyphen                 { NonText }, -- TelescopePreviewHyphen xxx links to NonText
    TelescopePromptCounter                 { NonText }, -- TelescopePromptCounter xxx links to NonText
    TelescopeResultsDiffUntracked          { NonText }, -- TelescopeResultsDiffUntracked xxx links to NonText
    Directory                              { fg=M.colors.br_blue, }, -- Directory      xxx ctermfg=159 guifg=#81a1c1
    TelescopePreviewDate                   { Directory }, -- TelescopePreviewDate xxx links to Directory
    TelescopePreviewDirectory              { Directory }, -- TelescopePreviewDirectory xxx links to Directory
    ErrorMsg                               { fg=M.colors.red, }, -- ErrorMsg       xxx ctermfg=15 ctermbg=1 guifg=#bf616a
    NvimInvalidSpacing                     { ErrorMsg }, -- NvimInvalidSpacing xxx links to ErrorMsg
    IncSearch                              { fg=M.colors.yellow, bg="#4c566a", gui="bold,underline", }, -- IncSearch      xxx cterm=reverse gui=bold,underline guifg=#ebcb8b guibg=#4c566a
    Search                                 { fg=M.colors.br_blue, bg="#4c566a", gui="bold", }, -- Search         xxx ctermfg=0 ctermbg=11 gui=bold guifg=#81a1c1 guibg=#4c566a
    Substitute                             { Search }, -- Substitute     xxx links to Search
    TelescopePreviewMatch                  { Search }, -- TelescopePreviewMatch xxx links to Search
    MoreMsg                                { fg=M.colors.br_blue, gui="bold", }, -- MoreMsg        xxx ctermfg=121 gui=bold guifg=#81a1c1
    ModeMsg                                { fg=M.colors.br_blue, gui="bold", }, -- ModeMsg        xxx cterm=bold gui=bold guifg=#81a1c1
    LineNr                                 { fg=M.colors.gray, }, -- LineNr         xxx ctermfg=11 guifg=#6c7a96
    LineNrAbove                            { LineNr }, -- LineNrAbove    xxx links to LineNr
    LineNrBelow                            { LineNr }, -- LineNrBelow    xxx links to LineNr
    TelescopeResultsLineNr                 { LineNr }, -- TelescopeResultsLineNr xxx links to LineNr
    CursorLineNr                           { fg=M.colors.br_blue, }, -- CursorLineNr   xxx cterm=underline ctermfg=11 guifg=#d57880
    Question                               { fg=M.colors.green, }, -- Question       xxx ctermfg=121 guifg=#a3be8c
    StatusLine                             { fg=M.colors.foreground, bg=M.colors.background, }, -- StatusLine     xxx cterm=bold,reverse guifg=#c8d0e0 guibg=#353b49
    MsgSeparator                           { StatusLine }, -- MsgSeparator   xxx links to StatusLine
    StatusLineNC                           { fg=M.colors.gray, bg=M.colors.background, }, -- StatusLineNC   xxx cterm=reverse guifg=#6c7a96 guibg=#353b49
    VertSplit                              { fg="#4c566a", }, -- VertSplit      xxx cterm=reverse guifg=#4c566a
    WinSeparator                           { VertSplit }, -- WinSeparator   xxx links to VertSplit
    Title                                  { fg=M.colors.green, gui="bold", }, -- Title          xxx ctermfg=225 gui=bold guifg=#a3be8c
    Visual                                 { bg="#3f4758", }, -- Visual         xxx ctermbg=242 guibg=#3f4758
    TelescopePreviewLine                   { Visual }, -- TelescopePreviewLine xxx links to Visual
    WarningMsg                             { fg=M.colors.orange, }, -- WarningMsg     xxx ctermfg=224 guifg=#d08f70
    WildMenu                               { fg=M.colors.yellow, gui="bold", }, -- WildMenu       xxx ctermfg=0 ctermbg=11 gui=bold guifg=#ebcb8b
    Folded                                 { fg=M.colors.blue, gui="italic", }, -- Folded         xxx ctermfg=14 ctermbg=242 gui=italic guifg=#5e81ac
    FoldColumn                             { fg=M.colors.gray, }, -- FoldColumn     xxx ctermfg=14 ctermbg=242 guifg=#6c7a96
    CursorLineFold                         { FoldColumn }, -- CursorLineFold xxx links to FoldColumn
    DiffAdd                                { bg="#394e3d", }, -- DiffAdd        xxx ctermbg=4 guibg=#394e3d
    TelescopeResultsDiffAdd                { DiffAdd }, -- TelescopeResultsDiffAdd xxx links to DiffAdd
    DiffChange                             { bg="#39495d", }, -- DiffChange     xxx ctermbg=5 guibg=#39495d
    TelescopeResultsDiffChange             { DiffChange }, -- TelescopeResultsDiffChange xxx links to DiffChange
    DiffDelete                             { bg="#4d2b2e", }, -- DiffDelete     xxx ctermfg=12 ctermbg=6 guibg=#4d2b2e
    TelescopeResultsDiffDelete             { DiffDelete }, -- TelescopeResultsDiffDelete xxx links to DiffDelete
    DiffText                               { bg="#405d7e", }, -- DiffText       xxx cterm=bold ctermbg=9 guibg=#405d7e
    SignColumn                             { fg=M.colors.foreground, }, -- SignColumn     xxx ctermfg=14 ctermbg=242 guifg=#c8d0e0
    CursorLineSign                         { SignColumn }, -- CursorLineSign xxx links to SignColumn
    Conceal                                { bg=M.colors.background, }, -- Conceal        xxx ctermfg=7 ctermbg=242 guibg=#2e3440
    SpellBad                               { fg=M.colors.br_red, gui="underline,italic", sp=M.colors.br_red, }, -- SpellBad       xxx ctermbg=9 gui=underline,italic guifg=#d57780 guisp=#d57780
    SpellCap                               { fg=M.colors.yellow, gui="underline,italic", sp=M.colors.yellow, }, -- SpellCap       xxx ctermbg=12 gui=underline,italic guifg=#ebcb8b guisp=#ebcb8b
    SpellRare                              { fg=M.colors.magenta, gui="underline,italic", sp=M.colors.magenta, }, -- SpellRare      xxx ctermbg=13 gui=underline,italic guifg=#b988b0 guisp=#b988b0
    SpellLocal                             { fg=M.colors.cyan, gui="underline,italic", sp=M.colors.cyan, }, -- SpellLocal     xxx ctermbg=14 gui=underline,italic guifg=#88c0d0 guisp=#88c0d0
    Pmenu                                  { fg=M.colors.foreground, bg="#3b4252", }, -- Pmenu          xxx ctermfg=0 ctermbg=13 guifg=#c8d0e0 guibg=#3b4252
    PmenuSel                               { bg="#4c566a", }, -- PmenuSel       xxx ctermfg=242 ctermbg=0 guibg=#4c566a
    PmenuSbar                              { bg="#3b4252", }, -- PmenuSbar      xxx ctermbg=248 guibg=#3b4252
    PmenuThumb                             { bg=M.colors.foreground, }, -- PmenuThumb     xxx ctermbg=15 guibg=#c8d0e0
    TabLine                                { fg=M.colors.gray, bg=M.colors.background, }, -- TabLine        xxx cterm=underline ctermfg=15 ctermbg=242 guifg=#6c7a96 guibg=#353b49
    TabLineSel                             { fg=M.colors.cyan, bg=M.colors.background, }, -- TabLineSel     xxx cterm=bold guifg=#88c0d0 guibg=#2e3440
    TabLineFill                            { fg=M.colors.gray, bg=M.colors.background, }, -- TabLineFill    xxx cterm=reverse guifg=#6c7a96 guibg=#353b49
    CursorColumn                           { bg="#3b4252", }, -- CursorColumn   xxx ctermbg=242 guibg=#3b4252
    CursorLine                             { bg=M.colors.background, }, -- CursorLine     xxx cterm=underline guibg=#353b49
    ColorColumn                            { bg="#3b4252", }, -- ColorColumn    xxx ctermbg=1 guibg=#3b4252
    QuickFixLine                           { bg="#3b4252", gui="bold,italic", }, -- QuickFixLine   xxx gui=bold,italic guibg=#3b4252
    Whitespace                             { fg=M.colors.br_black, }, -- Whitespace     xxx guifg=#646a76
    NormalNC                               { bg=M.colors.background, }, -- NormalNC       xxx guibg=#2e3440
    NormalFloat                            { fg=M.colors.foreground, bg="bg", }, -- NormalFloat    xxx guifg=#c8d0e0 guibg=#353b49
    FloatBorder                            { fg=M.colors.br_blue, bg="bg", }, -- FloatBorder    xxx guifg=#81a1c1 guibg=#353b49
    RedrawDebugNormal                      { gui="reverse", }, -- RedrawDebugNormal xxx cterm=reverse gui=reverse
    RedrawDebugClear                       { bg="yellow", }, -- RedrawDebugClear xxx ctermbg=11 guibg=yellow
    RedrawDebugComposed                    { bg="green", }, -- RedrawDebugComposed xxx ctermbg=10 guibg=green
    RedrawDebugRecompose                   { bg="red", }, -- RedrawDebugRecompose xxx ctermbg=9 guibg=red
    Cursor                                 { fg=M.colors.foreground, gui="reverse", }, -- Cursor         xxx gui=reverse guifg=#c8d0e0
    lCursor                                { fg="bg", bg="fg", }, -- lCursor        xxx guifg=bg guibg=fg
    Normal                                 { fg=M.colors.foreground, bg=M.colors.background, }, -- Normal         xxx guifg=#c8d0e0 guibg=#2e3440
    NvimSpacing                            { Normal }, -- NvimSpacing    xxx links to Normal
    NotifyERRORBody                        { Normal }, -- NotifyERRORBody xxx links to Normal
    NotifyWARNBody                         { Normal }, -- NotifyWARNBody xxx links to Normal
    NotifyINFOBody                         { Normal }, -- NotifyINFOBody xxx links to Normal
    NotifyDEBUGBody                        { Normal }, -- NotifyDEBUGBody xxx links to Normal
    NotifyTRACEBody                        { Normal }, -- NotifyTRACEBody xxx links to Normal
    TelescopeResultsFileIcon               { Normal }, -- TelescopeResultsFileIcon xxx links to Normal
    FloatShadow                            { bg="black", blend="80", }, -- FloatShadow    xxx guibg=black blend=80
    FloatShadowThrough                     { bg="black", blend="100", }, -- FloatShadowThrough xxx guibg=black blend=100
    Error                                  { fg=M.colors.red, gui="bold,underline", }, -- Error          xxx ctermfg=15 ctermbg=9 gui=bold,underline guifg=#bf616a
    NvimInvalid                            { Error }, -- NvimInvalid    xxx links to Error
    luaBraceError                          { Error }, -- luaBraceError  xxx links to Error
    luaError                               { Error }, -- luaError       xxx links to Error
    luaParenError                          { Error }, -- luaParenError  xxx links to Error
    Todo                                   { fg=M.colors.yellow, gui="bold,italic", }, -- Todo           xxx ctermfg=0 ctermbg=11 gui=bold,italic guifg=#ebcb8b
    TSTodo                                 { Todo }, -- TSTodo         xxx links to Todo
    luaTodo                                { Todo }, -- luaTodo        xxx links to Todo
    String                                 { fg=M.colors.green, }, -- String         xxx guifg=#a3be8c
    NvimString                             { String }, -- NvimString     xxx links to String
    luaString2                             { String }, -- luaString2     xxx links to String
    luaString                              { String }, -- luaString      xxx links to String
    TelescopePreviewSize                   { String }, -- TelescopePreviewSize xxx links to String
    TelescopePreviewExecute                { String }, -- TelescopePreviewExecute xxx links to String
    Constant                               { fg=M.colors.br_blue, }, -- Constant       xxx ctermfg=13 guifg=#81a1c1
    luaConstant                            { Constant }, -- luaConstant    xxx links to Constant
    TelescopeResultsConstant               { Constant }, -- TelescopeResultsConstant xxx links to Constant
    TelescopePreviewGroup                  { Constant }, -- TelescopePreviewGroup xxx links to Constant
    TelescopePreviewUser                   { Constant }, -- TelescopePreviewUser xxx links to Constant
    TelescopePreviewRead                   { Constant }, -- TelescopePreviewRead xxx links to Constant
    TelescopePreviewBlock                  { Constant }, -- TelescopePreviewBlock xxx links to Constant
    TelescopePreviewCharDev                { Constant }, -- TelescopePreviewCharDev xxx links to Constant
    TelescopePreviewPipe                   { Constant }, -- TelescopePreviewPipe xxx links to Constant
    Character                              { fg=M.colors.green, }, -- Character      xxx guifg=#a3be8c
    Number                                 { fg=M.colors.orange, }, -- Number         xxx guifg=#d08f70
    NvimNumber                             { Number }, -- NvimNumber     xxx links to Number
    luaNumber                              { Number }, -- luaNumber      xxx links to Number
    TelescopeResultsNumber                 { Number }, -- TelescopeResultsNumber xxx links to Number
    Boolean                                { fg=M.colors.orange, }, -- Boolean        xxx guifg=#d08f70
    Float                                  { fg=M.colors.orange, }, -- Float          xxx guifg=#d08f70
    Function                               { fg=M.colors.br_blue, gui="italic", }, -- Function       xxx gui=italic guifg=#81a1c1
    luaFunction                            { Function }, -- luaFunction    xxx links to Function
    TelescopeResultsFunction               { Function }, -- TelescopeResultsFunction xxx links to Function
    TelescopeResultsField                  { Function }, -- TelescopeResultsField xxx links to Function
    TelescopeResultsClass                  { Function }, -- TelescopeResultsClass xxx links to Function
    Identifier                             { fg=M.colors.foreground, gui="bold", }, -- Identifier     xxx cterm=bold ctermfg=14 gui=bold guifg=#c8d0e0
    NvimIdentifier                         { Identifier }, -- NvimIdentifier xxx links to Identifier
    luaFunc                                { Identifier }, -- luaFunc        xxx links to Identifier
    TelescopeMultiIcon                     { Identifier }, -- TelescopeMultiIcon xxx links to Identifier
    TelescopeResultsIdentifier             { Identifier }, -- TelescopeResultsIdentifier xxx links to Identifier
    Conditional                            { fg=M.colors.magenta, }, -- Conditional    xxx guifg=#b988b0
    luaCond                                { Conditional }, -- luaCond        xxx links to Conditional
    luaElse                                { Conditional }, -- luaElse        xxx links to Conditional
    Statement                              { fg=M.colors.magenta, }, -- Statement      xxx ctermfg=11 guifg=#b988b0
    luaStatement                           { Statement }, -- luaStatement   xxx links to Statement
    TelescopePreviewWrite                  { Statement }, -- TelescopePreviewWrite xxx links to Statement
    TelescopePreviewSocket                 { Statement }, -- TelescopePreviewSocket xxx links to Statement
    Repeat                                 { fg=M.colors.magenta, }, -- Repeat         xxx guifg=#b988b0
    luaRepeat                              { Repeat }, -- luaRepeat      xxx links to Repeat
    luaFor                                 { Repeat }, -- luaFor         xxx links to Repeat
    Label                                  { fg=M.colors.magenta, }, -- Label          xxx guifg=#b988b0
    luaLabel                               { Label }, -- luaLabel       xxx links to Label
    Operator                               { fg=M.colors.magenta, }, -- Operator       xxx guifg=#b988b0
    NvimAssignment                         { Operator }, -- NvimAssignment xxx links to Operator
    NvimOperator                           { Operator }, -- NvimOperator   xxx links to Operator
    luaIn                                  { Operator }, -- luaIn          xxx links to Operator
    luaOperator                            { Operator }, -- luaOperator    xxx links to Operator
    TelescopeResultsOperator               { Operator }, -- TelescopeResultsOperator xxx links to Operator
    Keyword                                { fg=M.colors.magenta, }, -- Keyword        xxx guifg=#b988b0
    TelescopePreviewSticky                 { Keyword }, -- TelescopePreviewSticky xxx links to Keyword
    Exception                              { fg=M.colors.magenta, }, -- Exception      xxx guifg=#b988b0
    Include                                { fg=M.colors.br_blue, }, -- Include        xxx guifg=#81a1c1
    PreProc                                { fg=M.colors.magenta, }, -- PreProc        xxx ctermfg=81 guifg=#b988b0
    TSPreProc                              { PreProc }, -- TSPreProc      xxx links to PreProc
    TSAnnotation                           { PreProc }, -- TSAnnotation   xxx links to PreProc
    Define                                 { fg=M.colors.red, }, -- Define         xxx guifg=#d57780
    TSDefine                               { Define }, -- TSDefine       xxx links to Define
    Macro                                  { fg=M.colors.br_red, }, -- Macro          xxx guifg=#d57780
    PreCondit                              { fg=M.colors.magenta, }, -- PreCondit      xxx guifg=#b988b0
    StorageClass                           { fg=M.colors.magenta, }, -- StorageClass   xxx guifg=#b988b0
    TSStorageClass                         { StorageClass }, -- TSStorageClass xxx links to StorageClass
    Type                                   { fg=M.colors.yellow, }, -- Type           xxx ctermfg=121 guifg=#ebcb8b
    NvimNumberPrefix                       { Type }, -- NvimNumberPrefix xxx links to Type
    NvimOptionSigil                        { Type }, -- NvimOptionSigil xxx links to Type
    TSTypeQualifier                        { Type }, -- TSTypeQualifier xxx links to Type
    TelescopeMultiSelection                { Type }, -- TelescopeMultiSelection xxx links to Type
    Structure                              { fg=M.colors.magenta, }, -- Structure      xxx guifg=#b988b0
    luaTable                               { Structure }, -- luaTable       xxx links to Structure
    Typedef                                { fg=M.colors.magenta, }, -- Typedef        xxx guifg=#b988b0
    TSTypeDefinition                       { Typedef }, -- TSTypeDefinition xxx links to Typedef
    Tag                                    { fg=M.colors.green, }, -- Tag            xxx guifg=#a3be8c
    Special                                { fg=M.colors.br_red, }, -- Special        xxx ctermfg=224 guifg=#de878f
    NotifyLogTitle                         { Special }, -- NotifyLogTitle xxx links to Special
    TelescopePreviewLink                   { Special }, -- TelescopePreviewLink xxx links to Special
    SpecialChar                            { fg=M.colors.br_red, }, -- SpecialChar    xxx guifg=#de878f
    NvimRegister                           { SpecialChar }, -- NvimRegister   xxx links to SpecialChar
    NvimStringSpecial                      { SpecialChar }, -- NvimStringSpecial xxx links to SpecialChar
    TSCharacterSpecial                     { SpecialChar }, -- TSCharacterSpecial xxx links to SpecialChar
    TSStringSpecial                        { SpecialChar }, -- TSStringSpecial xxx links to SpecialChar
    luaSpecial                             { SpecialChar }, -- luaSpecial     xxx links to SpecialChar
    TelescopeResultsVariable               { SpecialChar }, -- TelescopeResultsVariable xxx links to SpecialChar
    Delimiter                              { fg=M.colors.blue, }, -- Delimiter      xxx guifg=#5e81ac
    NvimParenthesis                        { Delimiter }, -- NvimParenthesis xxx links to Delimiter
    NvimColon                              { Delimiter }, -- NvimColon      xxx links to Delimiter
    NvimComma                              { Delimiter }, -- NvimComma      xxx links to Delimiter
    NvimArrow                              { Delimiter }, -- NvimArrow      xxx links to Delimiter
    SpecialComment                         { fg=M.colors.gray, }, -- SpecialComment xxx guifg=#6c7a96
    TelescopeResultsSpecialComment         { SpecialComment }, -- TelescopeResultsSpecialComment xxx links to SpecialComment
    Debug                                  { fg=M.colors.yellow, }, -- Debug          xxx guifg=#ebcb8b
    TSDebug                                { Debug }, -- TSDebug        xxx links to Debug
    DiagnosticError                        { fg=M.colors.red, }, -- DiagnosticError xxx ctermfg=1 guifg=#bf616a
    DiagnosticWarn                         { }, -- DiagnosticWarn xxx ctermfg=3
    DiagnosticInfo                         { }, -- DiagnosticInfo xxx ctermfg=4
    DiagnosticHint                         { fg=M.colors.magenta, }, -- DiagnosticHint xxx ctermfg=7 guifg=#b988b0
    DiagnosticUnderlineError               { sp="red", }, -- DiagnosticUnderlineError xxx cterm=underline guisp=red
    DiagnosticUnderlineWarn                { sp="orange", }, -- DiagnosticUnderlineWarn xxx cterm=underline guisp=orange
    DiagnosticUnderlineInfo                { sp="lightblue", }, -- DiagnosticUnderlineInfo xxx cterm=underline guisp=lightblue
    DiagnosticUnderlineHint                { sp="lightgrey", }, -- DiagnosticUnderlineHint xxx cterm=underline guisp=lightgrey
    MatchParen                             { fg=M.colors.yellow, gui="bold", }, -- MatchParen     xxx ctermbg=6 gui=bold guifg=#ebcb8b
    Comment                                { fg=M.colors.gray, gui="italic", }, -- Comment        xxx ctermfg=14 gui=italic guifg=#6c7a96
    NotifyLogTime                          { Comment }, -- NotifyLogTime  xxx links to Comment
    luaComment                             { Comment }, -- luaComment     xxx links to Comment
    WhichKeyValue                          { Comment }, -- WhichKeyValue  xxx links to Comment
    TelescopeResultsComment                { Comment }, -- TelescopeResultsComment xxx links to Comment
    Underlined                             { fg=M.colors.green, gui="underline", }, -- Underlined     xxx cterm=underline ctermfg=81 gui=underline guifg=#a3be8c
    Ignore                                 { fg=M.colors.cyan, bg=M.colors.background, gui="bold", }, -- Ignore         xxx ctermfg=0 gui=bold guifg=#88c0d0 guibg=#2e3440
    NvimInternalError                      { fg="red", bg="red", }, -- NvimInternalError xxx ctermfg=9 ctermbg=9 guifg=red guibg=red
    NvimFigureBrace                        { NvimInternalError }, -- NvimFigureBrace xxx links to NvimInternalError
    NvimSingleQuotedUnknownEscape          { NvimInternalError }, -- NvimSingleQuotedUnknownEscape xxx links to NvimInternalError
    NvimInvalidSingleQuotedUnknownEscape   { NvimInternalError }, -- NvimInvalidSingleQuotedUnknownEscape xxx links to NvimInternalError
    GitSignsDelete                         { fg=M.colors.br_red, }, -- GitSignsDelete xxx guifg=#d57780
    GitSignsChange                         { fg=M.colors.blue, }, -- GitSignsChange xxx guifg=#5e81ac
    GitSignsAdd                            { fg=M.colors.green, }, -- GitSignsAdd    xxx guifg=#a3be8c
    WilderAccent                           { fg=M.colors.br_blue, bg="#3b4252", }, -- WilderAccent   xxx ctermfg=0 ctermbg=13 guifg=#81a1c1 guibg=#3b4252
    WilderPopupMenuSelectedAccent          { bg=M.colors.background, gui="bold,underline", }, -- WilderPopupMenuSelectedAccent xxx cterm=bold,underline ctermfg=242 ctermbg=0 gui=bold,underline guibg=#4c566a
    NotifyERRORBorder                      { fg=M.colors.red, }, -- NotifyERRORBorder xxx guifg=#bf616a
    NotifyWARNBorder                       { fg=M.colors.orange, }, -- NotifyWARNBorder xxx guifg=#d08f70
    NotifyINFOBorder                       { fg=M.colors.green, }, -- NotifyINFOBorder xxx guifg=#a3be8c
    NotifyDEBUGBorder                      { fg=M.colors.gray, }, -- NotifyDEBUGBorder xxx guifg=#6c7a96
    NotifyTRACEBorder                      { fg=M.colors.magenta, }, -- NotifyTRACEBorder xxx guifg=#b988b0
    NotifyERRORIcon                        { fg=M.colors.red, }, -- NotifyERRORIcon xxx guifg=#bf616a
    NotifyWARNIcon                         { fg=M.colors.orange, }, -- NotifyWARNIcon xxx guifg=#d08f70
    NotifyINFOIcon                         { fg=M.colors.green, }, -- NotifyINFOIcon xxx guifg=#a3be8c
    NotifyDEBUGIcon                        { fg=M.colors.gray, }, -- NotifyDEBUGIcon xxx guifg=#6c7a96
    NotifyTRACEIcon                        { fg=M.colors.magenta, }, -- NotifyTRACEIcon xxx guifg=#b988b0
    NotifyERRORTitle                       { fg=M.colors.red, }, -- NotifyERRORTitle xxx guifg=#bf616a
    NotifyWARNTitle                        { fg=M.colors.orange, }, -- NotifyWARNTitle xxx guifg=#d08f70
    NotifyINFOTitle                        { fg=M.colors.green, }, -- NotifyINFOTitle xxx guifg=#a3be8c
    NotifyDEBUGTitle                       { fg=M.colors.gray, }, -- NotifyDEBUGTitle xxx guifg=#6c7a96
    NotifyTRACETitle                       { fg=M.colors.magenta, }, -- NotifyTRACETitle xxx guifg=#b988b0
    LspSagaDiagnosticBorder                { fg=M.colors.br_black, }, -- LspSagaDiagnosticBorder xxx guifg=#646a76
    DiagnosticInformation                  { fg=M.colors.green, }, -- DiagnosticInformation xxx guifg=#a3be8c
    DiagnosticWarning                      { fg=M.colors.orange, }, -- DiagnosticWarning xxx guifg=#d08f70
    LspFloatWinBorder                      { fg=M.colors.magenta, }, -- LspFloatWinBorder xxx guifg=#b988b0
    LspDiagnosticsFloatingError            { fg=M.colors.red, }, -- LspDiagnosticsFloatingError xxx guifg=#bf616a
    DiagnosticFloatingError                { LspDiagnosticsFloatingError }, -- DiagnosticFloatingError xxx links to LspDiagnosticsFloatingError
    LspDiagnosticsUnderlineError           { gui="underline", sp=M.colors.red, }, -- LspDiagnosticsUnderlineError xxx gui=underline guisp=#bf616a
    LspDiagnosticsVirtualTextError         { fg=M.colors.red, }, -- LspDiagnosticsVirtualTextError xxx guifg=#bf616a
    DiagnosticVirtualTextError             { LspDiagnosticsVirtualTextError }, -- DiagnosticVirtualTextError xxx links to LspDiagnosticsVirtualTextError
    LspDiagnosticsSignWarning              { fg=M.colors.orange, }, -- LspDiagnosticsSignWarning xxx guifg=#d08f70
    DiagnosticSignWarn                     { LspDiagnosticsSignWarning }, -- DiagnosticSignWarn xxx links to LspDiagnosticsSignWarning
    LspDiagnosticsFloatingWarning          { fg=M.colors.orange, }, -- LspDiagnosticsFloatingWarning xxx guifg=#d08f70
    DiagnosticFloatingWarn                 { LspDiagnosticsFloatingWarning }, -- DiagnosticFloatingWarn xxx links to LspDiagnosticsFloatingWarning
    LspDiagnosticsUnderlineWarning         { gui="underline", sp=M.colors.orange, }, -- LspDiagnosticsUnderlineWarning xxx gui=underline guisp=#d08f70
    LspDiagnosticsVirtualTextWarning       { fg=M.colors.orange, }, -- LspDiagnosticsVirtualTextWarning xxx guifg=#d08f70
    DiagnosticVirtualTextWarn              { LspDiagnosticsVirtualTextWarning }, -- DiagnosticVirtualTextWarn xxx links to LspDiagnosticsVirtualTextWarning
    LspDiagnosticsDefaultHint              { fg=M.colors.magenta, }, -- LspDiagnosticsDefaultHint xxx guifg=#b988b0
    LspDiagnosticsDefaultInformation       { fg=M.colors.green, }, -- LspDiagnosticsDefaultInformation xxx guifg=#a3be8c
    LspDiagnosticsDefaultWarning           { fg=M.colors.orange, }, -- LspDiagnosticsDefaultWarning xxx guifg=#d08f70
    LspDiagnosticsDefaultError             { fg=M.colors.red, }, -- LspDiagnosticsDefaultError xxx guifg=#bf616a
    LspCodeLens                            { fg=M.colors.gray, }, -- LspCodeLens    xxx guifg=#6c7a96
    LspSignatureActiveParameter            { bg="#434c5e", gui="bold", }, -- LspSignatureActiveParameter xxx gui=bold guibg=#434c5e
    LspDiagnosticsSignHint                 { fg=M.colors.magenta, }, -- LspDiagnosticsSignHint xxx guifg=#b988b0
    DiagnosticSignHint                     { LspDiagnosticsSignHint }, -- DiagnosticSignHint xxx links to LspDiagnosticsSignHint
    LspReferenceWrite                      { gui="underline", sp=M.colors.yellow, }, -- LspReferenceWrite xxx gui=underline guisp=#ebcb8b
    LspReferenceRead                       { gui="underline", sp=M.colors.yellow, }, -- LspReferenceRead xxx gui=underline guisp=#ebcb8b
    LspDiagnosticsUnderlineHint            { gui="underline", sp=M.colors.magenta, }, -- LspDiagnosticsUnderlineHint xxx gui=underline guisp=#b988b0
    LightspeedOneCharMatch                 { fg=M.colors.yellow, gui="bold,reverse", }, -- LightspeedOneCharMatch xxx gui=bold,reverse guifg=#ebcb8b
    LspDiagnosticsVirtualTextHint          { fg=M.colors.magenta, }, -- LspDiagnosticsVirtualTextHint xxx guifg=#b988b0
    DiagnosticVirtualTextHint              { LspDiagnosticsVirtualTextHint }, -- DiagnosticVirtualTextHint xxx links to LspDiagnosticsVirtualTextHint
    LightspeedUnlabeledMatch               { fg="#e5e9f0", gui="bold", }, -- LightspeedUnlabeledMatch xxx gui=bold guifg=#e5e9f0
    LightspeedGreyWash                     { fg=M.colors.br_black, }, -- LightspeedGreyWash xxx guifg=#646a76
    LightspeedMaskedChar                   { fg=M.colors.magenta, }, -- LightspeedMaskedChar xxx guifg=#b48ead
    LightspeedShortcut                     { fg="#e5e9f0", bg="#e85b7a", gui="bold,underline", }, -- LightspeedShortcut xxx gui=bold,underline guifg=#e5e9f0 guibg=#e85b7a
    LightspeedLabelDistantOverlapped       { fg=M.colors.br_blue, gui="underline", }, -- LightspeedLabelDistantOverlapped xxx gui=underline guifg=#81a1c1
    LightspeedLabelDistant                 { fg=M.colors.cyan, gui="bold,underline", }, -- LightspeedLabelDistant xxx gui=bold,underline guifg=#88c0d0
    LightspeedLabelOverlapped              { fg="#e44675", gui="underline", }, -- LightspeedLabelOverlapped xxx gui=underline guifg=#e44675
    LightspeedLabel                        { fg="#e85b7a", gui="bold,underline", }, -- LightspeedLabel xxx gui=bold,underline guifg=#e85b7a
    FernBranchText                         { fg=M.colors.br_blue, }, -- FernBranchText xxx guifg=#81a1c1
    HopUnmatched                           { fg=M.colors.gray, }, -- HopUnmatched   xxx guifg=#6c7a96
    HopNextKey2                            { fg=M.colors.magenta, }, -- HopNextKey2    xxx guifg=#b988b0
    HopNextKey1                            { fg=M.colors.cyan, gui="bold", }, -- HopNextKey1    xxx gui=bold guifg=#88c0d0
    HopNextKey                             { fg="#e5e9f0", gui="bold", }, -- HopNextKey     xxx gui=bold guifg=#e5e9f0
    illuminatedCurWord                     { bg="#3f4758", }, -- illuminatedCurWord xxx guibg=#3f4758
    illuminatedWord                        { bg="#3f4758", }, -- illuminatedWord xxx guibg=#3f4758
    DapStopped                             { fg=M.colors.green, }, -- DapStopped     xxx guifg=#a3be8c
    DapBreakpoint                          { fg=M.colors.br_red, }, -- DapBreakpoint  xxx guifg=#d57780
    IndentBlanklineContextChar             { fg=M.colors.magenta, gui="nocombine", }, -- IndentBlanklineContextChar xxx gui=nocombine guifg=#b988b0
    IndentBlanklineChar                    { fg=M.colors.background, gui="nocombine", }, -- IndentBlanklineChar xxx gui=nocombine guifg=#4c566a
    SneakScope                             { bg=M.colors.background, }, -- SneakScope     xxx guibg=#4c566a
    Sneak                                  { fg=M.colors.background, bg=M.colors.foreground, }, -- Sneak          xxx guifg=#2e3440 guibg=#c8d0e0
    BufferInactiveTarget                   { fg=M.colors.br_red, bg=M.colors.background, gui="bold", }, -- BufferInactiveTarget xxx gui=bold guifg=#d57780 guibg=#353b49
    BufferInactiveSign                     { fg=M.colors.gray, bg=M.colors.background, }, -- BufferInactiveSign xxx guifg=#6c7a96 guibg=#353b49
    BufferInactiveMod                      { fg=M.colors.yellow, bg=M.colors.background, }, -- BufferInactiveMod xxx guifg=#ebcb8b guibg=#353b49
    BufferInactiveIndex                    { fg=M.colors.gray, bg=M.colors.background, }, -- BufferInactiveIndex xxx guifg=#6c7a96 guibg=#353b49
    BufferInactive                         { fg=M.colors.gray, bg=M.colors.background, }, -- BufferInactive xxx guifg=#6c7a96 guibg=#353b49
    BufferVisibleTarget                    { fg=M.colors.br_red, bg=M.colors.background, gui="bold", }, -- BufferVisibleTarget xxx gui=bold guifg=#d57780 guibg=#2e3440
    BufferVisibleSign                      { fg=M.colors.gray, bg=M.colors.background, }, -- BufferVisibleSign xxx guifg=#6c7a96 guibg=#2e3440
    BufferVisibleMod                       { fg=M.colors.yellow, bg=M.colors.background, gui="bold", }, -- BufferVisibleMod xxx gui=bold guifg=#ebcb8b guibg=#2e3440
    BufferVisibleIndex                     { fg=M.colors.foreground, bg=M.colors.background, }, -- BufferVisibleIndex xxx guifg=#c8d0e0 guibg=#2e3440
    BufferVisible                          { fg=M.colors.foreground, bg=M.colors.background, }, -- BufferVisible  xxx guifg=#c8d0e0 guibg=#2e3440
    BufferCurrentTarget                    { fg=M.colors.br_red, bg=M.colors.background, gui="bold", }, -- BufferCurrentTarget xxx gui=bold guifg=#d57780 guibg=#2e3440
    BufferCurrentSign                      { fg=M.colors.cyan, bg=M.colors.background, }, -- BufferCurrentSign xxx guifg=#88c0d0 guibg=#2e3440
    BufferCurrentMod                       { fg=M.colors.yellow, bg=M.colors.background, gui="bold", }, -- BufferCurrentMod xxx gui=bold guifg=#ebcb8b guibg=#2e3440
    BufferCurrentIndex                     { fg=M.colors.foreground, bg=M.colors.background, }, -- BufferCurrentIndex xxx guifg=#c8d0e0 guibg=#2e3440
    BufferCurrent                          { fg=M.colors.foreground, bg=M.colors.background, }, -- BufferCurrent  xxx guifg=#c8d0e0 guibg=#2e3440
    LspDiagnosticsSignInformation          { fg=M.colors.green, }, -- LspDiagnosticsSignInformation xxx guifg=#a3be8c
    DiagnosticSignInfo                     { LspDiagnosticsSignInformation }, -- DiagnosticSignInfo xxx links to LspDiagnosticsSignInformation
    LspDiagnosticsFloatingInformation      { fg=M.colors.green, }, -- LspDiagnosticsFloatingInformation xxx guifg=#a3be8c
    DiagnosticFloatingInfo                 { LspDiagnosticsFloatingInformation }, -- DiagnosticFloatingInfo xxx links to LspDiagnosticsFloatingInformation
    LspDiagnosticsUnderlineInformation     { gui="underline", sp=M.colors.green, }, -- LspDiagnosticsUnderlineInformation xxx gui=underline guisp=#a3be8c
    LspDiagnosticsVirtualTextInformation   { fg=M.colors.green, }, -- LspDiagnosticsVirtualTextInformation xxx guifg=#a3be8c
    DiagnosticVirtualTextInfo              { LspDiagnosticsVirtualTextInformation }, -- DiagnosticVirtualTextInfo xxx links to LspDiagnosticsVirtualTextInformation
    LspDiagnosticsSignError                { fg=M.colors.red, }, -- LspDiagnosticsSignError xxx guifg=#bf616a
    DiagnosticSignError                    { LspDiagnosticsSignError }, -- DiagnosticSignError xxx links to LspDiagnosticsSignError
    qfLineNr                               { fg=M.colors.magenta, }, -- qfLineNr       xxx guifg=#b988b0
    htmlH5                                 { fg=M.colors.magenta, gui="bold", }, -- htmlH5         xxx gui=bold guifg=#b988b0
    markdownBlockquote                     { fg=M.colors.gray, }, -- markdownBlockquote xxx guifg=#6c7a96
    markdownBold                           { fg=M.colors.magenta, gui="bold", }, -- markdownBold   xxx gui=bold guifg=#b988b0
    markdownCode                           { fg=M.colors.green, }, -- markdownCode   xxx guifg=#a3be8c
    markdownCodeBlock                      { fg=M.colors.green, }, -- markdownCodeBlock xxx guifg=#a3be8c
    markdownCodeDelimiter                  { fg=M.colors.green, }, -- markdownCodeDelimiter xxx guifg=#a3be8c
    markdownH1                             { fg=M.colors.blue, gui="bold", }, -- markdownH1     xxx gui=bold guifg=#5e81ac
    markdownH2                             { fg=M.colors.br_blue, gui="bold", }, -- markdownH2     xxx gui=bold guifg=#81a1c1
    markdownH3                             { fg=M.colors.cyan, gui="bold", }, -- markdownH3     xxx gui=bold guifg=#88c0d0
    markdownH4                             { fg=M.colors.cyan, }, -- markdownH4     xxx guifg=#8fbcbb
    markdownH5                             { fg=M.colors.cyan, }, -- markdownH5     xxx guifg=#8fbcbb
    markdownH6                             { fg=M.colors.cyan, }, -- markdownH6     xxx guifg=#8fbcbb
    markdownH1Delimiter                    { fg=M.colors.blue, }, -- markdownH1Delimiter xxx guifg=#5e81ac
    markdownH2Delimiter                    { fg=M.colors.br_blue, }, -- markdownH2Delimiter xxx guifg=#81a1c1
    TSEnvironment                          { fg=M.colors.foreground, }, -- TSEnvironment  xxx guifg=#c8d0e0
    TSParameter                            { fg=M.colors.br_red, }, -- TSParameter    xxx guifg=#d57780
    luaTSParameter                         { TSParameter }, -- luaTSParameter xxx links to TSParameter
    TSAttribute                            { fg=M.colors.magenta, }, -- TSAttribute    xxx guifg=#b988b0
    TSBoolean                              { fg=M.colors.orange, }, -- TSBoolean      xxx guifg=#d08f70
    luaTSBoolean                           { TSBoolean }, -- luaTSBoolean   xxx links to TSBoolean
    TSCharacter                            { fg=M.colors.green, }, -- TSCharacter    xxx guifg=#a3be8c
    TSComment                              { fg=M.colors.gray, gui="italic", }, -- TSComment      xxx gui=italic guifg=#6c7a96
    luaTSComment                           { TSComment }, -- luaTSComment   xxx links to TSComment
    TSConditional                          { fg=M.colors.magenta, }, -- TSConditional  xxx guifg=#b988b0
    TSConstant                             { fg=M.colors.cyan, }, -- TSConstant     xxx guifg=#88c0d0
    TSConstBuiltin                         { fg=M.colors.orange, }, -- TSConstBuiltin xxx guifg=#d08f70
    TSConstMacro                           { fg=M.colors.br_red, }, -- TSConstMacro   xxx guifg=#d57780
    CmpItemKindTypeParameter               { fg=M.colors.yellow, }, -- CmpItemKindTypeParameter xxx guifg=#ebcb8b
    TSConstructor                          { fg=M.colors.yellow, }, -- TSConstructor  xxx guifg=#ebcb8b
    luaTSConstructor                       { TSConstructor }, -- luaTSConstructor xxx links to TSConstructor
    TSError                                { fg=M.colors.red, }, -- TSError        xxx guifg=#bf616a
    TSException                            { fg=M.colors.magenta, }, -- TSException    xxx guifg=#b988b0
    TSField                                { fg=M.colors.br_blue, }, -- TSField        xxx guifg=#81a1c1
    luaTSField                             { TSField }, -- luaTSField     xxx links to TSField
    TSFloat                                { fg=M.colors.orange, }, -- TSFloat        xxx guifg=#d08f70
    TSFunction                             { fg=M.colors.br_blue, gui="italic", }, -- TSFunction     xxx gui=italic guifg=#81a1c1
    luaTSFunction                          { TSFunction }, -- luaTSFunction  xxx links to TSFunction
    TSFuncBuiltin                          { fg=M.colors.cyan, gui="italic", }, -- TSFuncBuiltin  xxx gui=italic guifg=#88c0d0
    luaTSFuncBuiltin                       { TSFuncBuiltin }, -- luaTSFuncBuiltin xxx links to TSFuncBuiltin
    TSFuncMacro                            { fg=M.colors.br_blue, }, -- TSFuncMacro    xxx guifg=#81a1c1
    TSInclude                              { fg=M.colors.br_blue, }, -- TSInclude      xxx guifg=#81a1c1
    TSKeyword                              { fg=M.colors.magenta, }, -- TSKeyword      xxx guifg=#b988b0
    luaTSKeyword                           { TSKeyword }, -- luaTSKeyword   xxx links to TSKeyword
    TSKeywordFunction                      { fg=M.colors.magenta, }, -- TSKeywordFunction xxx guifg=#b988b0
    luaTSKeywordFunction                   { TSKeywordFunction }, -- luaTSKeywordFunction xxx links to TSKeywordFunction
    LspDiagnosticsFloatingHint             { fg=M.colors.magenta, }, -- LspDiagnosticsFloatingHint xxx guifg=#b988b0
    DiagnosticFloatingHint                 { LspDiagnosticsFloatingHint }, -- DiagnosticFloatingHint xxx links to LspDiagnosticsFloatingHint
    NvimTreeFolderIcon                     { fg=M.colors.blue, }, -- NvimTreeFolderIcon xxx guifg=#5e81ac
    NvimTreeFolderName                     { fg=M.colors.br_blue, }, -- NvimTreeFolderName xxx guifg=#81a1c1
    NvimTreeRootFolder                     { fg=M.colors.green, gui="bold", }, -- NvimTreeRootFolder xxx gui=bold guifg=#a3be8c
    NvimTreeSymlink                        { fg=M.colors.cyan, gui="bold", }, -- NvimTreeSymlink xxx gui=bold guifg=#88c0d0
    TelescopeSelection                     { fg=M.colors.cyan, }, -- TelescopeSelection xxx guifg=#88c0d0
    TelescopePreviewBorder                 { fg=M.colors.br_blue, }, -- TelescopePreviewBorder xxx guifg=#81a1c1
    TelescopePromptBorder                  { fg=M.colors.br_blue, }, -- TelescopePromptBorder xxx guifg=#81a1c1
    markdownUrl                            { fg=M.colors.cyan, gui="underline", }, -- markdownUrl    xxx gui=underline guifg=#88c0d0
    markdownRule                           { fg=M.colors.magenta, }, -- markdownRule   xxx guifg=#b988b0
    markdownOrderedListMarker              { fg=M.colors.br_red, }, -- markdownOrderedListMarker xxx guifg=#d57780
    markdownListMarker                     { fg=M.colors.br_red, }, -- markdownListMarker xxx guifg=#d57780
    markdownLinkText                       { fg=M.colors.magenta, }, -- markdownLinkText xxx guifg=#b988b0
    markdownItalic                         { fg=M.colors.yellow, gui="italic", }, -- markdownItalic xxx gui=italic guifg=#ebcb8b
    markdownLinkDelimiter                  { fg=M.colors.gray, }, -- markdownLinkDelimiter xxx guifg=#6c7a96
    markdownIdDelimiter                    { fg=M.colors.gray, }, -- markdownIdDelimiter xxx guifg=#6c7a96
    markdownIdDeclaration                  { fg=M.colors.magenta, }, -- markdownIdDeclaration xxx guifg=#b988b0
    markdownId                             { fg=M.colors.yellow, }, -- markdownId     xxx guifg=#ebcb8b
    markdownH6Delimiter                    { fg=M.colors.cyan, }, -- markdownH6Delimiter xxx guifg=#8fbcbb
    markdownH5Delimiter                    { fg=M.colors.cyan, }, -- markdownH5Delimiter xxx guifg=#8fbcbb
    markdownH4Delimiter                    { fg=M.colors.cyan, }, -- markdownH4Delimiter xxx guifg=#8fbcbb
    markdownH3Delimiter                    { fg=M.colors.cyan, }, -- markdownH3Delimiter xxx guifg=#88c0d0
    NvimTreeVertSplit                      { fg=M.colors.background, bg=M.colors.background, }, -- NvimTreeVertSplit xxx guifg=#353b49 guibg=#353b49
    NvimTreeCursorLine                     { bg="#3b4252", }, -- NvimTreeCursorLine xxx guibg=#3b4252
    NvimTreeNormal                         { fg=M.colors.foreground, bg=M.colors.background, }, -- NvimTreeNormal xxx guifg=#c8d0e0 guibg=#353b49
    NvimTreeImageFile                      { fg=M.colors.magenta, gui="bold", }, -- NvimTreeImageFile xxx gui=bold guifg=#b988b0
    NvimTreeSpecialFile                    { fg=M.colors.orange, gui="underline", }, -- NvimTreeSpecialFile xxx gui=underline guifg=#d08f70
    NvimTreeExecFile                       { fg=M.colors.green, gui="bold", }, -- NvimTreeExecFile xxx gui=bold guifg=#a3be8c
    NvimTreeGitDeleted                     { fg=M.colors.br_red, }, -- NvimTreeGitDeleted xxx guifg=#d57780
    NvimTreeGitStaged                      { fg=M.colors.magenta, }, -- NvimTreeGitStaged xxx guifg=#b988b0
    NvimTreeGitNew                         { fg=M.colors.green, }, -- NvimTreeGitNew xxx guifg=#a3be8c
    NvimTreeGitDirty                       { fg=M.colors.yellow, }, -- NvimTreeGitDirty xxx guifg=#ebcb8b
    NvimTreeIndentMarker                   { fg=M.colors.br_blue, }, -- NvimTreeIndentMarker xxx guifg=#81a1c1
    NvimTreeOpenedFolderName               { fg=M.colors.yellow, gui="italic", }, -- NvimTreeOpenedFolderName xxx gui=italic guifg=#ebcb8b
    NvimTreeEmptyFolderName                { fg=M.colors.gray, }, -- NvimTreeEmptyFolderName xxx guifg=#6c7a96
    htmlH4                                 { fg=M.colors.yellow, gui="bold", }, -- htmlH4         xxx gui=bold guifg=#ebcb8b
    htmlH3                                 { fg=M.colors.green, gui="bold", }, -- htmlH3         xxx gui=bold guifg=#a3be8c
    htmlH2                                 { fg=M.colors.br_red, gui="bold", }, -- htmlH2         xxx gui=bold guifg=#d57780
    htmlH1                                 { fg=M.colors.cyan, gui="bold", }, -- htmlH1         xxx gui=bold guifg=#88c0d0
    htmlLink                               { fg=M.colors.green, gui="underline", }, -- htmlLink       xxx gui=underline guifg=#a3be8c
    TelescopePromptPrefix                  { fg=M.colors.magenta, }, -- TelescopePromptPrefix xxx guifg=#b988b0
    diffLine                               { fg=M.colors.gray, }, -- diffLine       xxx guifg=#6c7a96
    diffNewFile                            { fg=M.colors.orange, }, -- diffNewFile    xxx guifg=#d08f70
    DashboardFooter                        { fg=M.colors.green, gui="italic", }, -- DashboardFooter xxx gui=italic guifg=#a3be8c
    DashboardCenter                        { fg=M.colors.magenta, }, -- DashboardCenter xxx guifg=#b988b0
    DashboardHeader                        { fg=M.colors.br_blue, }, -- DashboardHeader xxx guifg=#81a1c1
    DashboardShortCut                      { fg=M.colors.cyan, }, -- DashboardShortCut xxx guifg=#88c0d0
    healthWarning                          { fg=M.colors.orange, }, -- healthWarning  xxx guifg=#d08f70
    healthSuccess                          { fg=M.colors.green, }, -- healthSuccess  xxx guifg=#a3be8c
    healthError                            { fg=M.colors.red, }, -- healthError    xxx guifg=#bf616a
    Warnings                               { fg=M.colors.orange, }, -- Warnings       xxx guifg=#d08f70
    CommandMode                            { fg=M.colors.yellow, gui="reverse", }, -- CommandMode    xxx gui=reverse guifg=#ebcb8b
    VisualMode                             { fg=M.colors.magenta, gui="reverse", }, -- VisualMode     xxx gui=reverse guifg=#b988b0
    ReplacelMode                           { fg=M.colors.br_red, gui="reverse", }, -- ReplacelMode   xxx gui=reverse guifg=#d57780
    InsertMode                             { fg=M.colors.green, gui="reverse", }, -- InsertMode     xxx gui=reverse guifg=#a3be8c
    NormalMode                             { fg=M.colors.cyan, gui="reverse", }, -- NormalMode     xxx gui=reverse guifg=#88c0d0
    VisualNOS                              { bg="#3f4758", }, -- VisualNOS      xxx guibg=#3f4758
    StatusLineTermNC                       { fg=M.colors.gray, bg=M.colors.background, }, -- StatusLineTermNC xxx guifg=#6c7a96 guibg=#353b49
    StatusLineTerm                         { fg=M.colors.foreground, bg=M.colors.background, }, -- StatusLineTerm xxx guifg=#c8d0e0 guibg=#353b49
    CmpItemKindEnum                        { fg=M.colors.yellow, }, -- CmpItemKindEnum xxx guifg=#ebcb8b
    CmpItemKindProperty                    { fg=M.colors.br_blue, }, -- CmpItemKindProperty xxx guifg=#81a1c1
    CmpItemKindModule                      { fg=M.colors.br_blue, }, -- CmpItemKindModule xxx guifg=#81a1c1
    CmpItemKindInterface                   { fg=M.colors.yellow, }, -- CmpItemKindInterface xxx guifg=#ebcb8b
    CmpItemKindClass                       { fg=M.colors.yellow, }, -- CmpItemKindClass xxx guifg=#ebcb8b
    CmpItemKindField                       { fg=M.colors.br_blue, }, -- CmpItemKindField xxx guifg=#81a1c1
    CmpItemKindConstructor                 { fg=M.colors.yellow, }, -- CmpItemKindConstructor xxx guifg=#ebcb8b
    CmpItemKindFunction                    { fg=M.colors.br_blue, }, -- CmpItemKindFunction xxx guifg=#81a1c1
    CmpItemKindMethod                      { fg=M.colors.br_blue, }, -- CmpItemKindMethod xxx guifg=#81a1c1
    CmpItemKindText                        { fg=M.colors.orange, }, -- CmpItemKindText xxx guifg=#d08f70
    CmpItemMenu                            { fg=M.colors.gray, }, -- CmpItemMenu    xxx guifg=#6c7a96
    CmpItemAbbrMatchFuzzy                  { fg=M.colors.br_blue, }, -- CmpItemAbbrMatchFuzzy xxx guifg=#81a1c1
    CmpItemAbbrMatch                       { fg=M.colors.br_blue, gui="bold", }, -- CmpItemAbbrMatch xxx gui=bold guifg=#81a1c1
    CmpItemAbbrDeprecated                  { fg=M.colors.foreground, }, -- CmpItemAbbrDeprecated xxx guifg=#c8d0e0
    CmpItemAbbr                            { fg=M.colors.foreground, }, -- CmpItemAbbr    xxx guifg=#c8d0e0
    CursorIM                               { fg=M.colors.foreground, gui="reverse", }, -- CursorIM       xxx gui=reverse guifg=#c8d0e0
    TSVariableBuiltin                      { fg=M.colors.br_red, gui="bold", }, -- TSVariableBuiltin xxx gui=bold guifg=#d57780
    TSVariable                             { fg=M.colors.foreground, gui="bold", }, -- TSVariable     xxx gui=bold guifg=#c8d0e0
    luaTSVariable                          { TSVariable }, -- luaTSVariable  xxx links to TSVariable
    TSTypeBuiltin                          { fg=M.colors.orange, }, -- TSTypeBuiltin  xxx guifg=#d08f70
    TSType                                 { fg=M.colors.yellow, }, -- TSType         xxx guifg=#ebcb8b
    TSDanger                               { fg=M.colors.red, gui="bold", }, -- TSDanger       xxx gui=bold guifg=#bf616a
    TSWarning                              { fg=M.colors.orange, gui="bold", }, -- TSWarning      xxx gui=bold guifg=#d08f70
    TSNote                                 { fg=M.colors.green, gui="bold", }, -- TSNote         xxx gui=bold guifg=#a3be8c
    TSEnvironmentName                      { fg=M.colors.foreground, }, -- TSEnvironmentName xxx guifg=#c8d0e0
    TSTextReference                        { fg=M.colors.magenta, }, -- TSTextReference xxx guifg=#b988b0
    TSMath                                 { fg=M.colors.foreground, }, -- TSMath         xxx guifg=#c8d0e0
    TSURI                                  { fg=M.colors.cyan, gui="underline", }, -- TSURI          xxx gui=underline guifg=#88c0d0
    TSLiteral                              { fg=M.colors.green, }, -- TSLiteral      xxx guifg=#a3be8c
    TSTitle                                { fg=M.colors.br_blue, gui="bold", }, -- TSTitle        xxx gui=bold guifg=#81a1c1
    TSUnderline                            { gui="underline", }, -- TSUnderline    xxx cterm=underline gui=underline
    TSEmphasis                             { fg=M.colors.yellow, gui="italic", }, -- TSEmphasis     xxx gui=italic guifg=#ebcb8b
    TSStrong                               { fg=M.colors.magenta, gui="bold", }, -- TSStrong       xxx gui=bold guifg=#b988b0
    TSText                                 { fg=M.colors.foreground, }, -- TSText         xxx guifg=#c8d0e0
    TSTagDelimiter                         { fg=M.colors.blue, }, -- TSTagDelimiter xxx guifg=#5e81ac
    TSTagAttribute                         { fg=M.colors.br_blue, }, -- TSTagAttribute xxx guifg=#81a1c1
    TSTag                                  { fg=M.colors.yellow, }, -- TSTag          xxx guifg=#ebcb8b
    TSSymbol                               { fg=M.colors.cyan, }, -- TSSymbol       xxx guifg=#88c0d0
    TSStringRegex                          { fg=M.colors.orange, }, -- TSStringRegex  xxx guifg=#d08f70
    TSString                               { fg=M.colors.green, }, -- TSString       xxx guifg=#a3be8c
    luaTSString                            { TSString }, -- luaTSString    xxx links to TSString
    TSRepeat                               { fg=M.colors.magenta, }, -- TSRepeat       xxx guifg=#b988b0
    TSPunctSpecial                         { fg=M.colors.blue, }, -- TSPunctSpecial xxx guifg=#5e81ac
    TSPunctBracket                         { fg=M.colors.blue, }, -- TSPunctBracket xxx guifg=#5e81ac
    luaTSPunctBracket                      { TSPunctBracket }, -- luaTSPunctBracket xxx links to TSPunctBracket
    TSPunctDelimiter                       { fg=M.colors.blue, }, -- TSPunctDelimiter xxx guifg=#5e81ac
    luaTSPunctDelimiter                    { TSPunctDelimiter }, -- luaTSPunctDelimiter xxx links to TSPunctDelimiter
    TSProperty                             { fg=M.colors.br_blue, }, -- TSProperty     xxx guifg=#81a1c1
    TSParameterReference                   { fg=M.colors.br_red, }, -- TSParameterReference xxx guifg=#d57780
    TSOperator                             { fg=M.colors.magenta, }, -- TSOperator     xxx guifg=#b988b0
    luaTSOperator                          { TSOperator }, -- luaTSOperator  xxx links to TSOperator
    TSNumber                               { fg=M.colors.orange, }, -- TSNumber       xxx guifg=#d08f70
    luaTSNumber                            { TSNumber }, -- luaTSNumber    xxx links to TSNumber
    TSNamespace                            { fg=M.colors.yellow, }, -- TSNamespace    xxx guifg=#ebcb8b
    TSMethod                               { fg=M.colors.br_blue, gui="italic", }, -- TSMethod       xxx gui=italic guifg=#81a1c1
    luaTSMethod                            { TSMethod }, -- luaTSMethod    xxx links to TSMethod
    TSLabel                                { fg=M.colors.magenta, }, -- TSLabel        xxx guifg=#b988b0
    TSKeywordReturn                        { fg=M.colors.magenta, }, -- TSKeywordReturn xxx guifg=#b988b0
    TSKeywordOperator                      { fg=M.colors.magenta, }, -- TSKeywordOperator xxx guifg=#b988b0
    GitGutterDelete                        { fg=M.colors.br_red, }, -- GitGutterDelete xxx guifg=#d57780
    TroubleCount                           { fg=M.colors.magenta, }, -- TroubleCount   xxx guifg=#b988b0
    GitGutterChange                        { fg=M.colors.blue, }, -- GitGutterChange xxx guifg=#5e81ac
    GitGutterAdd                           { fg=M.colors.green, }, -- GitGutterAdd   xxx guifg=#a3be8c
    NeogitNotificationError                { fg=M.colors.red, }, -- NeogitNotificationError xxx guifg=#bf616a
    NeogitNotificationWarning              { fg=M.colors.orange, }, -- NeogitNotificationWarning xxx guifg=#d08f70
    NeogitNotificationInfo                 { fg=M.colors.green, }, -- NeogitNotificationInfo xxx guifg=#a3be8c
    NeogitDiffAddHighlight                 { fg=M.colors.green, bg="#394e3d", }, -- NeogitDiffAddHighlight xxx guifg=#a3be8c guibg=#394e3d
    NeogitDiffDeleteHighlight              { fg=M.colors.br_red, bg="#4d2b2e", }, -- NeogitDiffDeleteHighlight xxx guifg=#d57780 guibg=#4d2b2e
    NeogitDiffContextHighlight             { bg=M.colors.background, }, -- NeogitDiffContextHighlight xxx guibg=#353b49
    NeogitHunkHeaderHighlight              { fg=M.colors.yellow, bg="#3f4758", }, -- NeogitHunkHeaderHighlight xxx guifg=#ebcb8b guibg=#3f4758
    NeogitHunkHeader                       { fg=M.colors.foreground, bg="#3f4758", }, -- NeogitHunkHeader xxx guifg=#c8d0e0 guibg=#3f4758
    NeogitRemote                           { fg=M.colors.orange, }, -- NeogitRemote   xxx guifg=#d08f70
    NeogitBranch                           { fg=M.colors.magenta, }, -- NeogitBranch   xxx guifg=#b988b0
    diffIndexLine                          { fg=M.colors.magenta, }, -- diffIndexLine  xxx guifg=#b988b0
    diffFile                               { fg=M.colors.br_blue, }, -- diffFile       xxx guifg=#81a1c1
    diffOldFile                            { fg=M.colors.yellow, }, -- diffOldFile    xxx guifg=#ebcb8b
    diffChanged                            { fg=M.colors.blue, }, -- diffChanged    xxx guifg=#5e81ac
    diffRemoved                            { fg=M.colors.br_red, }, -- diffRemoved    xxx guifg=#d57780
    diffAdded                              { fg=M.colors.green, }, -- diffAdded      xxx guifg=#a3be8c
    TroubleText                            { fg=M.colors.foreground, }, -- TroubleText    xxx guifg=#c8d0e0
    TroubleNormal                          { fg=M.colors.foreground, }, -- TroubleNormal  xxx guifg=#c8d0e0
    WhichKey                               { fg=M.colors.magenta, gui="bold", bg="bg" }, -- WhichKey       xxx gui=bold guifg=#b988b0
    WhichKeyGroup                          { fg=M.colors.cyan, bg="bg" }, -- WhichKeyGroup  xxx guifg=#88c0d0
    WhichKeyDesc                           { fg=M.colors.br_blue, gui="italic", }, -- WhichKeyDesc   xxx gui=italic guifg=#81a1c1
    WhichKeySeperator                      { fg=M.colors.green, bg="bg" }, -- WhichKeySeperator xxx guifg=#a3be8c
    WhichKeySeparator                      { WhichKeySeperator }, -- WhichKeySeparator xxx links to WhichKeySeperator
    WhichKeyFloat                          { bg="bg" }, -- WhichKeyFloat  xxx guibg=#353b49
    LspFloatWinNormal                      { fg=M.colors.foreground, bg=M.colors.background, }, -- LspFloatWinNormal xxx guifg=#c8d0e0 guibg=#2e3440
    LspDiagnosticsHint                     { fg=M.colors.magenta, }, -- LspDiagnosticsHint xxx guifg=#b988b0
    LspDiagnosticsInformation              { fg=M.colors.green, }, -- LspDiagnosticsInformation xxx guifg=#a3be8c
    LspDiagnosticsWarning                  { fg=M.colors.orange, }, -- LspDiagnosticsWarning xxx guifg=#d08f70
    LspReferenceText                       { gui="underline", sp=M.colors.yellow, }, -- LspReferenceText xxx gui=underline guisp=#ebcb8b
    CmpItemKindValue                       { fg=M.colors.orange, }, -- CmpItemKindValue xxx guifg=#d08f70
    CmpItemKindKeyword                     { fg=M.colors.magenta, }, -- CmpItemKindKeyword xxx guifg=#b988b0
    GitSignsChangeNr                       { fg=M.colors.blue, }, -- GitSignsChangeNr xxx guifg=#5e81ac
    GitSignsChangeLn                       { fg=M.colors.blue, }, -- GitSignsChangeLn xxx guifg=#5e81ac
    GitSignsChangeVirtLn                   { GitSignsChangeLn }, -- GitSignsChangeVirtLn xxx links to GitSignsChangeLn
    GitSignsDeleteNr                       { fg=M.colors.br_red, }, -- GitSignsDeleteNr xxx guifg=#d57780
    CmpItemKindSnippet                     { fg=M.colors.green, }, -- CmpItemKindSnippet xxx guifg=#a3be8c
    CmpItemKindFile                        { fg=M.colors.br_blue, }, -- CmpItemKindFile xxx guifg=#81a1c1
    CmpItemKindEnumMember                  { fg=M.colors.cyan, }, -- CmpItemKindEnumMember xxx guifg=#88c0d0
    CmpItemKindConstant                    { fg=M.colors.orange, }, -- CmpItemKindConstant xxx guifg=#d08f70
    CmpItemKindStruct                      { fg=M.colors.yellow, }, -- CmpItemKindStruct xxx guifg=#ebcb8b
    LspDiagnosticsError                    { fg=M.colors.red, }, -- LspDiagnosticsError xxx guifg=#bf616a
    BufferLineFill                         { bg=M.colors.background, }, -- BufferLineFill xxx guibg=#2e3440
    BufferLineIndicatorSelected            { fg=M.colors.yellow, }, -- BufferLineIndicatorSelected xxx guifg=#ebcb8b
    TargetWord                             { fg=M.colors.cyan, }, -- TargetWord     xxx guifg=#88c0d0
    ReferencesIcon                         { fg=M.colors.br_blue, }, -- ReferencesIcon xxx guifg=#81a1c1
    DefinitionIcon                         { fg=M.colors.br_blue, }, -- DefinitionIcon xxx guifg=#81a1c1
    DefinitionPreviewTitle                 { fg=M.colors.green, }, -- DefinitionPreviewTitle xxx guifg=#a3be8c
    DefinitionCount                        { fg=M.colors.magenta, }, -- DefinitionCount xxx guifg=#b988b0
    ReferencesCount                        { fg=M.colors.magenta, }, -- ReferencesCount xxx guifg=#b988b0
    LspSagaAutoPreview                     { fg=M.colors.br_red, }, -- LspSagaAutoPreview xxx guifg=#d57780
    LspSagaFinderSelection                 { fg=M.colors.green, }, -- LspSagaFinderSelection xxx guifg=#a3be8c
    LspSagaSignatureHelpBorder             { fg=M.colors.red, }, -- LspSagaSignatureHelpBorder xxx guifg=#de878f
    LspSagaCodeActionTruncateLine          { fg="#3f4758", }, -- LspSagaCodeActionTruncateLine xxx guifg=#3f4758
    LspSagaCodeActionBorder                { fg=M.colors.br_blue, }, -- LspSagaCodeActionBorder xxx guifg=#81a1c1
    LspSagaCodeActionContent               { fg=M.colors.magenta, }, -- LspSagaCodeActionContent xxx guifg=#b988b0
    LspSagaCodeActionTitle                 { fg=M.colors.br_blue, }, -- LspSagaCodeActionTitle xxx guifg=#81a1c1
    LspSagaDefPreviewBorder                { fg=M.colors.green, }, -- LspSagaDefPreviewBorder xxx guifg=#a3be8c
    LspSagaRenameBorder                    { fg=M.colors.green, }, -- LspSagaRenameBorder xxx guifg=#a3be8c
    LspSagaHoverBorder                     { fg=M.colors.br_blue, }, -- LspSagaHoverBorder xxx guifg=#81a1c1
    LspSagaBorderTitle                     { fg=M.colors.cyan, }, -- LspSagaBorderTitle xxx guifg=#88c0d0
    LineDiagTruncateLine                   { fg="#3f4758", }, -- LineDiagTruncateLine xxx guifg=#3f4758
    LspSagaDocTruncateLine                 { fg="#3f4758", }, -- LspSagaDocTruncateLine xxx guifg=#3f4758
    LspSagaShTruncateLine                  { fg="#3f4758", }, -- LspSagaShTruncateLine xxx guifg=#3f4758
    ProviderTruncateLine                   { fg="#3f4758", }, -- ProviderTruncateLine xxx guifg=#3f4758
    LspSagaDiagnosticTruncateLine          { fg="#3f4758", }, -- LspSagaDiagnosticTruncateLine xxx guifg=#3f4758
    LspSagaDiagnosticHeader                { fg=M.colors.br_blue, }, -- LspSagaDiagnosticHeader xxx guifg=#81a1c1
    lualine_a_inactive                     { fg=M.colors.gray, bg="none", gui="bold", }, -- lualine_a_inactive xxx gui=bold guifg=#6c7a96 guibg=none
    lualine_c_inactive                     { fg=M.colors.gray, bg=M.colors.background, }, -- lualine_c_inactive xxx guifg=#6c7a96 guibg=#353b49
    lualine_b_inactive                     { fg=M.colors.gray, bg="none", }, -- lualine_b_inactive xxx guifg=#6c7a96 guibg=none
    lualine_a_command                      { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_a_command xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_b_command                      { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_b_command xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_a_visual                       { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_a_visual xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_b_visual                       { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_b_visual xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_a_normal                       { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_a_normal xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_c_normal                       { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_c_normal xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_b_normal                       { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_b_normal xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_a_insert                       { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_a_insert xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_b_insert                       { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_b_insert xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_a_replace                      { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_a_replace xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_b_replace                      { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_b_replace xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_b_diff_added_normal            { fg=M.colors.green, bg=M.colors.foreground, }, -- lualine_b_diff_added_normal xxx guifg=#a3be8c guibg=#c8d0e0
    lualine_b_diff_added_insert            { fg=M.colors.green, bg=M.colors.foreground, }, -- lualine_b_diff_added_insert xxx guifg=#a3be8c guibg=#c8d0e0
    lualine_b_diff_added_visual            { fg=M.colors.green, bg=M.colors.foreground, }, -- lualine_b_diff_added_visual xxx guifg=#a3be8c guibg=#c8d0e0
    lualine_b_diff_added_replace           { fg=M.colors.green, bg=M.colors.foreground, }, -- lualine_b_diff_added_replace xxx guifg=#a3be8c guibg=#c8d0e0
    lualine_b_diff_added_command           { fg=M.colors.green, bg=M.colors.foreground, }, -- lualine_b_diff_added_command xxx guifg=#a3be8c guibg=#c8d0e0
    lualine_b_diff_added_terminal          { fg=M.colors.green, bg=M.colors.foreground, }, -- lualine_b_diff_added_terminal xxx guifg=#a3be8c guibg=#c8d0e0
    lualine_b_diff_added_inactive          { fg=M.colors.green, bg=M.colors.foreground, }, -- lualine_b_diff_added_inactive xxx guifg=#a3be8c guibg=#c8d0e0
    lualine_b_diff_modified_normal         { fg=M.colors.blue, bg=M.colors.foreground, }, -- lualine_b_diff_modified_normal xxx guifg=#5e81ac guibg=#c8d0e0
    lualine_b_diff_modified_insert         { fg=M.colors.blue, bg=M.colors.foreground, }, -- lualine_b_diff_modified_insert xxx guifg=#5e81ac guibg=#c8d0e0
    lualine_b_diff_modified_visual         { fg=M.colors.blue, bg=M.colors.foreground, }, -- lualine_b_diff_modified_visual xxx guifg=#5e81ac guibg=#c8d0e0
    lualine_b_diff_modified_replace        { fg=M.colors.blue, bg=M.colors.foreground, }, -- lualine_b_diff_modified_replace xxx guifg=#5e81ac guibg=#c8d0e0
    lualine_b_diff_modified_command        { fg=M.colors.blue, bg=M.colors.foreground, }, -- lualine_b_diff_modified_command xxx guifg=#5e81ac guibg=#c8d0e0
    lualine_b_diff_modified_terminal       { fg=M.colors.blue, bg=M.colors.foreground, }, -- lualine_b_diff_modified_terminal xxx guifg=#5e81ac guibg=#c8d0e0
    lualine_b_diff_modified_inactive       { fg=M.colors.blue, bg=M.colors.foreground, }, -- lualine_b_diff_modified_inactive xxx guifg=#5e81ac guibg=#c8d0e0
    lualine_b_diff_removed_normal          { fg=M.colors.br_red, bg=M.colors.foreground, }, -- lualine_b_diff_removed_normal xxx guifg=#d57780 guibg=#c8d0e0
    lualine_b_diff_removed_insert          { fg=M.colors.br_red, bg=M.colors.foreground, }, -- lualine_b_diff_removed_insert xxx guifg=#d57780 guibg=#c8d0e0
    lualine_b_diff_removed_visual          { fg=M.colors.br_red, bg=M.colors.foreground, }, -- lualine_b_diff_removed_visual xxx guifg=#d57780 guibg=#c8d0e0
    lualine_b_diff_removed_replace         { fg=M.colors.br_red, bg=M.colors.foreground, }, -- lualine_b_diff_removed_replace xxx guifg=#d57780 guibg=#c8d0e0
    lualine_b_diff_removed_command         { fg=M.colors.br_red, bg=M.colors.foreground, }, -- lualine_b_diff_removed_command xxx guifg=#d57780 guibg=#c8d0e0
    lualine_b_diff_removed_terminal        { fg=M.colors.br_red, bg=M.colors.foreground, }, -- lualine_b_diff_removed_terminal xxx guifg=#d57780 guibg=#c8d0e0
    lualine_b_diff_removed_inactive        { fg=M.colors.br_red, bg=M.colors.foreground, }, -- lualine_b_diff_removed_inactive xxx guifg=#d57780 guibg=#c8d0e0
    lualine_b_diagnostics_error_normal     { fg=M.colors.red, bg=M.colors.foreground, }, -- lualine_b_diagnostics_error_normal xxx guifg=#bf616a guibg=#c8d0e0
    lualine_b_diagnostics_error_insert     { fg=M.colors.red, bg=M.colors.foreground, }, -- lualine_b_diagnostics_error_insert xxx guifg=#bf616a guibg=#c8d0e0
    lualine_b_diagnostics_error_visual     { fg=M.colors.red, bg=M.colors.foreground, }, -- lualine_b_diagnostics_error_visual xxx guifg=#bf616a guibg=#c8d0e0
    lualine_b_diagnostics_error_replace    { fg=M.colors.red, bg=M.colors.foreground, }, -- lualine_b_diagnostics_error_replace xxx guifg=#bf616a guibg=#c8d0e0
    lualine_b_diagnostics_error_command    { fg=M.colors.red, bg=M.colors.foreground, }, -- lualine_b_diagnostics_error_command xxx guifg=#bf616a guibg=#c8d0e0
    lualine_b_diagnostics_error_terminal   { fg=M.colors.red, bg=M.colors.foreground, }, -- lualine_b_diagnostics_error_terminal xxx guifg=#bf616a guibg=#c8d0e0
    lualine_b_diagnostics_error_inactive   { fg=M.colors.red, bg=M.colors.foreground, }, -- lualine_b_diagnostics_error_inactive xxx guifg=#bf616a guibg=#c8d0e0
    lualine_b_diagnostics_warn_normal      { fg=M.colors.orange, bg=M.colors.foreground, }, -- lualine_b_diagnostics_warn_normal xxx guifg=#d08f70 guibg=#c8d0e0
    lualine_b_diagnostics_warn_insert      { fg=M.colors.orange, bg=M.colors.foreground, }, -- lualine_b_diagnostics_warn_insert xxx guifg=#d08f70 guibg=#c8d0e0
    lualine_b_diagnostics_warn_inactive    { fg=M.colors.orange, bg=M.colors.foreground, }, -- lualine_b_diagnostics_warn_inactive xxx guifg=#d08f70 guibg=#c8d0e0
    lualine_b_diagnostics_info_insert      { fg=M.colors.green, bg=M.colors.foreground, }, -- lualine_b_diagnostics_info_insert xxx guifg=#a3be8c guibg=#c8d0e0
    lualine_b_diagnostics_info_visual      { fg=M.colors.green, bg=M.colors.foreground, }, -- lualine_b_diagnostics_info_visual xxx guifg=#a3be8c guibg=#c8d0e0
    lualine_b_diagnostics_info_replace     { fg=M.colors.green, bg=M.colors.foreground, }, -- lualine_b_diagnostics_info_replace xxx guifg=#a3be8c guibg=#c8d0e0
    lualine_b_diagnostics_info_command     { fg=M.colors.green, bg=M.colors.foreground, }, -- lualine_b_diagnostics_info_command xxx guifg=#a3be8c guibg=#c8d0e0
    lualine_b_diagnostics_info_terminal    { fg=M.colors.green, bg=M.colors.foreground, }, -- lualine_b_diagnostics_info_terminal xxx guifg=#a3be8c guibg=#c8d0e0
    lualine_b_diagnostics_info_inactive    { fg=M.colors.green, bg=M.colors.foreground, }, -- lualine_b_diagnostics_info_inactive xxx guifg=#a3be8c guibg=#c8d0e0
    lualine_b_diagnostics_hint_normal      { fg=M.colors.magenta, bg=M.colors.foreground, }, -- lualine_b_diagnostics_hint_normal xxx guifg=#b988b0 guibg=#c8d0e0
    lualine_b_diagnostics_hint_insert      { fg=M.colors.magenta, bg=M.colors.foreground, }, -- lualine_b_diagnostics_hint_insert xxx guifg=#b988b0 guibg=#c8d0e0
    lualine_b_diagnostics_hint_visual      { fg=M.colors.magenta, bg=M.colors.foreground, }, -- lualine_b_diagnostics_hint_visual xxx guifg=#b988b0 guibg=#c8d0e0
    lualine_b_diagnostics_hint_replace     { fg=M.colors.magenta, bg=M.colors.foreground, }, -- lualine_b_diagnostics_hint_replace xxx guifg=#b988b0 guibg=#c8d0e0
    lualine_b_diagnostics_hint_command     { fg=M.colors.magenta, bg=M.colors.foreground, }, -- lualine_b_diagnostics_hint_command xxx guifg=#b988b0 guibg=#c8d0e0
    lualine_b_diagnostics_hint_terminal    { fg=M.colors.magenta, bg=M.colors.foreground, }, -- lualine_b_diagnostics_hint_terminal xxx guifg=#b988b0 guibg=#c8d0e0
    lualine_b_diagnostics_hint_inactive    { fg=M.colors.magenta, bg=M.colors.foreground, }, -- lualine_b_diagnostics_hint_inactive xxx guifg=#b988b0 guibg=#c8d0e0
    CmpItemAbbrDefault                     { fg=M.colors.foreground, }, -- CmpItemAbbrDefault xxx guifg=#c8d0e0
    CmpItemAbbrDeprecatedDefault           { fg=M.colors.gray, }, -- CmpItemAbbrDeprecatedDefault xxx guifg=#6c7a96
    CmpItemAbbrMatchDefault                { fg=M.colors.foreground, }, -- CmpItemAbbrMatchDefault xxx guifg=#c8d0e0
    CmpItemAbbrMatchFuzzyDefault           { fg=M.colors.foreground, }, -- CmpItemAbbrMatchFuzzyDefault xxx guifg=#c8d0e0
    CmpItemKindDefault                     { fg=M.colors.red, }, -- CmpItemKindDefault xxx guifg=#de878f
    CmpItemKind                            { CmpItemKindDefault }, -- CmpItemKind    xxx links to CmpItemKindDefault
    CmpItemMenuDefault                     { fg=M.colors.foreground, }, -- CmpItemMenuDefault xxx guifg=#c8d0e0
    TSNone                                 { }, -- TSNone         xxx cterm= gui=
    TSStrike                               { gui="strikethrough", }, -- TSStrike       xxx cterm=strikethrough gui=strikethrough
    rainbowcol1                            { fg=M.colors.br_white, }, -- rainbowcol1    xxx guifg=#efefef
    rainbowcol2                            { fg=M.colors.br_yellow, }, -- rainbowcol2    xxx guifg=#ecbe7b
    rainbowcol3                            { fg=M.colors.br_magenta, }, -- rainbowcol3    xxx guifg=#de73ff
    rainbowcol4                            { fg=M.colors.br_cyan, }, -- rainbowcol4    xxx guifg=#46d9ff
    rainbowcol5                            { fg=M.colors.br_red, }, -- rainbowcol5    xxx guifg=#ff6c6b
    rainbowcol6                            { fg=M.colors.br_blue, }, -- rainbowcol6    xxx guifg=#51afef
    rainbowcol7                            { fg=M.colors.br_green, }, -- rainbowcol7    xxx guifg=#a5e075
    lualine_b_diagnostics_info_normal      { fg=M.colors.green, bg=M.colors.foreground, }, -- lualine_b_diagnostics_info_normal xxx guifg=#a3be8c guibg=#c8d0e0
    lualine_b_diagnostics_warn_terminal    { fg=M.colors.orange, bg=M.colors.foreground, }, -- lualine_b_diagnostics_warn_terminal xxx guifg=#d08f70 guibg=#c8d0e0
    lualine_b_diagnostics_warn_command     { fg=M.colors.orange, bg=M.colors.foreground, }, -- lualine_b_diagnostics_warn_command xxx guifg=#d08f70 guibg=#c8d0e0
    lualine_b_diagnostics_warn_replace     { fg=M.colors.orange, bg=M.colors.foreground, }, -- lualine_b_diagnostics_warn_replace xxx guifg=#d08f70 guibg=#c8d0e0
    lualine_b_diagnostics_warn_visual      { fg=M.colors.orange, bg=M.colors.foreground, }, -- lualine_b_diagnostics_warn_visual xxx guifg=#d08f70 guibg=#c8d0e0
    GitSignsDeleteLn                       { fg=M.colors.br_red, }, -- GitSignsDeleteLn xxx guifg=#d57780
    GitSignsDeleteVirtLn                   { GitSignsDeleteLn }, -- GitSignsDeleteVirtLn xxx links to GitSignsDeleteLn
    GitSignsAddLn                          { fg=M.colors.green, }, -- GitSignsAddLn  xxx guifg=#a3be8c
    GitSignsAddLnVirtLn                    { GitSignsAddLn }, -- GitSignsAddLnVirtLn xxx links to GitSignsAddLn
    GitSignsAddNr                          { fg=M.colors.green, }, -- GitSignsAddNr  xxx guifg=#a3be8c
    TelescopeNormal                        { fg=M.colors.foreground, bg=M.colors.background, }, -- TelescopeNormal xxx guifg=#c8d0e0 guibg=#2e3440
    TelescopePreviewNormal                 { TelescopeNormal }, -- TelescopePreviewNormal xxx links to TelescopeNormal
    TelescopeBorder                        { TelescopeNormal }, -- TelescopeBorder xxx links to TelescopeNormal
    TelescopeResultsNormal                 { TelescopeNormal }, -- TelescopeResultsNormal xxx links to TelescopeNormal
    TelescopePromptNormal                  { TelescopeNormal }, -- TelescopePromptNormal xxx links to TelescopeNormal
    TelescopeResultsBorder                 { fg=M.colors.br_blue, }, -- TelescopeResultsBorder xxx guifg=#81a1c1
    TSStringEscape                         { fg=M.colors.orange, }, -- TSStringEscape xxx guifg=#d08f70
    TelescopeMatching                      { fg=M.colors.yellow, gui="bold", }, -- TelescopeMatching xxx gui=bold guifg=#ebcb8b
    TelescopeSelectionCaret                { fg=M.colors.cyan, }, -- TelescopeSelectionCaret xxx guifg=#88c0d0
    lualine_z_terminal                     { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_z_terminal xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_a_terminal                     { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_a_terminal xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_b_terminal                     { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_b_terminal xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_c_terminal                     { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_c_terminal xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_y_terminal                     { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_y_terminal xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_x_terminal                     { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_x_terminal xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_z_visual                       { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_z_visual xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_c_visual                       { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_c_visual xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_y_visual                       { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_y_visual xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_x_visual                       { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_x_visual xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_z_replace                      { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_z_replace xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_c_replace                      { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_c_replace xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_y_replace                      { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_y_replace xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_x_replace                      { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_x_replace xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_z_normal                       { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_z_normal xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_y_normal                       { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_y_normal xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_x_normal                       { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_x_normal xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_z_insert                       { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_z_insert xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_c_insert                       { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_c_insert xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_y_insert                       { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_y_insert xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_x_insert                       { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_x_insert xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_z_command                      { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_z_command xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_c_command                      { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_c_command xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_y_command                      { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_y_command xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    lualine_x_command                      { fg=M.colors.background, bg=M.colors.foreground, gui="bold", }, -- lualine_x_command xxx gui=bold guifg=#2e3440 guibg=#c8d0e0
    DevIconPackedResource                  { fg="#6d8086", }, -- DevIconPackedResource xxx ctermfg=66 guifg=#6d8086
    DevIconFsx                             { fg="#519aba", }, -- DevIconFsx     xxx ctermfg=67 guifg=#519aba
    DevIconLicense                         { fg="#cbcb41", }, -- DevIconLicense xxx ctermfg=185 guifg=#cbcb41
    DevIconFsscript                        { fg="#519aba", }, -- DevIconFsscript xxx ctermfg=67 guifg=#519aba
    DevIconFsi                             { fg="#519aba", }, -- DevIconFsi     xxx ctermfg=67 guifg=#519aba
    DevIconOpenTypeFont                    { fg="#ececec", }, -- DevIconOpenTypeFont xxx ctermfg=231 guifg=#ECECEC
    DevIconOPUS                            { fg="#f88a02", }, -- DevIconOPUS    xxx ctermfg=208 guifg=#F88A02
    DevIconRmd                             { fg="#519aba", }, -- DevIconRmd     xxx ctermfg=67 guifg=#519aba
    DevIconMaterial                        { fg="#b83998", }, -- DevIconMaterial xxx ctermfg=132 guifg=#B83998
    DevIconDropbox                         { fg="#0061fe", }, -- DevIconDropbox xxx ctermfg=27 guifg=#0061FE
    DevIconDesktopEntry                    { fg="#563d7c", }, -- DevIconDesktopEntry xxx ctermfg=60 guifg=#563d7c
    DevIconMustache                        { fg="#e37933", }, -- DevIconMustache xxx ctermfg=173 guifg=#e37933
    DevIconMdx                             { fg="#519aba", }, -- DevIconMdx     xxx ctermfg=67 guifg=#519aba
    DevIconCsv                             { fg="#89e051", }, -- DevIconCsv     xxx ctermfg=113 guifg=#89e051
    DevIconProlog                          { fg="#e4b854", }, -- DevIconProlog  xxx ctermfg=179 guifg=#e4b854
    DevIconR                               { fg="#358a5b", }, -- DevIconR       xxx ctermfg=65 guifg=#358a5b
    DevIconGitConfig                       { fg="#41535b", }, -- DevIconGitConfig xxx ctermfg=59 guifg=#41535b
    DevIconCsh                             { fg="#4d5a5e", }, -- DevIconCsh     xxx ctermfg=59 guifg=#4d5a5e
    DevIconCrystal                         { fg="#000000", }, -- DevIconCrystal xxx ctermfg=16 guifg=#000000
    DevIconVimrc                           { fg="#019833", }, -- DevIconVimrc   xxx ctermfg=29 guifg=#019833
    DevIconGitCommit                       { fg="#41535b", }, -- DevIconGitCommit xxx ctermfg=59 guifg=#41535b
    DevIconCp                              { fg="#519aba", }, -- DevIconCp      xxx ctermfg=67 guifg=#519aba
    DevIconHaml                            { fg="#eaeae1", }, -- DevIconHaml    xxx ctermfg=188 guifg=#eaeae1
    DevIconRakefile                        { fg="#701516", }, -- DevIconRakefile xxx ctermfg=52 guifg=#701516
    DevIconCMakeLists                      { fg="#6d8086", }, -- DevIconCMakeLists xxx ctermfg=66 guifg=#6d8086
    DevIconNodeModules                     { fg="#e8274b", }, -- DevIconNodeModules xxx ctermfg=161 guifg=#E8274B
    DevIconZshrc                           { fg="#89e051", }, -- DevIconZshrc   xxx ctermfg=113 guifg=#89e051
    DevIconZshenv                          { fg="#89e051", }, -- DevIconZshenv  xxx ctermfg=113 guifg=#89e051
    DevIconEjs                             { fg="#cbcb41", }, -- DevIconEjs     xxx ctermfg=185 guifg=#cbcb41
    DevIconZshprofile                      { fg="#89e051", }, -- DevIconZshprofile xxx ctermfg=113 guifg=#89e051
    DevIconEdn                             { fg="#519aba", }, -- DevIconEdn     xxx ctermfg=67 guifg=#519aba
    DevIconSettingsJson                    { fg="#854cc7", }, -- DevIconSettingsJson xxx ctermfg=98 guifg=#854CC7
    DevIconNPMIgnore                       { fg="#e8274b", }, -- DevIconNPMIgnore xxx ctermfg=161 guifg=#E8274B
    DevIconZsh                             { fg="#89e051", }, -- DevIconZsh     xxx ctermfg=113 guifg=#89e051
    DevIconGvimrc                          { fg="#019833", }, -- DevIconGvimrc  xxx ctermfg=29 guifg=#019833
    DevIconGitModules                      { fg="#41535b", }, -- DevIconGitModules xxx ctermfg=59 guifg=#41535b
    DevIconGitlabCI                        { fg="#e24329", }, -- DevIconGitlabCI xxx ctermfg=166 guifg=#e24329
    DevIconDoc                             { fg="#185abd", }, -- DevIconDoc     xxx ctermfg=25 guifg=#185abd
    DevIconGitIgnore                       { fg="#41535b", }, -- DevIconGitIgnore xxx ctermfg=59 guifg=#41535b
    DevIconGitAttributes                   { fg="#41535b", }, -- DevIconGitAttributes xxx ctermfg=59 guifg=#41535b
    DevIconH                               { fg="#a074c4", }, -- DevIconH       xxx ctermfg=140 guifg=#a074c4
    DevIconDsStore                         { fg="#41535b", }, -- DevIconDsStore xxx ctermfg=59 guifg=#41535b
    DevIconBashrc                          { fg="#89e051", }, -- DevIconBashrc  xxx ctermfg=113 guifg=#89e051
    DevIconBashProfile                     { fg="#89e051", }, -- DevIconBashProfile xxx ctermfg=113 guifg=#89e051
    DevIconBabelrc                         { fg="#cbcb41", }, -- DevIconBabelrc xxx ctermfg=185 guifg=#cbcb41
    DevIconCMake                           { fg="#6d8086", }, -- DevIconCMake   xxx ctermfg=66 guifg=#6d8086
    DevIconTex                             { fg="#3d6117", }, -- DevIconTex     xxx ctermfg=58 guifg=#3D6117
    DevIconZig                             { fg="#f69a1b", }, -- DevIconZig     xxx ctermfg=208 guifg=#f69a1b
    DevIconDiff                            { fg="#41535b", }, -- DevIconDiff    xxx ctermfg=59 guifg=#41535b
    DevIconLhs                             { fg="#a074c4", }, -- DevIconLhs     xxx ctermfg=140 guifg=#a074c4
    DevIconSvelte                          { fg="#ff3e00", }, -- DevIconSvelte  xxx ctermfg=202 guifg=#ff3e00
    DevIconEx                              { fg="#a074c4", }, -- DevIconEx      xxx ctermfg=140 guifg=#a074c4
    DevIconScss                            { fg="#f55385", }, -- DevIconScss    xxx ctermfg=204 guifg=#f55385
    DevIconCss                             { fg="#563d7c", }, -- DevIconCss     xxx ctermfg=60 guifg=#563d7c
    DevIconHtml                            { fg="#e34c26", }, -- DevIconHtml    xxx ctermfg=166 guifg=#e34c26
    DevIconXml                             { fg="#e37933", }, -- DevIconXml     xxx ctermfg=173 guifg=#e37933
    DevIconJson                            { fg="#cbcb41", }, -- DevIconJson    xxx ctermfg=185 guifg=#cbcb41
    DevIconVim                             { fg="#019833", }, -- DevIconVim     xxx ctermfg=29 guifg=#019833
    DevIconJava                            { fg="#cc3e44", }, -- DevIconJava    xxx ctermfg=167 guifg=#cc3e44
    DevIconSolidity                        { fg="#519aba", }, -- DevIconSolidity xxx ctermfg=67 guifg=#519aba
    DevIconConf                            { fg="#6d8086", }, -- DevIconConf    xxx ctermfg=66 guifg=#6d8086
    DevIconRb                              { fg="#701516", }, -- DevIconRb      xxx ctermfg=52 guifg=#701516
    DevIconTsx                             { fg="#519aba", }, -- DevIconTsx     xxx ctermfg=67 guifg=#519aba
    DevIconImportConfiguration             { fg="#ececec", }, -- DevIconImportConfiguration xxx ctermfg=231 guifg=#ECECEC
    DevIconLua                             { fg="#51a0cf", }, -- DevIconLua     xxx ctermfg=74 guifg=#51a0cf
    DevIconCs                              { fg="#596706", }, -- DevIconCs      xxx ctermfg=58 guifg=#596706
    DevIconAwk                             { fg="#4d5a5e", }, -- DevIconAwk     xxx ctermfg=59 guifg=#4d5a5e
    DevIconSwift                           { fg="#e37933", }, -- DevIconSwift   xxx ctermfg=173 guifg=#e37933
    DevIconDefault                         { fg="#6d8086", }, -- DevIconDefault xxx ctermfg=66 guifg=#6d8086
    DevIconCPlusPlus                       { fg="#f34b7d", }, -- DevIconCPlusPlus xxx ctermfg=204 guifg=#f34b7d
    DevIconHbs                             { fg="#f0772b", }, -- DevIconHbs     xxx ctermfg=208 guifg=#f0772b
    DevIconTs                              { fg="#519aba", }, -- DevIconTs      xxx ctermfg=67 guifg=#519aba
    DevIconRake                            { fg="#701516", }, -- DevIconRake    xxx ctermfg=52 guifg=#701516
    DevIconLess                            { fg="#563d7c", }, -- DevIconLess    xxx ctermfg=60 guifg=#563d7c
    DevIconWebmanifest                     { fg="#f1e05a", }, -- DevIconWebmanifest xxx ctermfg=221 guifg=#f1e05a
    DevIconKsh                             { fg="#4d5a5e", }, -- DevIconKsh     xxx ctermfg=59 guifg=#4d5a5e
    DevIconErb                             { fg="#701516", }, -- DevIconErb     xxx ctermfg=52 guifg=#701516
    DevIconGodotProject                    { fg="#6d8086", }, -- DevIconGodotProject xxx ctermfg=66 guifg=#6d8086
    DevIconPdf                             { fg="#b30b00", }, -- DevIconPdf     xxx ctermfg=124 guifg=#b30b00
    DevIconHeex                            { fg="#a074c4", }, -- DevIconHeex    xxx ctermfg=140 guifg=#a074c4
    DevIconGruntfile                       { fg="#e37933", }, -- DevIconGruntfile xxx ctermfg=173 guifg=#e37933
    DevIconEex                             { fg="#a074c4", }, -- DevIconEex     xxx ctermfg=140 guifg=#a074c4
    DevIconVagrantfile                     { fg="#1563ff", }, -- DevIconVagrantfile xxx ctermfg=27 guifg=#1563FF
    DevIconMarkdown                        { fg="#519aba", }, -- DevIconMarkdown xxx ctermfg=67 guifg=#519aba
    DevIconClojureDart                     { fg="#519aba", }, -- DevIconClojureDart xxx ctermfg=67 guifg=#519aba
    DevIconFs                              { fg="#519aba", }, -- DevIconFs      xxx ctermfg=67 guifg=#519aba
    DevIconPsb                             { fg="#519aba", }, -- DevIconPsb     xxx ctermfg=67 guifg=#519aba
    DevIconGDScript                        { fg="#6d8086", }, -- DevIconGDScript xxx ctermfg=66 guifg=#6d8086
    DevIconPsd                             { fg="#519aba", }, -- DevIconPsd     xxx ctermfg=67 guifg=#519aba
    DevIconRss                             { fg="#fb9d3b", }, -- DevIconRss     xxx ctermfg=215 guifg=#FB9D3B
    DevIconClojureJS                       { fg="#519aba", }, -- DevIconClojureJS xxx ctermfg=67 guifg=#519aba
    DevIconHh                              { fg="#a074c4", }, -- DevIconHh      xxx ctermfg=140 guifg=#a074c4
    DevIconTerminal                        { fg="#31b53e", }, -- DevIconTerminal xxx ctermfg=71 guifg=#31B53E
    DevIconPl                              { fg="#519aba", }, -- DevIconPl      xxx ctermfg=67 guifg=#519aba
    DevIconD                               { fg="#427819", }, -- DevIconD       xxx ctermfg=64 guifg=#427819
    DevIconTextResource                    { fg="#cbcb41", }, -- DevIconTextResource xxx ctermfg=185 guifg=#cbcb41
    DevIconTor                             { fg="#519aba", }, -- DevIconTor     xxx ctermfg=67 guifg=#519aba
    DevIconSql                             { fg="#dad8d8", }, -- DevIconSql     xxx ctermfg=188 guifg=#dad8d8
    DevIconCoffee                          { fg="#cbcb41", }, -- DevIconCoffee  xxx ctermfg=185 guifg=#cbcb41
    DevIconC                               { fg="#599eff", }, -- DevIconC       xxx ctermfg=75 guifg=#599eff
    DevIconSml                             { fg="#e37933", }, -- DevIconSml     xxx ctermfg=173 guifg=#e37933
    DevIconVue                             { fg="#8dc149", }, -- DevIconVue     xxx ctermfg=107 guifg=#8dc149
    DevIconSh                              { fg="#4d5a5e", }, -- DevIconSh      xxx ctermfg=59 guifg=#4d5a5e
    DevIconCobol                           { fg="#005ca5", }, -- DevIconCobol   xxx ctermfg=25 guifg=#005ca5
    DevIconYaml                            { fg="#6d8086", }, -- DevIconYaml    xxx ctermfg=66 guifg=#6d8086
    DevIconKotlinScript                    { fg="#f88a02", }, -- DevIconKotlinScript xxx ctermfg=208 guifg=#F88A02
    DevIconClojureC                        { fg="#8dc149", }, -- DevIconClojureC xxx ctermfg=107 guifg=#8dc149
    DevIconHtm                             { fg="#e34c26", }, -- DevIconHtm     xxx ctermfg=166 guifg=#e34c26
    DevIconXls                             { fg="#207245", }, -- DevIconXls     xxx ctermfg=23 guifg=#207245
    DevIconFish                            { fg="#4d5a5e", }, -- DevIconFish    xxx ctermfg=59 guifg=#4d5a5e
    DevIconDart                            { fg="#03589c", }, -- DevIconDart    xxx ctermfg=25 guifg=#03589C
    DevIconBash                            { fg="#89e051", }, -- DevIconBash    xxx ctermfg=113 guifg=#89e051
    DevIconCxx                             { fg="#519aba", }, -- DevIconCxx     xxx ctermfg=67 guifg=#519aba
    DevIconJsx                             { fg="#519aba", }, -- DevIconJsx     xxx ctermfg=67 guifg=#519aba
    DevIconGo                              { fg="#519aba", }, -- DevIconGo      xxx ctermfg=67 guifg=#519aba
    DevIconClojure                         { fg="#8dc149", }, -- DevIconClojure xxx ctermfg=107 guifg=#8dc149
    DevIconDockerfile                      { fg="#384d54", }, -- DevIconDockerfile xxx ctermfg=59 guifg=#384d54
    DevIconPpt                             { fg="#cb4a32", }, -- DevIconPpt     xxx ctermfg=167 guifg=#cb4a32
    DevIconFsharp                          { fg="#519aba", }, -- DevIconFsharp  xxx ctermfg=67 guifg=#519aba
    DevIconGitLogo                         { fg="#f14c28", }, -- DevIconGitLogo xxx ctermfg=202 guifg=#F14C28
    DevIconPromptPs1                       { fg="#4d5a5e", }, -- DevIconPromptPs1 xxx ctermfg=59 guifg=#4d5a5e
    DevIconCson                            { fg="#cbcb41", }, -- DevIconCson    xxx ctermfg=185 guifg=#cbcb41
    DevIconMd                              { fg="#519aba", }, -- DevIconMd      xxx ctermfg=67 guifg=#519aba
    DevIconMjs                             { fg="#f1e05a", }, -- DevIconMjs     xxx ctermfg=221 guifg=#f1e05a
    DevIconMli                             { fg="#e37933", }, -- DevIconMli     xxx ctermfg=173 guifg=#e37933
    DevIconEpp                             { fg="#ffa61a", }, -- DevIconEpp     xxx guifg=#FFA61A
    DevIconXul                             { fg="#e37933", }, -- DevIconXul     xxx ctermfg=173 guifg=#e37933
    DevIconYml                             { fg="#6d8086", }, -- DevIconYml     xxx ctermfg=66 guifg=#6d8086
    DevIconPy                              { fg="#ffbc03", }, -- DevIconPy      xxx ctermfg=61 guifg=#ffbc03
    DevIconExs                             { fg="#a074c4", }, -- DevIconExs     xxx ctermfg=140 guifg=#a074c4
    DevIconGemspec                         { fg="#701516", }, -- DevIconGemspec xxx ctermfg=52 guifg=#701516
    DevIconJs                              { fg="#cbcb41", }, -- DevIconJs      xxx ctermfg=185 guifg=#cbcb41
    DevIconElm                             { fg="#519aba", }, -- DevIconElm     xxx ctermfg=67 guifg=#519aba
    DevIconBat                             { fg="#c1f12e", }, -- DevIconBat     xxx ctermfg=154 guifg=#C1F12E
    DevIconHxx                             { fg="#a074c4", }, -- DevIconHxx     xxx ctermfg=140 guifg=#a074c4
    DevIconErl                             { fg="#b83998", }, -- DevIconErl     xxx ctermfg=132 guifg=#B83998
    DevIconMint                            { fg="#87c095", }, -- DevIconMint    xxx ctermfg=108 guifg=#87c095
    DevIconAi                              { fg="#cbcb41", }, -- DevIconAi      xxx ctermfg=185 guifg=#cbcb41
    DevIconFennel                          { fg="#fff3d7", }, -- DevIconFennel  xxx ctermfg=230 guifg=#fff3d7
    DevIconHrl                             { fg="#b83998", }, -- DevIconHrl     xxx ctermfg=132 guifg=#B83998
    DevIconHpp                             { fg="#a074c4", }, -- DevIconHpp     xxx ctermfg=140 guifg=#a074c4
    DevIconCpp                             { fg="#519aba", }, -- DevIconCpp     xxx ctermfg=67 guifg=#519aba
    DevIconPm                              { fg="#519aba", }, -- DevIconPm      xxx ctermfg=67 guifg=#519aba
    DevIconNPMrc                           { fg="#e8274b", }, -- DevIconNPMrc   xxx ctermfg=161 guifg=#E8274B
    DevIconHs                              { fg="#a074c4", }, -- DevIconHs      xxx ctermfg=140 guifg=#a074c4
    DevIconMl                              { fg="#e37933", }, -- DevIconMl      xxx ctermfg=173 guifg=#e37933
    DevIconConfiguration                   { fg="#ececec", }, -- DevIconConfiguration xxx ctermfg=231 guifg=#ECECEC
    DevIconToml                            { fg="#6d8086", }, -- DevIconToml    xxx ctermfg=66 guifg=#6d8086
    DevIconPp                              { fg="#ffa61a", }, -- DevIconPp      xxx guifg=#FFA61A
    DevIconJl                              { fg="#a270ba", }, -- DevIconJl      xxx ctermfg=133 guifg=#a270ba
    DevIconNim                             { fg="#f3d400", }, -- DevIconNim     xxx ctermfg=220 guifg=#f3d400
    DevIconNix                             { fg="#7ebae4", }, -- DevIconNix     xxx ctermfg=110 guifg=#7ebae4
    DevIconKotlin                          { fg="#f88a02", }, -- DevIconKotlin  xxx ctermfg=208 guifg=#F88A02
    DevIconPackageJson                     { fg="#e8274b", }, -- DevIconPackageJson xxx guifg=#e8274b
    DevIconPackageLockJson                 { fg="#7a0d21", }, -- DevIconPackageLockJson xxx guifg=#7a0d21
    DevIconPhp                             { fg="#a074c4", }, -- DevIconPhp     xxx ctermfg=140 guifg=#a074c4
    DevIconSig                             { fg="#e37933", }, -- DevIconSig     xxx ctermfg=173 guifg=#e37933
    DevIconMixLock                         { fg="#a074c4", }, -- DevIconMixLock xxx ctermfg=140 guifg=#a074c4
    DevIconIni                             { fg="#6d8086", }, -- DevIconIni     xxx ctermfg=66 guifg=#6d8086
    DevIconFavicon                         { fg="#cbcb41", }, -- DevIconFavicon xxx ctermfg=185 guifg=#cbcb41
    DevIconWebpack                         { fg="#519aba", }, -- DevIconWebpack xxx ctermfg=67 guifg=#519aba
    DevIconWebp                            { fg="#a074c4", }, -- DevIconWebp    xxx ctermfg=140 guifg=#a074c4
    DevIconRlib                            { fg="#dea584", }, -- DevIconRlib    xxx ctermfg=180 guifg=#dea584
    DevIconProcfile                        { fg="#a074c4", }, -- DevIconProcfile xxx ctermfg=140 guifg=#a074c4
    DevIconRs                              { fg="#dea584", }, -- DevIconRs      xxx ctermfg=180 guifg=#dea584
    DevIconScala                           { fg="#cc3e44", }, -- DevIconScala   xxx ctermfg=167 guifg=#cc3e44
    DevIconTxt                             { fg="#89e051", }, -- DevIconTxt     xxx ctermfg=113 guifg=#89e051
    DevIconTextScene                       { fg="#a074c4", }, -- DevIconTextScene xxx ctermfg=140 guifg=#a074c4
    DevIconDb                              { fg="#dad8d8", }, -- DevIconDb      xxx ctermfg=188 guifg=#dad8d8
    DevIconBrewfile                        { fg="#701516", }, -- DevIconBrewfile xxx ctermfg=52 guifg=#701516
    DevIconMakefile                        { fg="#6d8086", }, -- DevIconMakefile xxx ctermfg=66 guifg=#6d8086
    DevIconJpg                             { fg="#a074c4", }, -- DevIconJpg     xxx ctermfg=140 guifg=#a074c4
    DevIconXcPlayground                    { fg="#e37933", }, -- DevIconXcPlayground xxx ctermfg=173 guifg=#e37933
    DevIconSuo                             { fg="#854cc7", }, -- DevIconSuo     xxx ctermfg=98 guifg=#854CC7
    DevIconStyl                            { fg="#8dc149", }, -- DevIconStyl    xxx ctermfg=107 guifg=#8dc149
    DevIconSln                             { fg="#854cc7", }, -- DevIconSln     xxx ctermfg=98 guifg=#854CC7
    DevIconJpeg                            { fg="#a074c4", }, -- DevIconJpeg    xxx ctermfg=140 guifg=#a074c4
    DevIconRproj                           { fg="#358a5b", }, -- DevIconRproj   xxx ctermfg=65 guifg=#358a5b
    DevIconIco                             { fg="#cbcb41", }, -- DevIconIco     xxx ctermfg=185 guifg=#cbcb41
    DevIconPyo                             { fg="#ffe291", }, -- DevIconPyo     xxx ctermfg=67 guifg=#ffe291
    DevIconPyd                             { fg="#ffe291", }, -- DevIconPyd     xxx ctermfg=67 guifg=#ffe291
    DevIconPyc                             { fg="#ffe291", }, -- DevIconPyc     xxx ctermfg=67 guifg=#ffe291
    DevIconBmp                             { fg="#a074c4", }, -- DevIconBmp     xxx ctermfg=140 guifg=#a074c4
    DevIconTwig                            { fg="#8dc149", }, -- DevIconTwig    xxx ctermfg=107 guifg=#8dc149
    DevIconSvg                             { fg="#ffb13b", }, -- DevIconSvg     xxx ctermfg=215 guifg=#FFB13B
    DevIconGulpfile                        { fg="#cc3e44", }, -- DevIconGulpfile xxx ctermfg=167 guifg=#cc3e44
    DevIconSlim                            { fg="#e34c26", }, -- DevIconSlim    xxx ctermfg=166 guifg=#e34c26
    DevIconSass                            { fg="#f55385", }, -- DevIconSass    xxx ctermfg=204 guifg=#f55385
    DevIconDump                            { fg="#dad8d8", }, -- DevIconDump    xxx ctermfg=188 guifg=#dad8d8
    DevIconPng                             { fg="#a074c4", }, -- DevIconPng     xxx ctermfg=140 guifg=#a074c4
    DevIconBinaryGLTF                      { fg="#ffb13b", }, -- DevIconBinaryGLTF xxx ctermfg=215 guifg=#FFB13B
    DevIconConfigRu                        { fg="#701516", }, -- DevIconConfigRu xxx ctermfg=52 guifg=#701516
    DevIconLeex                            { fg="#a074c4", }, -- DevIconLeex    xxx ctermfg=140 guifg=#a074c4
    DevIconGemfile                         { fg="#701516", }, -- DevIconGemfile xxx ctermfg=52 guifg=#701516
    DevIconGif                             { fg="#a074c4", }, -- DevIconGif     xxx ctermfg=140 guifg=#a074c4
    lualine_z_filetype_DevIconLua_normal   { fg="#51a0cf", bg=M.colors.foreground, }, -- lualine_z_filetype_DevIconLua_normal xxx guifg=#51a0cf guibg=#c8d0e0
    lualine_z_filetype_DevIconLua_insert   { fg="#51a0cf", bg=M.colors.foreground, }, -- lualine_z_filetype_DevIconLua_insert xxx guifg=#51a0cf guibg=#c8d0e0
    lualine_z_filetype_DevIconLua_visual   { fg="#51a0cf", bg=M.colors.foreground, }, -- lualine_z_filetype_DevIconLua_visual xxx guifg=#51a0cf guibg=#c8d0e0
    lualine_z_filetype_DevIconLua_replace  { fg="#51a0cf", bg=M.colors.foreground, }, -- lualine_z_filetype_DevIconLua_replace xxx guifg=#51a0cf guibg=#c8d0e0
    lualine_z_filetype_DevIconLua_command  { fg="#51a0cf", bg=M.colors.foreground, }, -- lualine_z_filetype_DevIconLua_command xxx guifg=#51a0cf guibg=#c8d0e0
    lualine_z_filetype_DevIconLua_terminal { fg="#51a0cf", bg=M.colors.foreground, }, -- lualine_z_filetype_DevIconLua_terminal xxx guifg=#51a0cf guibg=#c8d0e0
    lualine_z_filetype_DevIconLua_inactive { fg="#51a0cf", bg=M.colors.foreground, }, -- lualine_z_filetype_DevIconLua_inactive xxx guifg=#51a0cf guibg=#c8d0e0
  }
end)
return M
