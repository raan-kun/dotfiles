vim.g.catppuccin_flavour = 'frappe'
local colorscheme = 'catppuccin'

local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
    return
end
