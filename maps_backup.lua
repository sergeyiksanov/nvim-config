vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Пробел + Пробел + r — Перезагрузить конфиг Neovim
vim.keymap.set("n", "<leader><leader>r", "<cmd>source %<CR>")

-- Ctrl + s — Сохранить файл (работает в Normal/Insert/Visual режимах)
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<cmd>w<CR>")

-- Ctrl + h — Перейти в левое окно
-- Ctrl + j — Перейти в нижнее окно
-- Ctrl + k — Перейти в верхнее окно
-- Ctrl + l — Перейти в правое окно
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")

-- Tab — Автодополнение (в Insert-режиме)
vim.keymap.set("i", "<Tab>", function()
	return vim.fn.pumvisible() == 1 and "<C-n>" or "<Tab>"
end, { expr = true })

-- gd — Перейти к определению символа
-- gD — Перейти к объявлению символа
-- gr — Показать ссылки на символ
-- K — Показать документацию (ховер)
-- Пробел + ca — Вызвать code action
-- Пробел + rn — Переименовать символ
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "K", vim.lsp.buf.hover)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)

-- Пробел + ff — Поиск файлов
-- Пробел + fg — Поиск текста в проекте
-- Пробел + fb — Поиск открытых буферов
-- Пробел + fh — Поиск в хелпах
-- vim.keymap.set("n", "<leader>ff", builtin.find_files)
-- vim.keymap.set("n", "<leader>fg", builtin.live_grep)
-- vim.keymap.set("n", "<leader>fb", builtin.buffers)
-- vim.keymap.set("n", "<leader>fh", builtin.help_tags)

-- Пробел + cf — Отформатировать код
vim.keymap.set("n", "<leader>cf", function()
	vim.lsp.buf.format({ async = true })
end)

-- Пробел + e — Показать/скрыть дерево файлов
vim.keymap.set("n", "<leader>e", "<cmd>NvimTreeToggle<CR>")

-- Пробел + tn — Новая вкладка
-- Пробел + tc — Закрыть текущую вкладку
-- Пробел + to — Закрыть все вкладки кроме текущей
vim.keymap.set("n", "<leader>tn", "<cmd>tabnew<CR>")
vim.keymap.set("n", "<leader>tc", "<cmd>tabclose<CR>")
vim.keymap.set("n", "<leader>to", "<cmd>tabonly<CR>")
for i = 1, 9 do
	vim.keymap.set("n", "<C-" .. i .. ">", function()
		vim.cmd("tabnext " .. i)
	end, { desc = "Перейти на вкладку " .. i })
end

-- Перемещение вкладок
vim.keymap.set("n", "<leader>tmh", "<cmd>-tabmove<CR>", { desc = "Переместить вкладку влево" })
vim.keymap.set("n", "<leader>tml", "<cmd>+tabmove<CR>", { desc = "Переместить вкладку вправо" })

-- J (в Visual) — Переместить выделение вниз
-- K (в Visual) — Переместить выделение вверх
-- n — Поиск следующего совпадения с центрированием
-- N — Поиск предыдущего совпадения с центрированием
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Пробел + y — Копировать в системный буфер (Normal/Visual)
-- Пробел + Y — Копировать строку в системный буфер
vim.keymap.set({ "n", "v" }, "<leader>y", '"+y')
vim.keymap.set("n", "<leader>Y", '"+Y')
