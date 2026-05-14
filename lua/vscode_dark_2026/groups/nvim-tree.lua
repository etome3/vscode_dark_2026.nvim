local M = {}

---@param c table
function M.get(c)
  return {
    NvimTreeNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },
    NvimTreeNormalNC = { fg = c.fg_sidebar, bg = c.bg_sidebar },
    NvimTreeFolderName = { fg = c.teal },
    NvimTreeOpenedFolderName = { fg = c.teal, bold = true },
    NvimTreeRootFolder = { fg = c.magenta, bold = true },
    NvimTreeGitNew = { fg = c.git.add },
    NvimTreeGitDirty = { fg = c.git.change },
    NvimTreeGitDeleted = { fg = c.git.delete },
    NvimTreeSpecialFile = { fg = c.yellow, underline = true },
    NvimTreeIndentMarker = { fg = c.fg_gutter },
    NvimTreeWinSeparator = { fg = c.border, bg = c.bg_sidebar },
  }
end

return M
