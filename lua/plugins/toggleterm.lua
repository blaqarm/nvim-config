return {
  {
    "akinsho/toggleterm.nvim",
    version = "*",

    -- lazy будет загружать плагин по нажатию Ctrl+\
    keys = {
      { "<C-\\>", "<cmd>ToggleTerm<cr>", desc = "Toggle terminal" },
    },

    config = function()
      vim.opt.shell = "/usr/bin/zsh"

      require("toggleterm").setup({
        open_mapping = [[<C-\\>]], 
        direction = "horizontal", -- вроде в старом было horizontal а не float
--        float_opts = {
--          border = "rounded",
--        },
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        close_on_exit = true,
      })

      -- Маппинги только внутри toggleterm
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*toggleterm#*",
        callback = function()
          local opts = { buffer = 0, silent = true }
          vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], opts)
          vim.keymap.set("t", "jk", [[<C-\><C-n>]], opts)
          vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
          vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
          vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
          vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
        end,
      })
    end,
  },
}
