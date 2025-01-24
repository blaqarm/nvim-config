return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	config = function()
		vim.diagnostic.config({
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
			},
		})
		    require("neo-tree").setup({
				close_if_last_window = false,
			})
		end,
}


--return {
--	"nvim-neo-tree/neo-tree.nvim",
--	branch = "v3.x",
--	dependencies = {
--		"nvim-lua/plenary.nvim",
--		"nvim-tree/nvim-web-devicons",
--		"MunifTanjim/nui.nvim",
--	},
--	config = function()
--
--	require("neo-tree").setup({
--	  close_if_last_window = true, -- Закрывать Neo-tree, если это последний буфер
--	  enable_git_status = true,   -- Включить отображение статуса Git
--	  enable_diagnostics = true,  -- Включить диагностику
--	  default_component_configs = {
--		icon = {
--		  folder_closed = "",
--		  folder_open = "",
--		  folder_empty = "",
--		  default = "*",
--		},
--		diagnostics = {
--		  symbols = {
--			hint = "",
--			info = "",
--			warn = "",
--			error = "",
--		  },
--		},
--	  },
--	  filesystem = {
--		follow_current_file = {
--		  enabled = true,  -- Следовать за открытым файлом
--		},
--		group_empty_dirs = true,  -- Группировать пустые папки
--	  },
--	})
--	end
--}
