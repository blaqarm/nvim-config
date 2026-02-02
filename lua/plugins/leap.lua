return {
	"ggandor/leap.nvim",
	lazy = false,
	config = function()
		-- старая тема
		--require("leap").add_default_mappings(true)
		require("leap")

    -- прыжки
    vim.keymap.set({ "n", "x", "o" }, "s", "<Plug>(leap-forward)",  { desc = "Leap forward" })
    vim.keymap.set({ "n", "x", "o" }, "S", "<Plug>(leap-backward)", { desc = "Leap backward" })

    -- прыжок между окнами
    --vim.keymap.set({ "n", "x", "o" }, "gs", "<Plug>(leap-from-window)", { desc = "Leap from window" })
	end,
}
