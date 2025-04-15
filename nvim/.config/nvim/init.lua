
vim.g.mapleader = " "

local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

keymap({ "n", "v" }, "<Leader>y", '"+y', opts)
keymap({ "n", "v" }, "<Leader>p", '"+p', opts)
keymap({ "n", "v" }, "<Leader>d", '"+d', opts)

