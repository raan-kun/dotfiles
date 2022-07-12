local status_ok, autopairs = pcall(require, 'nvim-autopairs')
if not status_ok then
  return
end

local rule_status_ok, Rule = pcall(require, 'nvim-autopairs.rule')
if not status_ok then
  return
end

local autopairs = require('nvim-autopairs')
local Rule = require('nvim-autopairs.rule')

require('nvim-treesitter.configs').setup {
    ensure_installed = "all",
    highlight = {
        enabled = true,
        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = true,
    },
    indent = {
        enable = true,
        disable = { "python" }
    }
}

autopairs.setup {
    check_ts = true,
    ts_config = {
        lua = {'string'},
        javascript = {'template_string'},
        java = false,
    }
}

local ts_conds = require('nvim-autopairs.ts-conds')

autopairs.add_rules({
    Rule("%", "%", "lua")
        :with_pair(ts_conds.is_ts_node({'string', 'comment'})),
    Rule("$", "$", "lua")
    :with_pair(ts_conds.is_not_ts_node({'function'})),
})
