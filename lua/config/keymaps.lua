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

-- Refresh buffers from disk, git signs, and explorer
map("n", "<leader>bt", function()
  vim.cmd("checktime")
  vim.cmd("silent! Gitsigns refresh")
  pcall(function()
    local Tree = require("snacks.explorer.tree")
    -- Workaround: snacks's _update clears node.status/ignored but never
    -- node.dir_status, so a directory that was once untracked stays "??"
    -- forever and propagates to its children visually.
    Tree:walk(Tree.root, function(n)
      n.dir_status = nil
    end, { all = true })
    local explorer = require("snacks").picker.get({ source = "explorer" })[1]
    if explorer then
      explorer:action("explorer_update")
    end
    require("snacks").explorer.reveal()
  end)
end, { desc = "Refresh buffers, git signs, explorer" })
