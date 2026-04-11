-- lua/lush_theme/vscode_dark_2026.lua
--
-- VS Code Dark 2026 — a faithful Neovim port via lush.nvim
-- Covers: core Vim groups, Treesitter, LSP semantic tokens,
--         Diagnostics, rainbow-delimiters, and common LazyVim plugins.
--
-- Requires: rktjmp/lush.nvim
-- Optional: HiPhish/rainbow-delimiters.nvim (for bracket colours)
--
---@diagnostic disable: undefined-global
local lush = require("lush")
local hsl  = lush.hsl

-- ── Palette ────────────────────────────────────────────────────────────────
-- Every colour in one place so tweaks are easy.
local p = {
  -- Editor chrome
  bg          = hsl("#0E0E0E"), -- editor background
  bg_sidebar  = hsl("#141414"), -- sidebar / float / popup bg
  bg_cursorln = hsl("#1A1A1A"), -- cursor line
  bg_sel      = hsl("#213355"), -- visual selection
  bg_search   = hsl("#2D4F7C"), -- incremental search match
  bg_widget   = hsl("#2A2A2A"), -- input boxes, pmenu bg

  -- Foregrounds
  fg          = hsl("#C9D1D9"), -- default text, variables, punctuation, operators
  fg_dim      = hsl("#4E5462"), -- line numbers, non-text
  fg_active   = hsl("#8B949E"), -- active line number, end-of-buffer
  fg_border   = hsl("#30363D"), -- window separators

  -- Syntax
  comment     = hsl("#8B949E"), -- // and /* */ comments
  keyword     = hsl("#FF7B72"), -- fn, let, mut, for, in, match, return, use, mod, pub…
  type_       = hsl("#4EC9B0"), -- types, struct/enum names, namespaces (String, Option, stuff::)
  func_user   = hsl("#D2A8FF"), -- user-defined functions and methods
  func_stdlib = hsl("#DCDCAA"), -- stdlib / known methods: from(), new(), len()…
  constant    = hsl("#79C0FF"), -- constants, enum variants, None, true (as a value)
  macro_      = hsl("#569CD6"), -- macro invocations (println!, info!), boolean literals
  string_     = hsl("#A5D6FF"), -- string AND character literals
  number      = hsl("#B5CEA8"), -- numeric literals
  parameter   = hsl("#FFA657"), -- function parameters
  angle_brkt  = hsl("#BBBEBF"), -- generic angle brackets <>

  -- Diagnostics
  error_      = hsl("#F85149"),
  warn_       = hsl("#D29922"),
  info_       = hsl("#58A6FF"),
  hint_       = hsl("#B5CEA8"),

  -- Git / diff
  git_add     = hsl("#3FB950"),
  git_change  = hsl("#D29922"),
  git_delete  = hsl("#F85149"),

  -- Rainbow delimiters (3-colour cycle, repeating)
  rainbow1    = hsl("#FFD700"), -- yellow
  rainbow2    = hsl("#DA70D6"), -- orchid / purple
  rainbow3    = hsl("#179FFF"), -- sky blue
}

