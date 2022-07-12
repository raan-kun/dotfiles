local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

lualine.setup {
    options = {
        icons_enabled = true,
        theme = 'catppuccin',
        -- section_separators = { left = '', right = ''},
        --section_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        -- component_separators = { left = '/', right = '/'},
        --component_separators = { left = '', right = ''},

        section_separators   = { left = '', right = ''},
        component_separators = { left = '', right = ''},

        -- section_separators   = { left = '', right = ''},
        -- component_separators = { left = '', right = ''},

        disabled_filetypes = {},
        always_divide_middle = false,
        globalstatus = true,
    },

    sections = {
        lualine_a = {'branch'},
        lualine_b = {
            {
                'filename',
                file_status = true,
                path = 1,
                symbols = {
                    modified = ' '
                },
                disabled_buftypes = { 'TelescopePrompt', 'quickfix', 'prompt' }
            },
            'diff',
        },
        lualine_c = {{'diagnostics', sources = {'nvim_lsp', 'nvim_diagnostic'}}},
        lualine_x = {'location'},
        lualine_y = {'filetype'},
        lualine_z = {'mode'}
    },

    inactive_sections = {
        lualine_a = {},
        lualine_b = {{'filename', file_status=true, path=1}, { 'diff', colored=false }},
        lualine_c = {{'diagnostics', sources = {'ale', 'nvim_diagnostic', 'coc'}, always_visible = true, colored=false}},
        lualine_x = {{'filetype'}},
        lualine_y = {},
        lualine_z = {}
    },

    tabline = {
        lualine_a = {{
            'windows',
            show_filename_only = false,
        }},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {{ 'tabs', mode=0, tabs_color={ inactive = 'lualine_c_inactive' }, max_length = vim.o.columns*3/4 }},
    },

    extensions = { 'toggleterm', 'nvim-tree', 'man' }
}
