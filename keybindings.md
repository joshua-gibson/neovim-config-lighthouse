# Custom Leader Keybindings

All `<leader>` bindings defined in this config (`lua/plugins/`). LazyVim defaults are not listed here.

---

## `<leader>a` — Claude

| Key | Action |
|-----|--------|
| `<leader>at` | Toggle Claude Sidebar |
| `<leader>af` | Focus Claude Sidebar |
| `<leader>ar` | Resume Last Session |
| `<leader>ac` | Continue Last Session |
| `<leader>am` | Select Model |
| `<leader>ab` | Add Buffer to Context |
| `<leader>as` | Send Selection to Claude (visual) |
| `<leader>aa` | Accept Diff |
| `<leader>ad` | Deny Diff |

---

## `<leader>b` — Buffers (additions to LazyVim defaults)

| Key | Action |
|-----|--------|
| `<leader>bt` | Refresh buffers from disk, git signs, explorer |
## `<leader>m` — Markdown

| Key | Action |
|-----|--------|
| `<leader>mp` | Toggle Markdown Preview (browser) |

---

## `<leader>D` — Docker

| Key | Action |
|-----|--------|
| `<leader>D` | Lazydocker |

---

## `<leader>g` — Git (additions to LazyVim defaults)

| Key | Action |
|-----|--------|
| `<leader>gw` | Git Worktrees |
| `<leader>gW` | Create Git Worktree |

---

## `<leader>z` — Surround

| Key | Action |
|-----|--------|
| `<leader>za` | Add surrounding (Normal/Visual) |
| `<leader>zd` | Delete surrounding |
| `<leader>zr` | Replace surrounding |
| `<leader>zf` | Find surrounding (right) |
| `<leader>zF` | Find surrounding (left) |
| `<leader>zh` | Highlight surrounding |
| `<leader>zn` | Update n_lines |

---

## Taken `<leader>X` prefixes (custom + LazyVim defaults)

Use this to avoid conflicts when adding new bindings.

| Prefix | Owner |
|--------|-------|
| `<leader>a` | Claude (custom) |
| `<leader>b` | Buffers (LazyVim) |
| `<leader>c` | Code/LSP (LazyVim) |
| `<leader>d` | Debug (LazyVim) |
| `<leader>D` | Docker (custom) |
| `<leader>e` | Explorer (LazyVim) |
| `<leader>f` | Find/Files (LazyVim) |
| `<leader>g` | Git (LazyVim + custom) |
| `<leader>G` | GitHub/Octo (LazyVim, conditional) |
| `<leader>h` | Harpoon (LazyVim, conditional) |
| `<leader>K` | Keywordprg (LazyVim) |
| `<leader>l` | Lazy (LazyVim) |
| `<leader>m` | Markdown (custom) |
| `<leader>L` | LazyVim Changelog (LazyVim) |
| `<leader>n` | Notifications (LazyVim) |
| `<leader>q` | Quit/Session (LazyVim) |
| `<leader>r` | Refactor (LazyVim) |
| `<leader>R` | REST client (LazyVim, conditional) |
| `<leader>s` | Search (LazyVim) |
| `<leader>S` | Scratch Buffer (LazyVim) |
| `<leader>t` | Test (LazyVim, conditional) |
| `<leader>u` | UI Toggles (LazyVim) |
| `<leader>w` | Windows (LazyVim) |
| `<leader>x` | Diagnostics (LazyVim) |
| `<leader>z` | Surround (custom) |

### Free single-letter prefixes

`i`, `j`, `k`, `o`, `p`, `v` (lowercase) — `A`, `B`, `C`, `E`, `F`, `H`, `I`, `J`, `M`, `N`, `O`, `P`, `Q`, `T`, `U`, `V`, `W`, `X`, `Y`, `Z` (uppercase)
