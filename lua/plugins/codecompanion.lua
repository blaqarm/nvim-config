-- CodeCompanion — AI-coding в стиле gptel (Emacs)
-- Настроен под локальную Ollama, две модели под разные роли.
--
-- МОДЕЛИ (обе должны быть скачаны — проверь `ollama list`):
--   ollama pull qwen3-coder:30b     — агентный чат (тулзы, многошаговые задачи)
--   ollama pull qwen2.5-coder:7b    — быстрый чат + inline-правки
--
-- Команды:
--   :CodeCompanionChat              — агентный чат на 30B
--   :CodeCompanionChat ollama_fast  — быстрый чат на 7B
--   :CodeCompanionChat Toggle       — спрятать/показать
--   :CodeCompanion                  — inline-правки по выделению
--   :CodeCompanionActions           — меню действий (объяснить, отрефакторить, тесты)
--
-- Хоткеи:
--   <leader>aa — Actions
--   <leader>ac — Агентный чат на 30B (Toggle)
--   <leader>aq — Быстрый чат на 7B
--   <leader>ai — Inline (в визуальном выделении)
--   <leader>ap — Prompt Library
--
-- Агентность: открой чат (<leader>ac) и внутри буфера пиши теги инструментов —
--   @insert_edit_into_file (правит код в буфере), @run_command (запускает команды).
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
		{ "<leader>ac", "<cmd>CodeCompanionChat Toggle<CR>", mode = { "n", "v" }, desc = "AI Chat (agent 30B)" },
		{ "<leader>aq", "<cmd>CodeCompanionChat ollama_fast<CR>", mode = { "n", "v" }, desc = "AI Chat (fast 7B)" },
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
				-- Основной адаптер: агентный чат на сильной модели
				ollama = function()
					return require("codecompanion.adapters").extend("ollama", {
						env = {
							url = "http://127.0.0.1:11434",
						},
						schema = {
							model = {
								default = "qwen3-coder:30b",
							},
							num_ctx = {
								default = 16384, -- если ollama ps покажет спилл на CPU — снизь до 12288/8192
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
				-- Быстрый адаптер: лёгкий чат и inline на 7B
				ollama_fast = function()
					return require("codecompanion.adapters").extend("ollama", {
						env = {
							url = "http://127.0.0.1:11434",
						},
						schema = {
							model = {
								default = "qwen2.5-coder:7b",
							},
							num_ctx = {
								default = 8192,
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
			-- минус встроенные адаптеры
			opts = {
				show_defaults = false,
			},
		},
		strategies = {
			chat = { adapter = "ollama" },
			inline = { adapter = "ollama_fast" },
			cmd = { adapter = "ollama_fast" },
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
			-- log_level = "DEBUG",
		},
	},
}
