return {
    "nvim-telescope/telescope.nvim",
    branch = "master",
    cmd = "Telescope",
    dependencies = {
        "nvim-lua/plenary.nvim",
        {
            "nvim-telescope/telescope-fzf-native.nvim",
            build = "make",
            cond = function() return vim.fn.executable("make") == 1 end,
        },
    },
    keys = {
        { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Find files" },
        { "<leader>fw", function() require("telescope.builtin").live_grep() end,  desc = "Live grep" },
        { "<leader>fb", function() require("telescope.builtin").buffers() end,    desc = "Buffers" },
        { "<leader>fh", function() require("telescope.builtin").help_tags() end,  desc = "Help tags" },
        { "<leader>fr", function() require("telescope.builtin").oldfiles() end,   desc = "Recent files" },
        { "<leader>fd", function() require("telescope.builtin").diagnostics() end, desc = "Diagnostics" },
        { "<leader>fs", function() require("telescope.builtin").lsp_document_symbols() end, desc = "Document symbols" },
    },
    config = function()
        local telescope = require("telescope")
        telescope.setup({
            defaults = {
                prompt_prefix = "   ",
                selection_caret = "  ",
                sorting_strategy = "ascending",
                layout_config = {
                    prompt_position = "top",
                    horizontal = { preview_width = 0.55 },
                },
                path_display = { "truncate" },
            },
        })
        pcall(telescope.load_extension, "fzf")
    end,
}
