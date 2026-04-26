-- return {
-- 	"nvimdev/dashboard-nvim",
-- 	event = "VimEnter",
-- 	dependencies = { "nvim-tree/nvim-web-devicons" },
-- 	config = function()
-- 		vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#ed2939", bold = true }) -- imperial red
-- 		require("dashboard").setup({
-- 			theme = "hyper",
-- 			config = {
-- 				header = {
-- 					[[                      ███  ██ ██  ██ ██ ██▄  ▄██                         ]],
-- 					[[                      ██ ▀▄██ ██▄▄██ ██ ██ ▀▀ ██                         ]],
-- 					[[                      ██   ██  ▀██▀  ██ ██    ██                         ]],
-- 					[[                                                                         ]],
-- 					[[                                                                         ]],
-- 					[[                                                                         ]],
-- 					[[                                                                         ]],
-- 					[[                                                                         ]],
-- 					[[                                                                         ]],
-- 				},
-- 				shortcut = {
-- 					{ desc = "󰊳 Update", group = "@property", action = "Lazy update", key = "u" },
-- 					{
-- 						icon = " ",
-- 						icon_hl = "@variable",
-- 						desc = "Files",
-- 						group = "Label",
-- 						action = "Telescope find_files",
-- 						key = "ff",
-- 					},
-- 					{
-- 						desc = " Menu",
-- 						group = "DiagnosticHint",
-- 						action = "Neotree left toggle reveal",
-- 						key = "t",
-- 					},
-- 					{
-- 						desc = "󰚩 AI Chat",
-- 						group = "String",
-- 						action = "CodeCompanionChat",
-- 						key = "a",
-- 					},
-- 				},
-- 			},
-- 		})
-- 	end,
-- }
--
--

return {
	"nvimdev/dashboard-nvim",
	event = "VimEnter",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		vim.api.nvim_create_autocmd("ColorScheme", {
			pattern = "*",
			callback = function()
				vim.api.nvim_set_hl(0, "DashboardHeader", { fg = "#B22222", bold = true }) -- imperial red
				vim.api.nvim_set_hl(0, "DashMenu", { fg = "#ed2939", bold = true })
				vim.api.nvim_set_hl(0, "DashAI", { fg = "#ed2939", italic = true })
				vim.api.nvim_set_hl(0, "DashUpdate", { fg = "#ed2939" })
				vim.api.nvim_set_hl(0, "DashFiles", { fg = "#ed2939" })

				vim.api.nvim_set_hl(0, "DashboardShortCutIcon", { fg = "#ff0000", italic = true })
				vim.api.nvim_set_hl(0, "DashboardShortCut", { fg = "#ff0000", italic = true })
			end,
		})
		vim.cmd("doautocmd ColorScheme")

		require("dashboard").setup({
			theme = "hyper",
			config = {
				header = {
					[[                      ███  ██ ██  ██ ██ ██▄  ▄██                         ]],
					[[                      ██ ▀▄██ ██▄▄██ ██ ██ ▀▀ ██                         ]],
					[[                      ██   ██  ▀██▀  ██ ██    ██                         ]],
					[[                                                                         ]],
					[[                                                                         ]],
					[[                                                                         ]],
					[[                                                                         ]],
					[[                                                                         ]],
					[[                                                                         ]],
				},
				shortcut = {
					{
						desc = "󰊳 Update",
						group = "DashUpdate",
						action = "Lazy update",
						key = "u",
					},
					{
						icon = " ",
						icon_hl = "DashFiles",
						desc = "Files",
						group = "DashFiles",
						action = "Telescope find_files",
						key = "ff",
					},
					{
						desc = " Menu",
						group = "DashMenu",
						action = "Neotree left toggle reveal",
						key = "t",
					},
					{
						desc = "󰚩 AI Chat",
						group = "DashAI",
						action = "CodeCompanionChat",
						key = "a",
					},
				},
				footer = {},
			},
		})
	end,
}
