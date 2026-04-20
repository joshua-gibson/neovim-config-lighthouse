return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            win = {
              list = {
                keys = {
                  ["Y"] = "copy_path",
                },
              },
            },
            actions = {
              copy_path = function(_, item)
                local filepath = item.file
                vim.fn.setreg("+", filepath)
                vim.fn.setreg('"', filepath)
                vim.notify("Copied: " .. filepath)
              end,
            },
          },
        },
      },
    },
  },
}
