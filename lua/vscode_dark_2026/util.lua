local M = {}

M.bg = "#0e0e0e"
M.fg = "#c9d1d9"

---@param color string
---@return integer[]
local function rgb(color)
  color = color:lower()
  return {
    tonumber(color:sub(2, 3), 16),
    tonumber(color:sub(4, 5), 16),
    tonumber(color:sub(6, 7), 16),
  }
end

---@param foreground string
---@param alpha number
---@param background string
function M.blend(foreground, alpha, background)
  local fg = rgb(foreground)
  local bg = rgb(background)

  local function channel(i)
    local value = alpha * fg[i] + (1 - alpha) * bg[i]
    return math.floor(math.min(math.max(value, 0), 255) + 0.5)
  end

  return string.format("#%02x%02x%02x", channel(1), channel(2), channel(3))
end

function M.blend_bg(color, alpha, bg)
  return M.blend(color, alpha, bg or M.bg)
end

function M.blend_fg(color, alpha, fg)
  return M.blend(color, alpha, fg or M.fg)
end

---@param groups table<string, string|table>
function M.resolve(groups)
  for name, spec in pairs(groups) do
    if type(spec) == "string" then
      groups[name] = { link = spec }
    elseif type(spec.style) == "table" then
      for key, value in pairs(spec.style) do
        spec[key] = value
      end
      spec.style = nil
    end
  end
  return groups
end

---@param name string
function M.mod(name)
  if package.loaded[name] then
    return package.loaded[name]
  end
  return require(name)
end

return M
