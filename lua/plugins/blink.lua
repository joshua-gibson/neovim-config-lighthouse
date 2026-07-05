return {
  "saghen/blink.cmp",
  opts = {
    completion = {
      list = {
        -- Don't auto-highlight the first item, so <CR> inserts a newline
        -- instead of accepting a suggestion. Accept with <Tab> or <C-y>
        -- after actively selecting an item.
        selection = { preselect = false },
      },
    },
  },
}
