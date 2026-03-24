if vim.fn.has("linux") == 0 then
  return {
    { "neovim/nvim-lspconfig", opts = { servers = { nil_ls = { enabled = false } } } },
    {
      "mason-org/mason.nvim",
      opts = function(_, opts)
        opts.ensure_installed = vim.tbl_filter(function(pkg)
          return pkg ~= "nil_ls"
        end, opts.ensure_installed or {})
      end,
    },
    {
      "stevearc/conform.nvim",
      optional = true,
      opts = { formatters_by_ft = { nix = {} } },
    },
    {
      "mfussenegger/nvim-lint",
      optional = true,
      opts = { linters_by_ft = { nix = {} } },
    },
  }
end

return {}
