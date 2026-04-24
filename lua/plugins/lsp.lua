-- LSP setup для Neovim 0.12
-- Используем нативный API vim.lsp.config() + vim.lsp.enable() из 0.11+
-- nvim-lspconfig нужен только чтобы подтянуть готовые пресеты (root_dir и т.п.)
return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		-- lazy = false,
		-- priority = 900,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"saghen/blink.cmp", -- capabilities
		},
		config = function()
			-- Capabilities от blink.cmp (для нормального автокомплита)
			local capabilities = vim.lsp.protocol.make_client_capabilities()
			local ok, blink = pcall(require, "blink.cmp")
			if ok then
				capabilities = blink.get_lsp_capabilities(capabilities)
			end

			-- Глобальный default для всех серверов
			vim.lsp.config("*", {
				capabilities = capabilities,
			})

			-- Lua (для самого nvim-конфига)
			vim.lsp.config("lua_ls", {
				settings = {
					Lua = {
						runtime = { version = "LuaJIT" },
						diagnostics = { globals = { "vim" } },
						workspace = {
							library = vim.api.nvim_get_runtime_file("", true),
							checkThirdParty = false,
						},
						telemetry = { enable = false },
					},
				},
			})

			-- TypeScript / JavaScript
			vim.lsp.config("ts_ls", {})

			-- HTML
			vim.lsp.config("html", {
				filetypes = { "html", "htmldjango", "php" },
			})

			-- CSS
			vim.lsp.config("cssls", {})

			-- Tailwind CSS
			vim.lsp.config("tailwindcss", {
				filetypes = {
					"html",
					"css",
					"scss",
					"javascript",
					"javascriptreact",
					"typescript",
					"typescriptreact",
					"vue",
					"svelte",
					"php",
				},
			})

			-- PHP — intelephense
			vim.lsp.config("intelephense", {
				settings = {
					intelephense = {
						files = { maxSize = 5000000 },
					},
				},
			})

			-- Python — pyright
			vim.lsp.config("pyright", {
				settings = {
					python = {
						analysis = {
							typeCheckingMode = "basic",
							autoSearchPaths = true,
							useLibraryCodeForTypes = true,
							diagnosticMode = "openFilesOnly",
						},
					},
				},
			})

			-- Emmet (html/css snippets в JSX и т.п.)
			vim.lsp.config("emmet_language_server", {
				filetypes = {
					"html",
					"css",
					"scss",
					"javascriptreact",
					"typescriptreact",
					"vue",
					"svelte",
					"php",
				},
			})

			-- Go
			vim.lsp.config("gopls", {
				settings = {
					gopls = {
						analyses = {
							unusedparams = true,
							shadow = true,
							nilness = true,
							unusedwrite = true,
							useany = true,
						},
						staticcheck = true,
						gofumpt = true, -- строже чем gofmt
						completeUnimported = true,
						usePlaceholders = true,
						hints = {
							assignVariableTypes = true,
							compositeLiteralFields = true,
							compositeLiteralTypes = true,
							constantValues = true,
							functionTypeParameters = true,
							parameterNames = true,
							rangeVariableTypes = true,
						},
					},
				},
			})

			-- Включаем серверы
			vim.lsp.enable({
				"lua_ls",
				"ts_ls",
				"html",
				"cssls",
				"tailwindcss",
				"intelephense",
				"pyright",
				"emmet_language_server",
				"gopls",
			})

			-- Keymaps при подключении LSP
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
				callback = function(ev)
					local opts = function(desc)
						return { buffer = ev.buf, desc = desc }
					end

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts("Goto definition"))
					vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts("Goto declaration"))
					vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts("Goto implementation"))
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts("References"))
					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts("Hover"))
					vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts("Signature help"))
					vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, opts("Type definition"))
					vim.keymap.set("n", "<leader>lr", vim.lsp.buf.rename, opts("Rename"))
					vim.keymap.set({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts("Code action"))
					vim.keymap.set("n", "<leader>lf", function()
						vim.lsp.buf.format({ async = true })
					end, opts("Format"))

					-- Диагностика
					vim.keymap.set("n", "[d", function()
						vim.diagnostic.jump({ count = -1 })
					end, opts("Prev diagnostic"))
					vim.keymap.set("n", "]d", function()
						vim.diagnostic.jump({ count = 1 })
					end, opts("Next diagnostic"))
					vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, opts("Line diagnostic"))
				end,
			})
		end,
	},
}
