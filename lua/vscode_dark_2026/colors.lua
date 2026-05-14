local Util = require("vscode_dark_2026.util")

local M = {}

---@param opts vscode_dark_2026.Config
function M.setup(opts)
  local c = {
    none = "NONE",

    bg = "#0e0e0e",
    bg_dark = "#090909",
    bg_sidebar = "#141414",
    bg_float = "#181818",
    bg_popup = "#1f1f1f",
    bg_statusline = "#141414",
    bg_highlight = "#1a1a1a",
    bg_visual = "#213355",
    bg_search = "#2d4f7c",
    bg_widget = "#2a2a2a",

    fg = "#c9d1d9",
    fg_dark = "#8b949e",
    fg_gutter = "#4e5462",
    fg_sidebar = "#aeb7c2",
    fg_float = "#c9d1d9",

    border = "#30363d",
    border_highlight = "#58a6ff",
    comment = "#8b949e",

    red = "#ff7b72",
    red1 = "#f85149",
    orange = "#ffa657",
    yellow = "#dcdcaa",
    gold = "#ffd700",
    green = "#b5cea8",
    green1 = "#3fb950",
    teal = "#4ec9b0",
    cyan = "#a5d6ff",
    blue = "#569cd6",
    blue1 = "#79c0ff",
    blue2 = "#58a6ff",
    purple = "#c586c0",
    magenta = "#d2a8ff",
    pink = "#da70d6",
    bracket = "#bbbebf",

    error = "#f85149",
    warning = "#d29922",
    info = "#58a6ff",
    hint = "#b5cea8",

    git = {
      add = "#3fb950",
      change = "#d29922",
      delete = "#f85149",
      ignore = "#4e5462",
    },
  }

  Util.bg = c.bg
  Util.fg = c.fg

  c.bg_normal = opts.transparent and c.none or c.bg
  c.bg_sidebar = opts.transparent and c.none or c.bg_sidebar
  c.bg_float = opts.transparent and c.none or c.bg_float
  c.bg_popup = opts.transparent and c.none or c.bg_popup
  c.bg_statusline = opts.transparent and c.none or c.bg_statusline
  c.bg_dim = opts.dim_inactive and "#0b0b0b" or c.bg_normal

  c.diff = {
    add = Util.blend_bg(c.git.add, 0.16),
    change = Util.blend_bg(c.git.change, 0.14),
    delete = Util.blend_bg(c.git.delete, 0.16),
    text = Util.blend_bg(c.git.change, 0.32),
  }

  c.virtual_text = {
    error = Util.blend_bg(c.error, 0.13),
    warning = Util.blend_bg(c.warning, 0.12),
    info = Util.blend_bg(c.info, 0.12),
    hint = Util.blend_bg(c.hint, 0.12),
  }

  c.rainbow = {
    c.gold,
    c.pink,
    "#179fff",
    c.gold,
    c.pink,
    "#179fff",
    c.gold,
  }

  c.terminal = {
    black = c.bg_dark,
    black_bright = c.fg_gutter,
    red = c.red1,
    red_bright = c.red,
    green = c.green1,
    green_bright = c.green,
    yellow = c.warning,
    yellow_bright = c.gold,
    blue = c.blue,
    blue_bright = c.blue2,
    magenta = c.magenta,
    magenta_bright = c.pink,
    cyan = c.teal,
    cyan_bright = c.cyan,
    white = c.fg_dark,
    white_bright = c.fg,
  }

  opts.on_colors(c)
  return c
end

return M
