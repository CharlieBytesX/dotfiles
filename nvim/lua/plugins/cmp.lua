return {
  {
    "saghen/blink.cmp",

    opts = {

      -- Show documentation when selecting a completion item
      completion = {
        ghost_text = {
          enabled = false,
        },
        list = { selection = { preselect = false, auto_insert = false } },

        menu = {
          auto_show = true,
        },
      },

      -- Display a preview of the selected item on the current line
      keymap = {
        preset = "none",
        ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
        ["<C-e>"] = { "hide" },
        ["<C-y>"] = { "select_and_accept" },

        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
        ["<C-p>"] = { "select_prev", "fallback" },
        ["<C-n>"] = { "select_next", "fallback" },

        ["<C-b>"] = { "scroll_documentation_up", "fallback" },
        ["<C-f>"] = { "scroll_documentation_down", "fallback" },

        ["<Tab>"] = { "snippet_forward", "fallback" },
        ["<S-Tab>"] = { "snippet_backward", "fallback" },

        ["<C-k>"] = { "show_signature", "hide_signature", "fallback" },
      },
    },
  },
}
