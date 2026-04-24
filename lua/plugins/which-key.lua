-- which-key — всплывающая подсказка клавиш под лидером (как в Doom Emacs)
return {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = {
        preset = "modern",
        delay = 300,
        icons = {
            mappings = vim.g.have_nerd_font ~= false,
        },
        spec = {
            { "<leader>f", group = "find" },
            { "<leader>l", group = "lsp" },
            { "<leader>a", group = "ai" },
            { "<leader>g", group = "git" },
        },
    },
    keys = {
        {
            "<leader>?",
            function() require("which-key").show({ global = false }) end,
            desc = "Buffer keymaps (which-key)",
        },
    },
}
