-- Mason + mason-lspconfig v2
-- В v2 API сильно упростился: просто перечисляем сервера в ensure_installed,
-- а саму конфигурацию серверов делаем через vim.lsp.config() в lsp.lua.
return {
    {
        "williamboman/mason.nvim",
        cmd = { "Mason", "MasonInstall", "MasonUpdate", "MasonUninstall" },
        build = ":MasonUpdate",
        opts = {
            ui = {
                border = "rounded",
                icons = {
                    package_installed   = "✓",
                    package_pending     = "➜",
                    package_uninstalled = "✗",
                },
            },
        },
    },
    {
        "williamboman/mason-lspconfig.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "lua_ls",
                "ts_ls",
                "html",
                "cssls",
                "tailwindcss",
                "intelephense",
                "pyright",
                "emmet_language_server",
            },
            automatic_installation = true,
        },
    },
    -- Установка форматтеров / линтеров
    {
        "WhoIsSethDaniel/mason-tool-installer.nvim",
        dependencies = { "williamboman/mason.nvim" },
        opts = {
            ensure_installed = {
                "stylua",       -- Lua
                "prettierd",    -- JS/TS/HTML/CSS/JSON/MD
                "black",        -- Python
                "isort",        -- Python imports
                "php-cs-fixer", -- PHP
                "eslint_d",     -- JS/TS линтер
            },
            auto_update = false,
            run_on_start = true,
        },
    },
}
