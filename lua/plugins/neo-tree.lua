return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    cmd = "Neotree",
    keys = {
        { "<leader>t", "<cmd>Neotree left toggle reveal<CR>", desc = "NeoTree toggle" },
    },
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        require("neo-tree").setup({
            close_if_last_window = false,
            filesystem = {
                follow_current_file = { enabled = true },
                hijack_netrw_behavior = "open_default",
            },
        })
    end,
}
