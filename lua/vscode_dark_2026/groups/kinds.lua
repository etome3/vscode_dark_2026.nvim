local M = {}

---@param c table
function M.get(c)
  return {
    KindText = { fg = c.fg },
    KindMethod = { fg = c.magenta },
    KindFunction = { fg = c.magenta },
    KindConstructor = { fg = c.teal },
    KindField = { fg = c.fg },
    KindVariable = { fg = c.fg },
    KindClass = { fg = c.teal },
    KindInterface = { fg = c.teal },
    KindModule = { fg = c.teal },
    KindProperty = { fg = c.fg },
    KindUnit = { fg = c.green },
    KindValue = { fg = c.blue1 },
    KindEnum = { fg = c.teal },
    KindKeyword = { fg = c.red },
    KindSnippet = { fg = c.orange },
    KindColor = { fg = c.cyan },
    KindFile = { fg = c.blue2 },
    KindReference = { fg = c.blue1 },
    KindFolder = { fg = c.teal },
    KindEnumMember = { fg = c.blue1 },
    KindConstant = { fg = c.blue1 },
    KindStruct = { fg = c.teal },
    KindEvent = { fg = c.magenta },
    KindOperator = { fg = c.fg },
    KindTypeParameter = { fg = c.teal },
  }
end

return M
