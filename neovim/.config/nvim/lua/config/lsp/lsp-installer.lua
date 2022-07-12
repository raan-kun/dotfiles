local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
    return
end

local servers = {
    "sumneko_lua",
    "cssls",
    "html",
    "tsserver",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
}

lsp_installer.setup()

local lspconfig_status_ok, lspconfig = pcall(require, "lspconfig")
if not lspconfig_status_ok then
    return
end

local opts = {}

-- for _, server in pairs(servers) do
for _, server in ipairs(lsp_installer.get_installed_servers()) do
    opts = {
        on_attach = require("config.lsp.handlers").on_attach,
        capabilities = require("config.lsp.handlers").capabilities,
    }

    -- if server == "sumneko_lua" then
    --     local sumneko_opts = require "config.lsp.settings.sumneko_lua"
    --     opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
    -- end
    --
    -- if server == "pyright" then
    --     local pyright_opts = require "config.lsp.settings.pyright"
    --     opts = vim.tbl_deep_extend("force", pyright_opts, opts)
    -- end

    -- lspconfig[server].setup(opts)

    local cfg_exist, server_opt = pcall(require, "config.lsp.settings." .. server.name)
    if cfg_exist then
        opts = vim.tbl_deep_extend("force", server_opt, opts)
    end

    lspconfig[server.name].setup(opts)
end

