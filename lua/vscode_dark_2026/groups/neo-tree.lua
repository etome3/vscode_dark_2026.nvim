local M = {}

---@param c table
function M.get(c)
  return {
    NeoTreeNormal = { fg = c.fg_sidebar, bg = c.bg_sidebar },
    NeoTreeNormalNC = { fg = c.fg_sidebar, bg = c.bg_sidebar },
    NeoTreeFloatBorder = "FloatBorder",
    NeoTreeTitleBar = { fg = c.bg, bg = c.blue2, bold = true },
    NeoTreeRootName = { fg = c.magenta, bold = true },
    NeoTreeDirectoryName = { fg = c.teal },
    NeoTreeDirectoryIcon = { fg = c.teal },
    NeoTreeFileName = { fg = c.fg_sidebar },
    NeoTreeFileIcon = { fg = c.fg_sidebar },
    NeoTreeIndentMarker = { fg = c.fg_gutter },
    NeoTreeSymbolicLinkTarget = { fg = c.cyan },
    NeoTreeGitAdded = { fg = c.git.add },
    NeoTreeGitModified = { fg = c.git.change },
    NeoTreeGitDeleted = { fg = c.git.delete },
    NeoTreeGitUntracked = { fg = c.comment },
    NeoTreeTabActive = { fg = c.fg, bg = c.bg },
    NeoTreeTabInactive = { fg = c.fg_dark, bg = c.bg_statusline },
  }
end

return M
