return {
	{
		'nvim-treesitter/nvim-treesitter',

		config = function()
			require('nvim-treesitter.configs').setup({
				ensure_installed = { "lua", "javascript", "typescript", "html", "php", "css"},
				auto_install = true,
				highlight = {
					enable = true,
			    }
			})
		end
	}
}
