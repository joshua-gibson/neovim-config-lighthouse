# Claude Instructions — LazyVim Config

## Keybinding changes

`keybindings.md` in this directory is the canonical reference for all custom `<leader>` bindings and a map of taken prefixes.

**Before** adding, changing, or removing any keybinding:
- Read `keybindings.md` to check for conflicts with existing bindings and taken prefixes.

**After** any keybinding change:
- Update `keybindings.md` to reflect the new state — add new bindings, remove deleted ones, and update the taken/free prefix table if a new prefix group is introduced or removed.

---

## General notes

- Config files under `~/.config/` may be managed by Nix Home Manager — check before editing outside this repo.
- All plugin specs live in `lua/plugins/` as `return { ... }` Lua tables following LazyVim conventions.
- Formatter config is in `stylua.toml` — respect it when writing Lua.
- Do not suggest Vimscript; use Lua only.
