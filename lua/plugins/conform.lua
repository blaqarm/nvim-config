-- conform.nvim — современный форматтер
-- Форматирует по <leader>lf (в lsp.lua уже есть, но conform приоритетнее)
-- и по <leader>lF (принудительно через conform)
return {
    "stevearc/conform.nvim",
    event = { "BufWritePre" },
    cmd = { "ConformInfo" },
    keys = {
        {
            "<leader>lF",
            function()
                require("conform").format({ async = true, lsp_fallback = true })
            end,
            mode = { "n", "v" },
            desc = "Format (conform)",
        },
    },
    opts = {
        formatters_by_ft = {
            lua        = { "stylua" },
            python     = { "isort", "black" },
            javascript = { "prettierd", "prettier", stop_after_first = true },
            typescript = { "prettierd", "prettier", stop_after_first = true },
            javascriptreact = { "prettierd", "prettier", stop_after_first = true },
            typescriptreact = { "prettierd", "prettier", stop_after_first = true },
            html       = { "prettierd", "prettier", stop_after_first = true },
            css        = { "prettierd", "prettier", stop_after_first = true },
            scss       = { "prettierd", "prettier", stop_after_first = true },
            json       = { "prettierd", "prettier", stop_after_first = true },
            yaml       = { "prettierd", "prettier", stop_after_first = true },
            markdown   = { "prettierd", "prettier", stop_after_first = true },
            php        = { "php_cs_fixer" },
        },
        -- Форматировать при сохранении, но не ронять сохранение если форматтер не найден
        format_on_save = function(bufnr)
            -- можно выключить точечно: vim.b[bufnr].disable_autoformat = true
            if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
                return
            end
            return { timeout_ms = 1500, lsp_fallback = true }
        end,
    },
    init = function()
        -- Команды переключения autoformat
        vim.api.nvim_create_user_command("FormatDisable", function(args)
            if args.bang then
                vim.b.disable_autoformat = true
            else
                vim.g.disable_autoformat = true
            end
        end, { desc = "Disable autoformat-on-save", bang = true })

        vim.api.nvim_create_user_command("FormatEnable", function()
            vim.b.disable_autoformat = false
            vim.g.disable_autoformat = false
        end, { desc = "Enable autoformat-on-save" })
    end,
}
