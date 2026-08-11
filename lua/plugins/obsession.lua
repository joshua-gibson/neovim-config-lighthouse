-- vim-obsession maintains a Session.vim in the cwd so tmux-resurrect's
-- `@resurrect-strategy-nvim 'session'` can relaunch nvim with buffers/layout
-- restored (via `nvim -S Session.vim`).
return {
  "tpope/vim-obsession",
  cmd = "Obsession",
  event = "VimEnter",
  config = function()
    -- Auto-start session tracking when nvim opens on a directory (or a real
    -- file) and no session is already being recorded. Skip dashboards, git
    -- commit buffers, and other transient starts.
    vim.api.nvim_create_autocmd("VimEnter", {
      nested = true,
      callback = function()
        if vim.g.this_obsession ~= nil then
          return -- already tracking (e.g. restored via nvim -S)
        end
        if vim.fn.argc() > 1 then
          return
        end
        local arg = vim.fn.argv(0)
        local ft = vim.bo.filetype
        if ft == "gitcommit" or ft == "gitrebase" then
          return
        end
        -- Only auto-track when launched in a directory or with no args.
        if arg == "" or vim.fn.isdirectory(arg) == 1 then
          vim.cmd("Obsession")
        end
      end,
    })
  end,
}
