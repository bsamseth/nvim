-- vim.g.tokyonight_style = "night"
-- local colorscheme = "tokyonight"

local colorscheme = "gruvbox-material"

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  return
end
