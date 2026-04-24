-- ============================================================================
--  KEYMAPS (глобальные; плагин-специфичные живут в их файлах)
-- ============================================================================

vim.g.mapleader = " "
vim.g.maplocalleader = " "

local map = vim.keymap.set

-- Save / Quit
map("n", "<leader>w", "<cmd>w<CR>",  { desc = "Save file" })
map("n", "<leader>q", "<cmd>q<CR>",  { desc = "Quit" })
map("n", "<leader>Q", "<cmd>qa!<CR>", { desc = "Quit all (force)" })

-- NeoTree
map("n", "<leader>t", "<cmd>Neotree left toggle reveal<CR>", { desc = "NeoTree toggle" })

-- Splits
map("n", "|",  "<cmd>vsplit<CR>", { desc = "Vertical split" })
map("n", "\\", "<cmd>split<CR>",  { desc = "Horizontal split" })

-- Навигация между окнами
map("n", "<C-k>", "<cmd>wincmd k<CR>", { desc = "Window up" })
map("n", "<C-j>", "<cmd>wincmd j<CR>", { desc = "Window down" })
map("n", "<C-h>", "<cmd>wincmd h<CR>", { desc = "Window left" })
map("n", "<C-l>", "<cmd>wincmd l<CR>", { desc = "Window right" })

-- Ресайз окон
map("n", "<A-Up>",    "<cmd>resize +2<CR>",          { desc = "Resize up" })
map("n", "<A-Down>",  "<cmd>resize -2<CR>",          { desc = "Resize down" })
map("n", "<A-Left>",  "<cmd>vertical resize -2<CR>", { desc = "Resize left" })
map("n", "<A-Right>", "<cmd>vertical resize +2<CR>", { desc = "Resize right" })

-- Буферы / bufferline
map("n", "<Tab>",     "<cmd>BufferLineCycleNext<CR>",  { desc = "Next buffer" })
map("n", "<S-Tab>",   "<cmd>BufferLineCyclePrev<CR>",  { desc = "Prev buffer" })
map("n", "<leader>x", "<cmd>BufferLinePickClose<CR>",  { desc = "Pick close buffer" })
map("n", "<C-x>",     "<cmd>BufferLineCloseOthers<CR>",{ desc = "Close other buffers" })

-- Visual: двигать выделенные строки
map("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
map("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- В visual остаёмся после indent
map("v", "<", "<gv", { desc = "Indent left" })
map("v", ">", ">gv", { desc = "Indent right" })

-- Clear search highlight (на всякий)
map("n", "<Esc>", "<cmd>noh<CR>", { desc = "Clear search highlight" })
