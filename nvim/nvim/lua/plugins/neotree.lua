return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    -- keys = {
    --   -- add a keymap to browse plugin files
    --   -- stylua: ignore
    --   {
    --     "<leader>fp",
    --     function() require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root }) end,
    --     desc = "Find Plugin File",
    --   },
    -- },
    -- change some options
    opts = {
      filesystem = {
        window = {
          mappings = {
            -- Make the mapping anything you want
            ["R"] = "easy",
          },
        },
      },
      commands = {
        ["easy"] = function(state)
          local node = state.tree:get_node()
          local path = node.type == "directory" and node.path or vim.fs.dirname(node.path)
          require("easy-dotnet").create_new_item(path, function()
            require("neo-tree.sources.manager").refresh(state.name)
          end)
        end,
      },
    },
  },
}
