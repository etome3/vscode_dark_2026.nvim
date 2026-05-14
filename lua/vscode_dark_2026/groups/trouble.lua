local M = {}

---@param c table
function M.get(c)
  return {
    TroubleNormal = { fg = c.fg, bg = c.bg_sidebar },
    TroubleNormalNC = { fg = c.fg_dark, bg = c.bg_sidebar },
    TroubleText = { fg = c.fg },
    TroubleCount = { fg = c.purple, bg = c.bg_widget },
    TroublePreview = { bg = c.bg_visual },
    TroubleIndent = { fg = c.fg_gutter },
    TroubleDirectory = { fg = c.teal },
    TroubleFilename = { fg = c.fg },
    TroubleIconArray = "KindClass",
    TroubleIconBoolean = "KindValue",
    TroubleIconClass = "KindClass",
    TroubleIconConstant = "KindConstant",
    TroubleIconConstructor = "KindConstructor",
    TroubleIconFunction = "KindFunction",
    TroubleIconMethod = "KindMethod",
    TroubleIconModule = "KindModule",
    TroubleIconObject = "KindClass",
    TroubleIconPackage = "KindModule",
    TroubleIconString = { fg = c.cyan },
    TroubleIconVariable = "KindVariable",
  }
end

return M
