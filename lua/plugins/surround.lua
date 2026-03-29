return {
  {
    "nvim-mini/mini.surround",
    lazy = false,
    opts = {
      mappings = {
        add = "<leader>za", -- Add surrounding (Normal/Visual)
        delete = "<leader>zd", -- Delete surrounding
        find = "<leader>zf", -- Find surrounding (right)
        find_left = "<leader>zF", -- Find surrounding (left)
        highlight = "<leader>zh", -- Highlight surrounding
        replace = "<leader>zr", -- Replace surrounding
        update_n_lines = "<leader>zn", -- Update n_lines
      },
    },
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "LazyVimStarted",
        callback = function()
          local ok, wk = pcall(require, "which-key")
          if ok then
            wk.add({ { "<leader>z", group = "surround" } })
          end
        end,
      })
    end,
  },
}
