return {
  {
    "zbirenbaum/copilot.lua",
    opts = {
      copilot_node_command = "/Users/jogi/.nvm/versions/node/v22.13.1/bin/node",
    },
    config = function(_, opts)
      vim.g.copilot_node_command = opts.copilot_node_command
      require("copilot").setup(opts)
    end,
  },
}
