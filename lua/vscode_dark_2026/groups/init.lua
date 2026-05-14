local Util = require("vscode_dark_2026.util")

local M = {}

M.plugins = {
  ["blink.cmp"] = "blink",
  ["flash.nvim"] = "flash",
  ["fzf-lua"] = "fzf",
  ["gitsigns.nvim"] = "gitsigns",
  ["indent-blankline.nvim"] = "indent-blankline",
  ["lazy.nvim"] = "lazy",
  ["neo-tree.nvim"] = "neo-tree",
  ["noice.nvim"] = "noice",
  ["nvim-cmp"] = "cmp",
  ["nvim-notify"] = "notify",
  ["nvim-tree.lua"] = "nvim-tree",
  ["rainbow-delimiters.nvim"] = "rainbow",
  ["render-markdown.nvim"] = "render-markdown",
  ["telescope.nvim"] = "telescope",
  ["trouble.nvim"] = "trouble",
  ["vim-gitgutter"] = "gitgutter",
  ["which-key.nvim"] = "which-key",
}

local base = {
  base = true,
  kinds = true,
  semantic_tokens = true,
  treesitter = true,
}

---@param name string
function M.get_group(name)
  return Util.mod("vscode_dark_2026.groups." .. name)
end

---@param name string
---@param colors table
---@param opts vscode_dark_2026.Config
function M.get(name, colors, opts)
  return M.get_group(name).get(colors, opts)
end

---@param opts vscode_dark_2026.Config
local function enabled_groups(opts)
  local groups = vim.deepcopy(base)

  if opts.plugins.all then
    for _, group in pairs(M.plugins) do
      groups[group] = true
    end
  elseif opts.plugins.auto and package.loaded.lazy then
    local ok, lazy_config = pcall(require, "lazy.core.config")
    if ok then
      for plugin, group in pairs(M.plugins) do
        if lazy_config.plugins[plugin] then
          groups[group] = true
        end
      end
    end
  end

  for plugin, group in pairs(M.plugins) do
    local use = opts.plugins[group]
    if use == nil then
      use = opts.plugins[plugin]
    end
    if type(use) == "table" then
      use = use.enabled
    end
    if use ~= nil then
      groups[group] = use or nil
    end
  end

  return groups
end

---@param colors table
---@param opts vscode_dark_2026.Config
function M.setup(colors, opts)
  local ret = {}
  local groups = enabled_groups(opts)
  local names = vim.tbl_keys(groups)
  table.sort(names)

  for _, name in ipairs(names) do
    for group, spec in pairs(M.get(name, colors, opts)) do
      ret[group] = spec
    end
  end

  Util.resolve(ret)
  opts.on_highlights(ret, colors)
  Util.resolve(ret)

  return ret, groups
end

return M
