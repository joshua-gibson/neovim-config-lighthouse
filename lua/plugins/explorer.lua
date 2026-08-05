return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true,
            ignored = true,
            win = {
              list = {
                keys = {
                  ["Y"] = "copy_path",
                  ["<c-t>"] = false,
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
