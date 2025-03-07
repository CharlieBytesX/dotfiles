-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<leader>y", '"ay', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>y", '"ay', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>p", '"ap', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>p", '"ap', { noremap = true, silent = true })

local fzf_lua = require("fzf-lua")

local function change_colorscheme()
  -- Get a list of available colorschemes
  local colorschemes = vim.fn.getcompletion("", "color")

  -- Use fzf-lua with a preview function
  fzf_lua.fzf_exec(colorschemes, {
    prompt = "Select Colorscheme❯ ",
    actions = {
      ["default"] = function(selected)
        if selected[1] then
          local config_path = vim.fn.stdpath("config")
          vim.cmd("colorscheme " .. selected[1])
          local file = io.open(config_path .. "/selected_colorscheme.txt", "w")
          ---@diagnostic disable-next-line: need-check-nil
          file:write(selected[1])
          ---@diagnostic disable-next-line: need-check-nil
          file:close()
        end
      end,
    },
    fzf_opts = {
      ["--preview-window"] = "down:3:wrap",
    },
  })
end
vim.keymap.set("n", "<leader>uC", change_colorscheme, { noremap = true, silent = true })
