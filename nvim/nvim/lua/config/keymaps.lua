-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.api.nvim_set_keymap("n", "<leader>y", '"ay', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>y", '"ay', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>p", '"ap', { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<leader>p", '"ap', { noremap = true, silent = true })
