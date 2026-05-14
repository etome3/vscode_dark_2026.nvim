local M = {}

---@param c table
function M.get(c)
  return {
    ["@lsp.type.class"] = { fg = c.teal },
    ["@lsp.type.comment"] = { fg = c.comment, italic = true },
    ["@lsp.type.decorator"] = { fg = c.magenta },
    ["@lsp.type.enum"] = { fg = c.teal },
    ["@lsp.type.enumMember"] = { fg = c.blue1 },
    ["@lsp.type.event"] = { fg = c.magenta },
    ["@lsp.type.function"] = { fg = c.magenta },
    ["@lsp.type.interface"] = { fg = c.teal },
    ["@lsp.type.keyword"] = { fg = c.red },
    ["@lsp.type.macro"] = { fg = c.blue },
    ["@lsp.type.method"] = { fg = c.magenta },
    ["@lsp.type.modifier"] = { fg = c.red },
    ["@lsp.type.namespace"] = { fg = c.teal },
    ["@lsp.type.number"] = { fg = c.green },
    ["@lsp.type.operator"] = { fg = c.fg },
    ["@lsp.type.parameter"] = { fg = c.orange },
    ["@lsp.type.property"] = { fg = c.fg },
    ["@lsp.type.regexp"] = { fg = c.cyan },
    ["@lsp.type.string"] = { fg = c.cyan },
    ["@lsp.type.struct"] = { fg = c.teal },
    ["@lsp.type.type"] = { fg = c.teal },
    ["@lsp.type.typeParameter"] = { fg = c.teal },
    ["@lsp.type.variable"] = { fg = c.fg },

    ["@lsp.mod.defaultLibrary"] = { fg = c.yellow },
    ["@lsp.mod.deprecated"] = { strikethrough = true },
    ["@lsp.mod.readonly"] = { fg = c.blue1 },
    ["@lsp.mod.static"] = { fg = c.blue1 },
    ["@lsp.mod.documentation"] = { fg = c.comment, italic = true },
    ["@lsp.mod.unsafe"] = { fg = c.warning },

    ["@lsp.typemod.function.defaultLibrary"] = { fg = c.yellow },
    ["@lsp.typemod.method.defaultLibrary"] = { fg = c.yellow },
    ["@lsp.typemod.variable.defaultLibrary"] = { fg = c.yellow },
    ["@lsp.typemod.property.readonly"] = { fg = c.blue1 },
    ["@lsp.typemod.variable.readonly"] = { fg = c.blue1 },
    ["@lsp.typemod.class.defaultLibrary"] = { fg = c.teal },
    ["@lsp.typemod.type.defaultLibrary"] = { fg = c.teal },
  }
end

return M
