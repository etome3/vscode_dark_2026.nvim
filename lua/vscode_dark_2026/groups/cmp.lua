local M = {}

---@param c table
function M.get(c)
  local ret = {
    CmpItemAbbr = { fg = c.fg },
    CmpItemAbbrDeprecated = { fg = c.fg_gutter, strikethrough = true },
    CmpItemAbbrMatch = { fg = c.blue2, bold = true },
    CmpItemAbbrMatchFuzzy = { fg = c.blue2, bold = true },
    CmpItemMenu = { fg = c.comment },
  }

  local map = {
    Text = "KindText",
    Method = "KindMethod",
    Function = "KindFunction",
    Constructor = "KindConstructor",
    Field = "KindField",
    Variable = "KindVariable",
    Class = "KindClass",
    Interface = "KindInterface",
    Module = "KindModule",
    Property = "KindProperty",
    Unit = "KindUnit",
    Value = "KindValue",
    Enum = "KindEnum",
    Keyword = "KindKeyword",
    Snippet = "KindSnippet",
    Color = "KindColor",
    File = "KindFile",
    Reference = "KindReference",
    Folder = "KindFolder",
    EnumMember = "KindEnumMember",
    Constant = "KindConstant",
    Struct = "KindStruct",
    Event = "KindEvent",
    Operator = "KindOperator",
    TypeParameter = "KindTypeParameter",
  }
  for kind, link in pairs(map) do
    ret["CmpItemKind" .. kind] = link
  end
  return ret
end

return M
