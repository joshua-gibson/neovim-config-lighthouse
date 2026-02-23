-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local is_mac = vim.uv.os_uname().sysname == "Darwin"

if is_mac then
  -- macOS specific: Map the special characters Ghostty/macOS sends
  map("n", "∆", "<C-d>zz", { desc = "Scroll Down (macOS)" })
  map("n", "˚", "<C-u>zz", { desc = "Scroll Up (macOS)" })
else
  -- Linux/Other: Map the standard Alt key
  map("n", "<M-j>", "<C-d>zz", { desc = "Scroll Down" })
  map("n", "<M-k>", "<C-u>zz", { desc = "Scroll Up" })
end
