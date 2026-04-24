return {
	"nvim-orgmode/orgmode",
	ft = { "org" },
	event = { "BufReadPre *.org", "BufNewFile *.org" },
	config = function()
		require("orgmode").setup({
			-- Где искать org-файлы для агенды
			org_agenda_files = { "~/org/**/*", "~/notes/**/*" },
			org_default_notes_file = "~/org/inbox.org",

			-- TODO states (как в Doom по умолчанию)
			org_todo_keywords = {
				"TODO(t)",
				"NEXT(n)",
				"WAITING(w)",
				"|",
				"DONE(d)",
				"CANCELLED(c)",
			},

			-- Цвета для TODO
			org_todo_keyword_faces = {
				NEXT = ":foreground #51afef :weight bold",
				WAITING = ":foreground #ECBE7B :weight bold",
				CANCELLED = ":foreground #585b70 :weight bold",
			},

			-- Внешний вид
			org_hide_leading_stars = true, -- прятать лишние * в заголовках
			org_startup_indented = true, -- визуальные отступы под уровни
			org_startup_folded = "content", -- открывать файл со свёрнутыми заголовками

			-- Поведение
			org_log_done = "time", -- при закрытии TODO ставить CLOSED: [timestamp]
			win_split_mode = "horizontal", -- split при открытии заметок снизу
		})
	end,
}
