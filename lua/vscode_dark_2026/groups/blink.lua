local M = {}

---@param c table
function M.get(c)
  return {
    BlinkCmpMenu = "Pmenu",
    BlinkCmpMenuBorder = "FloatBorder",
    BlinkCmpMenuSelection = "PmenuSel",
    BlinkCmpLabel = { fg = c.fg },
    BlinkCmpLabelDeprecated = { fg = c.fg_gutter, strikethrough = true },
    BlinkCmpLabelMatch = { fg = c.blue2, bold = true },
    BlinkCmpDoc = "NormalFloat",
    BlinkCmpDocBorder = "FloatBorder",
    BlinkCmpSignatureHelp = "NormalFloat",
    BlinkCmpSignatureHelpBorder = "FloatBorder",
    BlinkCmpKind = { fg = c.fg_dark },
    BlinkCmpKindText = "KindText",
    BlinkCmpKindMethod = "KindMethod",
    BlinkCmpKindFunction = "KindFunction",
    BlinkCmpKindConstructor = "KindConstructor",
    BlinkCmpKindField = "KindField",
    BlinkCmpKindVariable = "KindVariable",
    BlinkCmpKindClass = "KindClass",
    BlinkCmpKindInterface = "KindInterface",
    BlinkCmpKindModule = "KindModule",
    BlinkCmpKindProperty = "KindProperty",
    BlinkCmpKindUnit = "KindUnit",
    BlinkCmpKindValue = "KindValue",
    BlinkCmpKindEnum = "KindEnum",
    BlinkCmpKindKeyword = "KindKeyword",
    BlinkCmpKindSnippet = "KindSnippet",
    BlinkCmpKindColor = "KindColor",
    BlinkCmpKindFile = "KindFile",
    BlinkCmpKindReference = "KindReference",
    BlinkCmpKindFolder = "KindFolder",
    BlinkCmpKindEnumMember = "KindEnumMember",
    BlinkCmpKindConstant = "KindConstant",
    BlinkCmpKindStruct = "KindStruct",
    BlinkCmpKindEvent = "KindEvent",
    BlinkCmpKindOperator = "KindOperator",
    BlinkCmpKindTypeParameter = "KindTypeParameter",
  }
end

return M
