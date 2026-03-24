return {
  {
    "coder/claudecode.nvim",
    dependencies = { "folke/snacks.nvim" },
    -- Register <leader>a group in which-key so it appears in the leader menu
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local ok, wk = pcall(require, "which-key")
          if ok then
            wk.add({ { "<leader>a", group = "claude" } })
          end
        end,
      })
    end,
    opts = {
      -- Sidebar position
      terminal = {
        split_side = "right",
        split_width_percentage = 0.35,
        provider = "snacks", -- uses snacks.nvim already in your config
      },
      -- Automatically start the MCP server when Neovim opens
      auto_start = true,
      -- Use git repo root as cwd so Claude has full project context
      git_repo_cwd = true,
    },
    keys = {
      { "<leader>at", "<cmd>ClaudeCode<cr>",            desc = "Toggle Claude Sidebar" },
      { "<leader>af", "<cmd>ClaudeCodeFocus<cr>",       desc = "Focus Claude Sidebar" },
      { "<leader>ar", "<cmd>ClaudeCode --resume<cr>",   desc = "Resume Last Session" },
      { "<leader>ac", "<cmd>ClaudeCode --continue<cr>", desc = "Continue Last Session" },
      { "<leader>am", "<cmd>ClaudeCodeSelectModel<cr>", desc = "Select Model" },
      { "<leader>ab", "<cmd>ClaudeCodeAdd %<cr>",       desc = "Add Buffer to Context" },
      { "<leader>as", "<cmd>ClaudeCodeSend<cr>",        desc = "Send Selection to Claude", mode = "v" },
      { "<leader>aa", "<cmd>ClaudeCodeDiffAccept<cr>",  desc = "Accept Diff" },
      { "<leader>ad", "<cmd>ClaudeCodeDiffDeny<cr>",    desc = "Deny Diff" },
    },
  },
}
