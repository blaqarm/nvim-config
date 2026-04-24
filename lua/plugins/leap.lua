return {
    url = "https://codeberg.org/andyg/leap.nvim",
    -- альтернатива: "ggandor/leap.nvim"
    lazy = false,
    config = function()
        require("leap")

        vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)",  { desc = "Leap forward" })
        vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)", { desc = "Leap backward" })
    end,
}
