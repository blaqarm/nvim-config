-- neoscroll.nvim — плавный скролл
-- API: neoscroll.ctrl_u({ duration = 250 }) и т.п. (актуальный; set_mappings() deprecated)
--
-- На 240 Гц мониторе длительности 150–280ms ощущаются плавно, но не медлительно.
-- Если хочется быстрее — уменьши duration; медленнее — увеличь.
return {
    "karb94/neoscroll.nvim",
    event = "VeryLazy",
    config = function()
        local neoscroll = require("neoscroll")

        neoscroll.setup({
            mappings = {}, -- маппинги настраиваем вручную ниже
            hide_cursor          = true,
            stop_eof             = true,
            respect_scrolloff    = false,
            cursor_scrolls_alone = true,
            easing               = "sine", -- linear|quadratic|cubic|quartic|quintic|circular|sine
            duration_multiplier  = 1.0,
            performance_mode     = false,
        })

        local keymap = {
            ["<C-u>"] = function() neoscroll.ctrl_u({ duration = 180 }) end,
            ["<C-d>"] = function() neoscroll.ctrl_d({ duration = 180 }) end,
            ["<C-b>"] = function() neoscroll.ctrl_b({ duration = 280 }) end,
            ["<C-f>"] = function() neoscroll.ctrl_f({ duration = 280 }) end,
            ["<C-y>"] = function() neoscroll.scroll(-0.10, { move_cursor = false, duration = 80 }) end,
            ["<C-e>"] = function() neoscroll.scroll( 0.10, { move_cursor = false, duration = 80 }) end,
            ["zt"]    = function() neoscroll.zt({ half_win_duration = 120 }) end,
            ["zz"]    = function() neoscroll.zz({ half_win_duration = 120 }) end,
            ["zb"]    = function() neoscroll.zb({ half_win_duration = 120 }) end,
        }

        local modes = { "n", "v", "x" }
        for key, func in pairs(keymap) do
            vim.keymap.set(modes, key, func, { silent = true })
        end
    end,
}
