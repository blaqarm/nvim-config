-- Comment.nvim — комментирование строк
-- Хоткеи:
--   <leader>-  — переключить комментарий (n/v), как в Doom Emacs SPC c l / SPC -
--   gcc        — одна строка (встроенный gcc тоже работает, но Comment.nvim умнее)
--   gc{motion} — по моушену (gcap, gcG и т.п.)
--   gbc / gb   — блочный комментарий (/* */ вместо //)
return {
    "numToStr/Comment.nvim",
    keys = {
        { "<leader>-", mode = "n", desc = "Toggle comment line" },
        { "<leader>-", mode = "v", desc = "Toggle comment selection" },
        { "gc",        mode = { "n", "v" } },
        { "gb",        mode = { "n", "v" } },
    },
    config = function()
        require("Comment").setup({
            -- Тут уже есть контекст-зависимый commentstring (TS/JSX/Tailwind)
            -- если установлен nvim-ts-context-commentstring. Мы его поставим ниже как доп.
            toggler   = { line = "gcc", block = "gbc" },
            opleader  = { line = "gc",  block = "gb"  },
            extra     = { above = "gcO", below = "gco", eol = "gcA" },
            mappings  = { basic = true, extra = true },
        })

        -- <leader>- : умный тогл
        local api = require("Comment.api")
        local esc = vim.api.nvim_replace_termcodes("<ESC>", true, false, true)

        vim.keymap.set("n", "<leader>-", api.toggle.linewise.current,
            { desc = "Toggle comment line" })

        vim.keymap.set("v", "<leader>-", function()
            vim.api.nvim_feedkeys(esc, "nx", false)
            api.toggle.linewise(vim.fn.visualmode())
        end, { desc = "Toggle comment selection" })
    end,
}
