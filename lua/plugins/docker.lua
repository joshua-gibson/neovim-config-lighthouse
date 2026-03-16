return {
  {
    "folke/snacks.nvim",
    keys = {
      {
        "<leader>D",
        function()
          Snacks.terminal("lazydocker", { esc_esc = false, title = "lazydocker" })
        end,
        desc = "Lazydocker",
      },
    },
  },
}
