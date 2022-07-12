local plugin_cfgs = {
    'config.plugins.autopairs',
    'config.plugins.cmp',
    'config.plugins.comment',
    'config.plugins.dashboard',
    -- 'config.plugins.feline',
    'config.plugins.lualine',
    'config.plugins.nvim-tree',
    'config.plugins.telescope',
    -- 'config.plugins.tabline',
    'config.plugins.toggleterm',
    'config.plugins.treesitter',
    'config.plugins.ts-autotag',
    'config.plugins.web-devicons',
}

for _, v in pairs(plugin_cfgs) do
    package.loaded[v] = nil
    require(v)
end

vim.cmd [[
augroup user_cfg_hot_reload
    autocmd!
    autocmd BufWritePost */lua/config/plugins/*.lua source <afile>
augroup end
]]
