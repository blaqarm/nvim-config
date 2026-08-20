--  KEYMAPS (глобальные; плагин-специфичные живут в их файлах)

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Save / Quit
map("n", "<leader>w", "<cmd>w<CR>", { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<CR>", { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit all (force)" })

-- NeoTree
map("n", "<leader>t", "<cmd>Neotree left toggle reveal<CR>", { desc = "NeoTree toggle" })

-- Splits
map("n", "|", "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "\\", "<cmd>split<CR>", { desc = "Horizontal split" })

-- Навигация между окнами
map("n", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Window up" })
map("n", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Window down" })
map("n", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Window left" })
map("n", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Window right" })

-- Ресайз окон
map("n", "<A-Up>", "<cmd>resize +2<CR>", { desc = "Resize up" })
map("n", "<A-Down>", "<cmd>resize -2<CR>", { desc = "Resize down" })
map("n", "<A-Left>", "<cmd>vertical resize -2<CR>", { desc = "Resize left" })
map("n", "<A-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize right" })

-- Буферы / bufferline
map("n", "<Tab>", "<cmd>BufferLineCycleNext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>BufferLineCyclePrev<CR>", { desc = "Prev buffer" })
map("n", "<leader>x", "<cmd>BufferLinePickClose<CR>", { desc = "Pick close buffer" })
map("n", "<C-x>", "<cmd>BufferLineCloseOthers<CR>", { desc = "Close other buffers" })

-- Visual: двигать выделенные строки
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- В visual остаёмся после indent
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Clear search highlight (на всякий)
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear search highlight" })

-- tets Doom emacs like
vim.keymap.set("n", "<leader>-", "gcc", { remap = true, desc = "Toggle comment line" })
vim.keymap.set("v", "<leader>-", "gc", { remap = true, desc = "Toggle comment selection" })

-- gcO / gco / gcA (встроенного нет, делаем сами)
local function comment_line(offset)
	local row = vim.api.nvim_win_get_cursor(0)[1]
	local target = row + offset
	local l_cms = vim.bo.commentstring:match("(.*)%%s")
	if not l_cms then
		return
	end
	l_cms = vim.trim(l_cms)
	vim.api.nvim_buf_set_lines(0, target, target, false, { l_cms .. " " })
	vim.api.nvim_win_set_cursor(0, { target + 1, 0 })
	vim.cmd("normal! ==")
	vim.api.nvim_win_set_cursor(0, { target + 1, #vim.api.nvim_get_current_line() })
	vim.cmd("startinsert!")
end

vim.keymap.set("n", "gco", function()
	comment_line(0)
end, { desc = "Comment below" })
vim.keymap.set("n", "gcO", function()
	comment_line(-1)
end, { desc = "Comment above" })

vim.keymap.set("n", "gcA", function()
	local l_cms = vim.bo.commentstring:match("(.*)%%s")
	if not l_cms then
		return
	end
	l_cms = vim.trim(l_cms)
	local line = vim.api.nvim_get_current_line()
	vim.api.nvim_set_current_line(line .. " " .. l_cms .. " ")
	vim.api.nvim_win_set_cursor(0, { vim.fn.line("."), #vim.api.nvim_get_current_line() })
	vim.cmd("startinsert!")
end, { desc = "Comment at end of line" })

-- Быстрое переключение markdown-чекбокса: - [ ] <-> - [x]
local function toggle_checkbox()
	local line = vim.api.nvim_get_current_line()

	-- Если строка содержит чекбокс
	if line:match("^%s*[-*+] %[[ xX]%]") then
		local new_line
		if line:match("%[[xX]%]") then
			new_line = line:gsub("%[[xX]%]", "[ ]", 1) -- снять галочку
		else
			new_line = line:gsub("%[ %]", "[x]", 1) -- поставить галочку
		end
		vim.api.nvim_set_current_line(new_line)
	else
		-- Если чекбокса нет — добавить его в начало списка
		local new_line = line:gsub("^(%s*[-*+] )", "%1[ ] ", 1)
		if new_line == line then
			-- Если это просто текст без маркера списка — сделать пунктом
			new_line = "- [ ] " .. line
		end
		vim.api.nvim_set_current_line(new_line)
	end
end

vim.keymap.set("n", "<leader>cit", toggle_checkbox, { desc = "Toggle checkbox" })
vim.keymap.set("v", "<leader>cit", toggle_checkbox, { desc = "Toggle checkbox" })
