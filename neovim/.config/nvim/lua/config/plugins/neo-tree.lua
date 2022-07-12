local status_ok, neotree = pcall(require, 'neo-tree')
if not status_ok then
  return
end

neotree.setup {
    default_component_configs = {
    },
    window = {
        position = 'float',
        popup = {
            size = {
                height = "60%",
                width = "40%",
            },
            position = "50%"
        },
        mappings = {
            ["h"] = function(state)
                local node = state.tree:get_node()
                if node.type == 'directory' and node:is_expanded() then
                    require'neo-tree.sources.filesystem'.toggle_directory(state, node)
                else
                    require'neo-tree.ui.renderer'.focus_node(state, node:get_parent_id())
                end
            end,
            ["l"] = function(state)
                local node = state.tree:get_node()
                if node.type == 'directory' then
                    if not node:is_expanded() then
                        require'neo-tree.sources.filesystem'.toggle_directory(state, node)
                    elseif node:has_children() then
                        require'neo-tree.ui.renderer'.focus_node(state, node:get_child_ids()[1])
                    end
                end
            end,
        }
    }
}

