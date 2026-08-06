-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

-- Set directly rather than via catppuccin's `custom_highlights`, whose precompiled
-- cache (~/.cache/LazyVim/catppuccin) does not reliably pick these two groups up.
local style_markdown_inline_code = function()
  if not (vim.g.colors_name or ""):find("catppuccin") then
    return
  end
  local style = { fg = require("catppuccin.palettes").get_palette().blue, bg = "NONE", italic = true }
  vim.api.nvim_set_hl(0, "RenderMarkdownCodeInline", style)
  vim.api.nvim_set_hl(0, "@markup.raw.markdown_inline", style)
end

vim.api.nvim_create_autocmd("ColorScheme", {
  group = vim.api.nvim_create_augroup("markdown_inline_code", { clear = true }),
  callback = style_markdown_inline_code,
})

style_markdown_inline_code()
