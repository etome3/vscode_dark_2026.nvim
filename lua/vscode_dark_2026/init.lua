local Config = require("vscode_dark_2026.config")

local M = {}

M.setup = Config.setup

---@param colors table
local function set_terminal(colors)
  vim.g.terminal_color_0 = colors.terminal.black
  vim.g.terminal_color_8 = colors.terminal.black_bright
  vim.g.terminal_color_1 = colors.terminal.red
  vim.g.terminal_color_9 = colors.terminal.red_bright
  vim.g.terminal_color_2 = colors.terminal.green
  vim.g.terminal_color_10 = colors.terminal.green_bright
  vim.g.terminal_color_3 = colors.terminal.yellow
  vim.g.terminal_color_11 = colors.terminal.yellow_bright
  vim.g.terminal_color_4 = colors.terminal.blue
  vim.g.terminal_color_12 = colors.terminal.blue_bright
  vim.g.terminal_color_5 = colors.terminal.magenta
  vim.g.terminal_color_13 = colors.terminal.magenta_bright
  vim.g.terminal_color_6 = colors.terminal.cyan
  vim.g.terminal_color_14 = colors.terminal.cyan_bright
  vim.g.terminal_color_7 = colors.terminal.white
  vim.g.terminal_color_15 = colors.terminal.white_bright
end

---@param opts? vscode_dark_2026.Config
function M.load(opts)
  opts = Config.extend(opts)
  local colors = require("vscode_dark_2026.colors").setup(opts)
  local groups = require("vscode_dark_2026.groups").setup(colors, opts)

  if vim.g.colors_name then
    vim.cmd("hi clear")
  end

  vim.o.background = "dark"
  vim.o.termguicolors = true
  vim.g.colors_name = "vscode_dark_2026"

  for group, spec in pairs(groups) do
    vim.api.nvim_set_hl(0, group, spec)
  end

  if opts.terminal_colors then
    set_terminal(colors)
  end

  return colors, groups, opts
end

return M
