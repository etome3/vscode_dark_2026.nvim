-- colors/vscode_dark_2026.lua
-- Neovim looks here when you run :colorscheme vscode_dark_2026

vim.opt.background = "dark"
vim.g.colors_name = "vscode_dark_2026"

local ok, lush = pcall(require, "lush")
if not ok then
  vim.notify(
    "vscode_dark_2026: lush.nvim is required. Add 'rktjmp/lush.nvim' to your plugins.",
    vim.log.levels.ERROR
  )
  return
end

lush(require("lush_theme.vscode_dark_2026"))
