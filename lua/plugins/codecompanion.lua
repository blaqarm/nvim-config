-- CodeCompanion — AI-coding в стиле gptel (Emacs)
-- Настроен под локальную Ollama.
--
-- ПРЕДВАРИТЕЛЬНО:
--   1. pacman -S ollama
--   2. systemctl --user enable --now ollama    (или sudo systemctl enable --now ollama)
--   3. ollama pull qwen2.5-coder:7b            (модель по умолчанию — поменяй если хочется)
--      другие варианты: llama3.1:8b, deepseek-coder-v2:16b, codegemma:7b, phi4:14b
--
-- Команды:
--   :CodeCompanionChat           — открыть чат (аналог gptel-menu)
--   :CodeCompanionChat Toggle    — спрятать/показать
--   :CodeCompanion               — inline-правки по выделению
--   :CodeCompanionActions        — меню действий (объяснить, отрефакторить, добавить тесты)
--
-- Хоткеи (см. ниже):
--   <leader>aa — Actions
--   <leader>ac — Chat Toggle
--   <leader>ai — Inline (в визуальном выделении)
--   <leader>ap — Prompt Library

return {
	"olimorris/codecompanion.nvim",
	cmd = {
		"CodeCompanion",
		"CodeCompanionChat",
		"CodeCompanionActions",
		"CodeCompanionCmd",
	},
	keys = {
		{ "<leader>aa", "<cmd>CodeCompanionActions<CR>", mode = { "n", "v" }, desc = "AI Actions" },
		{ "<leader>ac", "<cmd>CodeCompanionChat Toggle<CR>", mode = { "n", "v" }, desc = "AI Chat Toggle" },
		{ "<leader>ai", ":CodeCompanion ", mode = { "n", "v" }, desc = "AI Inline prompt" },
		{ "<leader>ap", "<cmd>CodeCompanionActions<CR>", mode = "n", desc = "AI Prompt Library" },
		-- В visual: добавить выделение к активному чату
		{ "ga", "<cmd>CodeCompanionChat Add<CR>", mode = "v", desc = "AI: add selection to chat" },
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		adapters = {
			http = {
				-- ollama adapter под локальный инстанс
				ollama = function()
					return require("codecompanion.adapters").extend("ollama", {
						env = {
							url = "http://127.0.0.1:11434", -- дефолт ollama
						},
						schema = {
							model = {
								-- default = "qwen2.5-coder:7b",
								default = "qwen3:14b",
							},
							num_ctx = {
								default = 16384, -- размре контекста
							},
							num_predict = {
								default = -1,
							},
							think = {
								default = false,
							},
						},
					})
				end,
			},
		},
		strategies = {
			chat = { adapter = "ollama" },
			inline = { adapter = "ollama" },
			cmd = { adapter = "ollama" },
		},
		display = {
			chat = {
				window = {
					layout = "vertical",
					width = 0.35,
					position = "right",
					border = "single",
				},
				show_settings = true,
				show_token_count = true,
			},
			diff = {
				enabled = true,
				provider = "default",
			},
		},
		opts = {
			log_level = "ERROR",
		},
	},
}
