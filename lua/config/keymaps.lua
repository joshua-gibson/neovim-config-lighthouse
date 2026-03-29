-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- Unset F1 help
map({ "n", "i", "v" }, "<F1>", "<Nop>", { desc = "Disabled" })

-- Page Up/Down: half-page scroll with cursor centred
map("n", "<PageDown>", "<C-d>zz", { desc = "Page Down" })
map("n", "<PageUp>", "<C-u>zz", { desc = "Page Up" })
-- M-j/M-k left as LazyVim defaults (move line up/down)
