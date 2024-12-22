return {
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("lint").linters_by_ft = {
				javascript = { "eslint" },
				javascriptreact = { "eslint" },
				typescriptreact = { "eslint" },
				typescript = { "eslint" },
			}
			vim.api.nvim_create_autocmd({ "BufWritePost" }, {
				callback = function()
					require("lint").try_lint()
					require("lint").try_lint("cspell")
				end,
			})
		end,
	},
}
