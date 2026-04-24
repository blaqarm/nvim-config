-- blink.cmp — быстрый и современный autocomplete
-- https://github.com/saghen/blink.cmp
return {
	{
		"saghen/blink.cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		version = "1.*", -- использовать pre-built binaries из релизов
		dependencies = {
			"rafamadriz/friendly-snippets", -- снипеты для разных языков
		},
		---@module 'blink.cmp'
		---@type blink.cmp.Config
		opts = {
			keymap = {
				-- 'default'      : <C-y> accept, <C-n>/<C-p> select, <C-Space> show
				-- 'super-tab'    : <Tab> accept (привычно по Doom/VSCode)
				-- 'enter'        : <CR> accept
				["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
				["<Down>"] = { "select_next", "fallback" },
				["<Up>"] = { "select_prev", "fallback" },
				preset = "enter", -- "super-tab", ( что то не зашло)
			},
			appearance = {
				nerd_font_variant = "mono",
				use_nvim_cmp_as_default = true, -- fallback highlights от nvim-cmp
			},

			completion = {
				accept = {
					-- Автоматически дописывать () у функций
					auto_brackets = { enabled = true },
				},
				menu = {
					border = "rounded",
					draw = {
						treesitter = { "lsp" },
					},
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
					window = { border = "rounded" },
				},
				ghost_text = { enabled = true },
			},

			signature = {
				enabled = true,
				window = { border = "rounded" },
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			snippets = { preset = "default" }, -- встроенные vim.snippet (0.10+)

			-- Rust-implementation быстрее, но требует бинарь.
			-- version = "1.*" качает его из релиза, поэтому OK.
			fuzzy = { implementation = "prefer_rust_with_warning" },

			cmdline = {
				enabled = true,
				keymap = { preset = "cmdline" },
				completion = {
					menu = { auto_show = true },
				},
			},
		},
		opts_extend = { "sources.default" },
	},
}
