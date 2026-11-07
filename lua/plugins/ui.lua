-- Under tmux, vim-tmux-navigator drives <c-hjkl> in both directions: it moves
-- between splits and hands off to `tmux select-pane` at the edge of the layout.
--
-- Under herdr, $TMUX is empty, so the plugin degrades to a plain wincmd (see
-- `if empty($TMUX)` in plugin/tmux_navigator.vim) and there is no way out of
-- Neovim once you reach the edge. Detect that case and hand focus back to
-- herdr, which is the other half of ~/.config/herdr/herdr-nav.sh.

local directions = { h = "left", j = "down", k = "up", l = "right" }
local commands = { h = "Left", j = "Down", k = "Up", l = "Right" }

local function navigate(key)
  return function()
    if not vim.env.HERDR_PANE_ID then
      vim.cmd("TmuxNavigate" .. commands[key])
      return
    end

    local before = vim.api.nvim_get_current_win()
    vim.cmd.wincmd(key)
    if before == vim.api.nvim_get_current_win() then
      vim.system({ "herdr", "pane", "focus", "--direction", directions[key] })
    end
  end
end

return {
  {
    "christoomey/vim-tmux-navigator",
    -- The plugin installs its own <c-hjkl> mappings on load (plugin/
    -- tmux_navigator.vim:17-22), which would clobber the keys below the first
    -- time lazy.nvim loads it -- leaving plain TmuxNavigate*, i.e. no way out
    -- of Neovim under herdr. Suppress them and keep the spec authoritative.
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
    },
    keys = {
      { "<c-h>", navigate("h"), desc = "Go to left window/pane" },
      { "<c-j>", navigate("j"), desc = "Go to lower window/pane" },
      { "<c-k>", navigate("k"), desc = "Go to upper window/pane" },
      { "<c-l>", navigate("l"), desc = "Go to right window/pane" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
}
