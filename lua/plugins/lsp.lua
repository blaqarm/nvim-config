return {
	{
		'neovim/nvim-lspconfig',
		config = function()
			local lspconfig = require('lspconfig')
			lspconfig.lua_ls.setup{}
			lspconfig.ts_ls.setup{}
			lspconfig.html.setup{}
			lspconfig.phpactor.setup{
			cmd = { "phpactor", "language-server" },  -- Явно указываем путь, если Mason не используется
  root_dir = lspconfig.util.root_pattern("composer.json", ".git"),}
			lspconfig.cssls.setup{}
			vim.api.nvim_create_autocmd('LspAttach', {
			    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

					local opts = {buffer = ev.buf}
					vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
					vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
					vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
				    vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
					vim.keymap.set('n', '<Leader>D', vim.lsp.buf.type_definition, opts)
					vim.keymap.set('n', '<Leader>lr', vim.lsp.buf.rename, opts)
					vim.keymap.set({'n', 'v'}, '<Leader>la', vim.lsp.buf.code_action, opts)
					vim.keymap.set('n', '<Leader>lf',
						function() vim.lsp.buf.format {async = true} end, opts)
		end
	})
	end
	}
}