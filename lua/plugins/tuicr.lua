local editor_shim = vim.fs.normalize(vim.fn.stdpath("cache") .. "/tuicr-editor")

local ensure_editor_shim = function()
  if vim.uv.fs_stat(editor_shim) then
    return
  end
  -- Nvim rejects the --remote-*-wait family with E5600, so this returns immediately
  vim.fn.writefile({ "#!/bin/sh", 'exec nvim --server "$NVIM" --remote-tab "$@"' }, editor_shim)
  vim.uv.fs_chmod(editor_shim, tonumber("755", 8))
end

local remote_env = function()
  if vim.v.servername == "" then
    return {}
  end
  ensure_editor_shim()
  return { NVIM = vim.v.servername, EDITOR = editor_shim, VISUAL = editor_shim }
end

local git_root = function()
  local root = LazyVim.root.git()
  if vim.uv.fs_stat(root .. "/.git") then
    return root
  end
  Snacks.notify.error("Not inside a git repository", { title = "tuicr" })
end

local base_branch = function(root)
  local origin_head = vim.fn.systemlist({ "git", "-C", root, "symbolic-ref", "--short", "refs/remotes/origin/HEAD" })
  if vim.v.shell_error == 0 and origin_head[1] then
    return (origin_head[1]:gsub("^origin/", ""))
  end
  for _, name in ipairs({ "main", "master", "trunk" }) do
    vim.fn.system({ "git", "-C", root, "rev-parse", "--verify", "--quiet", name })
    if vim.v.shell_error == 0 then
      return name
    end
  end
  Snacks.notify.error("Could not determine a base branch", { title = "tuicr" })
end

local open = function(root, args, title)
  local cmd = { "tuicr", "--theme", vim.o.background == "light" and "tokyo-night-day" or "tokyo-night-storm" }
  vim.list_extend(cmd, args)
  Snacks.terminal(cmd, {
    cwd = root,
    env = remote_env(),
    win = {
      title = title,
      keys = {
        term_normal = false,
        hide_term = { "<c-q>", "hide", mode = "t" },
      },
    },
  })
end

local review_working_tree = function()
  local root = git_root()
  if root then
    open(root, { "-w" }, "tuicr: working tree")
  end
end

local review_branch = function()
  local root = git_root()
  local base = root and base_branch(root)
  if not base then
    return
  end
  local range = base .. "..HEAD"
  if vim.fn.systemlist({ "git", "-C", root, "rev-list", "--count", range })[1] == "0" then
    return Snacks.notify.warn("No commits ahead of " .. base, { title = "tuicr" })
  end
  open(root, { "-r", range }, "tuicr: " .. range)
end

return {
  {
    "folke/snacks.nvim",
    keys = {
      { "<leader>gr", review_working_tree, desc = "Code Review: Working Tree (tuicr)" },
      { "<leader>gR", review_branch, desc = "Code Review: Branch vs Base (tuicr)" },
    },
  },
}
