local modules = {
    'config.options',
    'config.packer',
    'config.colorscheme',
    'config.plugins',
    'config.lsp',
    'config.keymaps',
}

for _, m in pairs(modules) do
    package.loaded[m] = nil
    require(m)
end
