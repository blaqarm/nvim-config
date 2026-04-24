return {
    "navarasu/onedark.nvim",
    priority = 1000, -- colorscheme должен грузиться первым
    lazy = false,
    config = function()
        require("onedark").setup({
            transparent = true,
        })
        require("onedark").load()
    end,
}
