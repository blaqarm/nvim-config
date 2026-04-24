-- ============================================================================
--  EDITOR OPTIONS
-- ============================================================================

-- Line numbers
vim.wo.number = true
vim.wo.relativenumber = true

vim.opt.encoding = "utf-8"

-- Mouse
vim.opt.mouse = "a"
vim.opt.mousefocus = true

-- Clipboard (системный)
vim.opt.clipboard = "unnamedplus"

-- Indent
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.incsearch = true

-- UI
vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.wrap = false
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"
vim.opt.cursorline = true
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.showtabline = 2 --тест

-- Performance / UX
vim.opt.updatetime = 250
vim.opt.timeoutlen = 400
vim.opt.undofile = true
vim.opt.swapfile = false

-- Fillchars
vim.opt.fillchars = {
	vert = "│",
	fold = "⠀",
	eob = " ", -- убрать ~ в конце буфера
	msgsep = "‾",
	foldopen = "▾",
	foldsep = "│",
	foldclose = "▸",
}

-- Diagnostic (глобально, будет использоваться LSP)
vim.diagnostic.config({
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
	update_in_insert = false,
	underline = true,
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.INFO] = "",
			[vim.diagnostic.severity.HINT] = "",
		},
	},
	float = {
		border = "rounded",
		source = true,
	},
})