-- ── Spec ───────────────────────────────────────────────────────────────────
return lush(function()
  return {

    -- ── Core Vim highlight groups ─────────────────────────────────────────

    Normal            { bg = p.bg,          fg = p.fg },
    NormalFloat       { bg = p.bg_sidebar,  fg = p.fg },
    NormalNC          { bg = p.bg,          fg = p.fg }, -- non-current windows

    Comment           { fg = p.comment,     gui = "italic" },

    -- Literals
    Constant          { fg = p.constant },
    String            { fg = p.string_ },
    Character         { fg = p.string_ },
    Number            { fg = p.number },
    Float             { fg = p.number },
    Boolean           { fg = p.macro_ },  -- true/false same as macro blue

    -- Identifiers
    Identifier        { fg = p.fg },
    Function          { fg = p.func_user },

    -- Statements & keywords
    Statement         { fg = p.keyword },
    Conditional       { fg = p.keyword },
    Repeat            { fg = p.keyword },
    Label             { fg = p.keyword },
    Operator          { fg = p.fg },
    Keyword           { fg = p.keyword },
    Exception         { fg = p.keyword },

    -- Preprocessor / meta
    PreProc           { fg = p.keyword },
    Include           { fg = p.keyword },
    Define            { fg = p.keyword },
    Macro             { fg = p.macro_ },
    PreCondit         { fg = p.keyword },

    -- Types
    Type              { fg = p.type_ },
    StorageClass      { fg = p.keyword },
    Structure         { fg = p.type_ },
    Typedef           { fg = p.type_ },

    -- Special
    Special           { fg = p.func_stdlib },
    SpecialChar       { fg = p.string_ },
    Tag               { fg = p.constant },
    Delimiter         { fg = p.fg },
    SpecialComment    { fg = p.comment,  gui = "bold" },
    Debug             { fg = p.warn_ },

    -- Misc
    Underlined        { fg = p.info_,    gui = "underline" },
    Bold              {                  gui = "bold" },
    Italic            {                  gui = "italic" },
    Error             { fg = p.error_ },
    Todo              { fg = p.macro_,   gui = "bold" },
    Ignore            { fg = p.fg_dim },

    -- ── Editor UI ─────────────────────────────────────────────────────────

    ColorColumn       { bg = p.bg_cursorln },
    Conceal           { fg = p.fg_dim },
    Cursor            { bg = p.fg,          fg = p.bg },
    lCursor           { bg = p.fg,          fg = p.bg },
    CursorIM          { bg = p.fg,          fg = p.bg },
    CursorLine        { bg = p.bg_cursorln },
    CursorColumn      { bg = p.bg_cursorln },
    CursorLineNr      { fg = p.fg_active },
    LineNr            { fg = p.fg_dim },
    SignColumn        { bg = p.bg,          fg = p.fg_dim },
    FoldColumn        { bg = p.bg,          fg = p.fg_dim },
    Folded            { bg = p.bg_widget,   fg = p.fg_active, gui = "italic" },

    VertSplit         { fg = p.fg_border },
    WinSeparator      { fg = p.fg_border },

    StatusLine        { bg = p.bg_sidebar,  fg = p.fg },
    StatusLineNC      { bg = p.bg_sidebar,  fg = p.fg_active },
    TabLine           { bg = p.bg_sidebar,  fg = p.fg_active },
    TabLineSel        { bg = p.bg,          fg = p.fg,      gui = "bold" },
    TabLineFill       { bg = p.bg_sidebar },

    Visual            { bg = p.bg_sel },
    VisualNOS         { bg = p.bg_sel },

    Search            { bg = p.bg_search,   fg = p.fg },
    IncSearch         { bg = p.info_,       fg = p.bg, gui = "bold" },
    Substitute        { bg = p.error_,      fg = p.bg },
    MatchParen        { bg = p.bg_widget,   fg = p.fg, gui = "bold" },

    Pmenu             { bg = p.bg_widget,   fg = p.fg },
    PmenuSel          { bg = p.bg_sel,      fg = p.fg, gui = "bold" },
    PmenuSbar         { bg = p.bg_widget },
    PmenuThumb        { bg = p.fg_active },

    WildMenu          { bg = p.bg_sel,      fg = p.fg },

    Directory         { fg = p.type_ },
    Title             { fg = p.func_user,   gui = "bold" },
    EndOfBuffer       { fg = p.fg_dim },
    NonText           { fg = p.fg_dim },
    SpecialKey        { fg = p.fg_dim },
    Whitespace        { fg = p.fg_dim },

    ErrorMsg          { fg = p.error_,      gui = "bold" },
    WarningMsg        { fg = p.warn_ },
    MoreMsg           { fg = p.git_add },
    ModeMsg           { fg = p.fg,          gui = "bold" },
    Question          { fg = p.info_ },

    SpellBad          { sp = p.error_,      gui = "undercurl" },
    SpellCap          { sp = p.warn_,       gui = "undercurl" },
    SpellLocal        { sp = p.info_,       gui = "undercurl" },
    SpellRare         { sp = p.hint_,       gui = "undercurl" },

    DiffAdd           { bg = hsl("#0D2010"), fg = p.git_add },
    DiffChange        { bg = hsl("#161005"), fg = p.git_change },
    DiffDelete        { bg = hsl("#1C0A0A"), fg = p.git_delete },
    DiffText          { bg = hsl("#2A1F00"), fg = p.git_change, gui = "bold" },

    QuickFixLine      { bg = p.bg_sel },

    -- ── Diagnostics ───────────────────────────────────────────────────────

    DiagnosticError            { fg = p.error_ },
    DiagnosticWarn             { fg = p.warn_ },
    DiagnosticInfo             { fg = p.info_ },
    DiagnosticHint             { fg = p.hint_ },
    DiagnosticOk               { fg = p.git_add },

    DiagnosticUnderlineError   { sp = p.error_,  gui = "undercurl" },
    DiagnosticUnderlineWarn    { sp = p.warn_,   gui = "undercurl" },
    DiagnosticUnderlineInfo    { sp = p.info_,   gui = "undercurl" },
    DiagnosticUnderlineHint    { sp = p.hint_,   gui = "undercurl" },

    DiagnosticVirtualTextError { fg = p.error_,  bg = hsl("#1C0A0A") },
    DiagnosticVirtualTextWarn  { fg = p.warn_,   bg = hsl("#161005") },
    DiagnosticVirtualTextInfo  { fg = p.info_,   bg = hsl("#0A0F1C") },
    DiagnosticVirtualTextHint  { fg = p.hint_,   bg = hsl("#0A1A0A") },

    DiagnosticSignError        { fg = p.error_ },
    DiagnosticSignWarn         { fg = p.warn_ },
    DiagnosticSignInfo         { fg = p.info_ },
    DiagnosticSignHint         { fg = p.hint_ },

    DiagnosticFloatingError    { fg = p.error_ },
    DiagnosticFloatingWarn     { fg = p.warn_ },
    DiagnosticFloatingInfo     { fg = p.info_ },
    DiagnosticFloatingHint     { fg = p.hint_ },

    -- ── Treesitter ────────────────────────────────────────────────────────
    -- Neovim 0.8+ uses @-prefixed groups. lush uses the [] escape for these.

    -- Variables
    ["@variable"]                    { fg = p.fg },
    ["@variable.builtin"]            { fg = p.keyword },   -- self, super
    ["@variable.parameter"]          { fg = p.parameter },
    ["@variable.parameter.builtin"]  { fg = p.keyword },
    ["@variable.member"]             { fg = p.fg },        -- struct fields

    -- Constants
    ["@constant"]                    { fg = p.constant },
    ["@constant.builtin"]            { fg = p.macro_ },    -- true, false, nil
    ["@constant.macro"]              { fg = p.macro_ },

    -- Modules / namespaces
    ["@module"]                      { fg = p.type_ },
    ["@module.builtin"]              { fg = p.type_ },
    ["@label"]                       { fg = p.constant },

    -- Literals
    ["@string"]                      { fg = p.string_ },
    ["@string.documentation"]        { fg = p.comment,    gui = "italic" },
    ["@string.regexp"]               { fg = p.string_ },
    ["@string.escape"]               { fg = p.keyword },   -- \n, \t etc — red like keywords in VSCode
    ["@string.special"]              { fg = p.string_ },
    ["@string.special.url"]          { fg = p.info_,      gui = "underline" },
    ["@string.special.symbol"]       { fg = p.constant },

    ["@character"]                   { fg = p.string_ },
    ["@character.special"]           { fg = p.keyword },

    ["@number"]                      { fg = p.number },
    ["@number.float"]                { fg = p.number },

    -- Types
    ["@type"]                        { fg = p.type_ },
    ["@type.builtin"]                { fg = p.type_ },
    ["@type.definition"]             { fg = p.type_ },

    -- Attributes / decorators
    ["@attribute"]                   { fg = p.keyword },
    ["@attribute.builtin"]           { fg = p.keyword },
    ["@property"]                    { fg = p.fg },

    -- Functions
    ["@function"]                    { fg = p.func_user },
    ["@function.builtin"]            { fg = p.func_stdlib },
    ["@function.call"]               { fg = p.func_user },
    ["@function.macro"]              { fg = p.macro_ },
    ["@function.method"]             { fg = p.func_user },
    ["@function.method.call"]        { fg = p.func_user },

    -- Keywords
    ["@keyword"]                     { fg = p.keyword },
    ["@keyword.coroutine"]           { fg = p.keyword },
    ["@keyword.function"]            { fg = p.keyword },
    ["@keyword.operator"]            { fg = p.keyword },
    ["@keyword.import"]              { fg = p.keyword },
    ["@keyword.type"]                { fg = p.keyword },
    ["@keyword.modifier"]            { fg = p.keyword },  -- pub, mut
    ["@keyword.repeat"]              { fg = p.keyword },
    ["@keyword.return"]              { fg = p.keyword },
    ["@keyword.debug"]               { fg = p.warn_ },
    ["@keyword.exception"]           { fg = p.keyword },
    ["@keyword.conditional"]         { fg = p.keyword },
    ["@keyword.conditional.ternary"] { fg = p.keyword },
    ["@keyword.directive"]           { fg = p.keyword },
    ["@keyword.directive.define"]    { fg = p.keyword },

    -- Punctuation
    ["@punctuation.delimiter"]       { fg = p.fg },      -- ; , .
    ["@punctuation.bracket"]         { fg = p.fg },      -- ( ) [ ] { }
    ["@punctuation.special"]         { fg = p.fg },      -- interpolation braces

    -- Comments
    ["@comment"]                     { fg = p.comment,    gui = "italic" },
    ["@comment.documentation"]       { fg = p.comment,    gui = "italic" },
    ["@comment.error"]               { fg = p.error_,     gui = "bold" },
    ["@comment.warning"]             { fg = p.warn_,      gui = "bold" },
    ["@comment.todo"]                { fg = p.macro_,     gui = "bold" },
    ["@comment.note"]                { fg = p.info_,      gui = "bold" },

    -- Markup (markdown etc.)
    ["@markup.strong"]               { gui = "bold" },
    ["@markup.italic"]               { gui = "italic" },
    ["@markup.strikethrough"]        { gui = "strikethrough" },
    ["@markup.underline"]            { gui = "underline" },
    ["@markup.heading"]              { fg = p.func_user,  gui = "bold" },
    ["@markup.heading.1"]            { fg = p.keyword,    gui = "bold" },
    ["@markup.heading.2"]            { fg = p.func_user,  gui = "bold" },
    ["@markup.heading.3"]            { fg = p.type_,      gui = "bold" },
    ["@markup.heading.4"]            { fg = p.constant,   gui = "bold" },
    ["@markup.heading.5"]            { fg = p.macro_,     gui = "bold" },
    ["@markup.heading.6"]            { fg = p.func_stdlib, gui = "bold" },
    ["@markup.quote"]                { fg = p.comment,    gui = "italic" },
    ["@markup.math"]                 { fg = p.number },
    ["@markup.link"]                 { fg = p.info_ },
    ["@markup.link.label"]           { fg = p.func_user },
    ["@markup.link.url"]             { fg = p.info_,      gui = "underline" },
    ["@markup.raw"]                  { fg = p.string_ },
    ["@markup.raw.block"]            { fg = p.string_ },
    ["@markup.list"]                 { fg = p.keyword },
    ["@markup.list.checked"]         { fg = p.git_add },
    ["@markup.list.unchecked"]       { fg = p.fg_active },

    -- Diff (TS)
    ["@diff.plus"]                   { fg = p.git_add },
    ["@diff.minus"]                  { fg = p.git_delete },
    ["@diff.delta"]                  { fg = p.git_change },

    -- Tags (HTML/JSX)
    ["@tag"]                         { fg = p.keyword },
    ["@tag.builtin"]                 { fg = p.keyword },
    ["@tag.attribute"]               { fg = p.parameter },
    ["@tag.delimiter"]               { fg = p.fg },

    -- ── LSP semantic tokens ───────────────────────────────────────────────
    -- These run on top of Treesitter and give more precise info (e.g. stdlib vs user)

    ["@lsp.type.class"]              { fg = p.type_ },
    ["@lsp.type.comment"]            { fg = p.comment,    gui = "italic" },
    ["@lsp.type.decorator"]          { fg = p.func_user },
    ["@lsp.type.enum"]               { fg = p.type_ },
    ["@lsp.type.enumMember"]         { fg = p.constant },
    ["@lsp.type.event"]              { fg = p.type_ },
    ["@lsp.type.function"]           { fg = p.func_user },
    ["@lsp.type.interface"]          { fg = p.type_ },
    ["@lsp.type.keyword"]            { fg = p.keyword },
    ["@lsp.type.macro"]              { fg = p.macro_ },
    ["@lsp.type.method"]             { fg = p.func_user },
    ["@lsp.type.modifier"]           { fg = p.keyword },
    ["@lsp.type.namespace"]          { fg = p.type_ },
    ["@lsp.type.number"]             { fg = p.number },
    ["@lsp.type.operator"]           { fg = p.fg },
    ["@lsp.type.parameter"]          { fg = p.parameter },
    ["@lsp.type.property"]           { fg = p.fg },
    ["@lsp.type.regexp"]             { fg = p.string_ },
    ["@lsp.type.string"]             { fg = p.string_ },
    ["@lsp.type.struct"]             { fg = p.type_ },
    ["@lsp.type.type"]               { fg = p.type_ },
    ["@lsp.type.typeParameter"]      { fg = p.type_ },
    ["@lsp.type.variable"]           { fg = p.fg },

    -- Semantic token modifiers — this is what separates stdlib from user code
    ["@lsp.typemod.function.defaultLibrary"]  { fg = p.func_stdlib },
    ["@lsp.typemod.method.defaultLibrary"]    { fg = p.func_stdlib },
    ["@lsp.typemod.variable.defaultLibrary"]  { fg = p.func_stdlib },
    ["@lsp.typemod.function.readonly"]        { fg = p.func_user,  gui = "italic" },
    ["@lsp.typemod.variable.readonly"]        { fg = p.constant },
    ["@lsp.typemod.variable.static"]          { fg = p.constant },

    -- ── Git signs (lewis6991/gitsigns.nvim) ───────────────────────────────

    GitSignsAdd               { fg = p.git_add,    bg = p.bg },
    GitSignsChange            { fg = p.git_change, bg = p.bg },
    GitSignsDelete            { fg = p.git_delete, bg = p.bg },
    GitSignsAddNr             { fg = p.git_add },
    GitSignsChangeNr          { fg = p.git_change },
    GitSignsDeleteNr          { fg = p.git_delete },
    GitSignsAddLn             { bg = hsl("#0D2010") },
    GitSignsChangeLn          { bg = hsl("#161005") },
    GitSignsDeleteLn          { bg = hsl("#1C0A0A") },

    -- ── Telescope (nvim-telescope/telescope.nvim) ─────────────────────────

    TelescopeBorder           { fg = p.fg_border,   bg = p.bg_sidebar },
    TelescopeNormal           { bg = p.bg_sidebar,  fg = p.fg },
    TelescopePromptNormal     { bg = p.bg_widget,   fg = p.fg },
    TelescopePromptBorder     { fg = p.fg_border,   bg = p.bg_widget },
    TelescopePromptTitle      { fg = p.keyword,     gui = "bold" },
    TelescopePreviewTitle     { fg = p.type_,       gui = "bold" },
    TelescopeResultsTitle     { fg = p.func_user,   gui = "bold" },
    TelescopeSelection        { bg = p.bg_sel,      fg = p.fg },
    TelescopeSelectionCaret   { fg = p.keyword },
    TelescopeMatching         { fg = p.func_stdlib, gui = "bold" },

    -- ── nvim-tree (nvim-tree/nvim-tree.lua) ───────────────────────────────

    NvimTreeNormal            { bg = p.bg_sidebar,  fg = p.fg },
    NvimTreeFolderIcon        { fg = p.macro_ },
    NvimTreeFolderName        { fg = p.fg },
    NvimTreeOpenedFolderName  { fg = p.fg,          gui = "bold" },
    NvimTreeRootFolder        { fg = p.keyword,     gui = "bold" },
    NvimTreeGitDirty          { fg = p.git_change },
    NvimTreeGitNew            { fg = p.git_add },
    NvimTreeGitDeleted        { fg = p.git_delete },
    NvimTreeIndentMarker      { fg = p.fg_dim },
    NvimTreeSymlink           { fg = p.type_ },
    NvimTreeExecFile          { fg = p.func_user },

    -- ── neo-tree (nvim-neo-tree/neo-tree.nvim) — LazyVim default ──────────

    NeoTreeNormal             { bg = p.bg_sidebar,  fg = p.fg },
    NeoTreeNormalNC           { bg = p.bg_sidebar,  fg = p.fg },
    NeoTreeDirectoryName      { fg = p.fg },
    NeoTreeDirectoryIcon      { fg = p.macro_ },
    NeoTreeRootName           { fg = p.keyword,     gui = "bold" },
    NeoTreeFileName           { fg = p.fg },
    NeoTreeFileIcon           { fg = p.fg_active },
    NeoTreeGitAdded           { fg = p.git_add },
    NeoTreeGitModified        { fg = p.git_change },
    NeoTreeGitDeleted         { fg = p.git_delete },
    NeoTreeGitUntracked       { fg = p.fg_active },
    NeoTreeIndentMarker       { fg = p.fg_dim },
    NeoTreeSymbolicLinkTarget { fg = p.type_ },
    NeoTreeTitleBar           { bg = p.macro_,      fg = p.bg, gui = "bold" },
    NeoTreeFloatBorder        { fg = p.fg_border },
    NeoTreeTabActive          { bg = p.bg,          fg = p.fg, gui = "bold" },
    NeoTreeTabInactive        { bg = p.bg_sidebar,  fg = p.fg_active },

    -- ── which-key (folke/which-key.nvim) ─────────────────────────────────

    WhichKey          { fg = p.keyword },
    WhichKeyGroup     { fg = p.type_ },
    WhichKeyDesc      { fg = p.fg },
    WhichKeySeperator { fg = p.fg_dim },
    WhichKeyFloat     { bg = p.bg_sidebar },
    WhichKeyBorder    { fg = p.fg_border },
    WhichKeyValue     { fg = p.func_stdlib },

    -- ── nvim-cmp (hrsh7th/nvim-cmp) ───────────────────────────────────────

    CmpItemAbbr           { fg = p.fg },
    CmpItemAbbrMatch      { fg = p.func_stdlib,  gui = "bold" },
    CmpItemAbbrMatchFuzzy { fg = p.func_stdlib,  gui = "bold" },
    CmpItemAbbrDeprecated { fg = p.fg_dim,       gui = "strikethrough" },
    CmpItemMenu           { fg = p.fg_active },
    CmpItemKindText       { fg = p.fg },
    CmpItemKindMethod     { fg = p.func_user },
    CmpItemKindFunction   { fg = p.func_user },
    CmpItemKindConstructor{ fg = p.type_ },
    CmpItemKindField      { fg = p.fg },
    CmpItemKindVariable   { fg = p.fg },
    CmpItemKindClass      { fg = p.type_ },
    CmpItemKindInterface  { fg = p.type_ },
    CmpItemKindModule     { fg = p.type_ },
    CmpItemKindProperty   { fg = p.fg },
    CmpItemKindUnit       { fg = p.number },
    CmpItemKindValue      { fg = p.constant },
    CmpItemKindEnum       { fg = p.type_ },
    CmpItemKindKeyword    { fg = p.keyword },
    CmpItemKindSnippet    { fg = p.macro_ },
    CmpItemKindColor      { fg = p.string_ },
    CmpItemKindFile       { fg = p.fg_active },
    CmpItemKindReference  { fg = p.constant },
    CmpItemKindFolder     { fg = p.fg_active },
    CmpItemKindEnumMember { fg = p.constant },
    CmpItemKindConstant   { fg = p.constant },
    CmpItemKindStruct     { fg = p.type_ },
    CmpItemKindEvent      { fg = p.type_ },
    CmpItemKindOperator   { fg = p.fg },
    CmpItemKindTypeParameter { fg = p.type_ },

    -- ── indent-blankline (lukas-reineke/indent-blankline.nvim) ────────────

    IblIndent         { fg = hsl("#1E1E1E") },  -- very subtle indent guides
    IblScope          { fg = hsl("#3D3D3D") },  -- current scope guide, slightly brighter

    -- ── flash.nvim (folke/flash.nvim) — LazyVim extra ────────────────────

    FlashBackdrop     { fg = p.fg_dim },
    FlashMatch        { bg = p.bg_search,  fg = p.fg },
    FlashCurrent      { bg = p.info_,      fg = p.bg,  gui = "bold" },
    FlashLabel        { bg = p.keyword,    fg = p.bg,  gui = "bold" },

    -- ── Noice (folke/noice.nvim) — LazyVim default ────────────────────────

    NoiceVirtualText  { fg = p.fg_active },
    NoiceCmdline      { fg = p.fg,         bg = p.bg_widget },
    NoicePopup        { bg = p.bg_sidebar },
    NoicePopupBorder  { fg = p.fg_border,  bg = p.bg_sidebar },
    NoiceConfirm      { bg = p.bg_sidebar },

    -- ── Lualine — colours exposed for lualine config (see README) ─────────
    -- Not highlight groups, but useful to export via g:vscode_dark_palette
    -- (set in colors/vscode_dark_2026.lua if desired)

    -- ── Rainbow delimiters (HiPhish/rainbow-delimiters.nvim) ─────────────
    -- Plugin cycles through these 7 groups. With 3 colours we fill 1-3
    -- and repeat the cycle manually for 4-7.

    RainbowDelimiter1 { fg = p.rainbow1 },  -- yellow
    RainbowDelimiter2 { fg = p.rainbow2 },  -- purple
    RainbowDelimiter3 { fg = p.rainbow3 },  -- blue
    RainbowDelimiter4 { fg = p.rainbow1 },  -- yellow (repeat)
    RainbowDelimiter5 { fg = p.rainbow2 },  -- purple (repeat)
    RainbowDelimiter6 { fg = p.rainbow3 },  -- blue (repeat)
    RainbowDelimiter7 { fg = p.rainbow1 },  -- yellow (repeat)

  }
end)
