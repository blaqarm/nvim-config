return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      -- регистрируем конфиги серверов
      vim.lsp.config("lua_ls", {})
      vim.lsp.config("ts_ls", {})
      vim.lsp.config("html", {})
      vim.lsp.config("phpactor", {})
      vim.lsp.config("cssls", {})

      -- включаем сервера (можно запускать при старте)
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("ts_ls")
      vim.lsp.enable("html")
      vim.lsp.enable("phpactor")
      vim.lsp.enable("cssls")

      -- автокоманда с keymaps, как у тебя
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

          local opts = { buffer = ev.buf }
          vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
          vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
          vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
          vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
          vim.keymap.set("n", "<Leader>D", vim.lsp.buf.type_definition, opts)
          vim.keymap.set("n", "<Leader>lr", vim.lsp.buf.rename, opts)
          vim.keymap.set({ "n", "v" }, "<Leader>la", vim.lsp.buf.code_action, opts)
          vim.keymap.set("n", "<Leader>lf", function()
            vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    end,
  },
}

