return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		local parsers = {
			"lua",
			"vim",
			"vimdoc",
			"query",
			"javascript",
			"typescript",
			"tsx",
			"html",
			"css",
			"scss",
			"php",
			"phpdoc",
			"python",
			"json",
			"yaml",
			"toml",
			"markdown",
			"markdown_inline",
			"bash",
			"regex",
			"diff",
		}

		local ok, ts = pcall(require, "nvim-treesitter")
		if ok and ts.install then
			ts.install(parsers)
		else
			vim.notify("nvim-treesitter: module not ready, run :TSInstall manually", vim.log.levels.WARN)
		end

		vim.api.nvim_create_autocmd("FileType", {
			callback = function(args)
				local ft = vim.bo[args.buf].filetype
				local lang = vim.treesitter.language.get_lang(ft) or ft
				if lang and pcall(vim.treesitter.start, args.buf, lang) then
					pcall(function()
						vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
					end)
				end
			end,
		})
	end,
}
