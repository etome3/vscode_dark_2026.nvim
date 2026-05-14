local M = {}

---@param c table
function M.get(c)
  return {
    NotifyERRORBorder = { fg = c.error },
    NotifyWARNBorder = { fg = c.warning },
    NotifyINFOBorder = { fg = c.info },
    NotifyDEBUGBorder = { fg = c.fg_gutter },
    NotifyTRACEBorder = { fg = c.purple },
    NotifyERRORIcon = { fg = c.error },
    NotifyWARNIcon = { fg = c.warning },
    NotifyINFOIcon = { fg = c.info },
    NotifyDEBUGIcon = { fg = c.fg_gutter },
    NotifyTRACEIcon = { fg = c.purple },
    NotifyERRORTitle = { fg = c.error },
    NotifyWARNTitle = { fg = c.warning },
    NotifyINFOTitle = { fg = c.info },
    NotifyDEBUGTitle = { fg = c.fg_gutter },
    NotifyTRACETitle = { fg = c.purple },
    NotifyERRORBody = "NormalFloat",
    NotifyWARNBody = "NormalFloat",
    NotifyINFOBody = "NormalFloat",
    NotifyDEBUGBody = "NormalFloat",
    NotifyTRACEBody = "NormalFloat",
  }
end

return M
