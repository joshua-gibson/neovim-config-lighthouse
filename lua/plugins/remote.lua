return {
  {
    "amitds1997/remote-nvim.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-telescope/telescope.nvim",
    },
    opts = {
      -- Where to store remote nvim server data locally
      remote = {
        app_data_path = vim.fn.stdpath("data") .. "/remote-nvim",
        copy_dirs = {
          -- Copy your local config to remote
          config = {
            base = vim.fn.stdpath("config"),
            dirs = "*", -- copy everything
            compression = { enabled = true },
          },
          data = {
            base = vim.fn.stdpath("data"),
            dirs = {}, -- skip data by default (large)
          },
        },
      },
      -- SSH config
      ssh_config = {
        ssh_binary = "ssh",
        scp_binary = "scp",
        ssh_timeout = 30,
        -- Reuse existing SSH connections (faster)
        ssh_prompts = {
          {
            match = "password:",
            type = "secret",
            input_label = "Password: ",
          },
        },
      },
    },
  },
}
