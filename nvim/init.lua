-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local default_colorscheme = "charlie-dark"
local function load_colorscheme_if_exist()
  local config_path = vim.fn.stdpath("config")
  local colorscheme_config_path = config_path .. "/selected_colorscheme.txt"
  local file = io.open(colorscheme_config_path, "r")
  if file ~= nil then
    local firstLine = file:read("*l") -- Read the first line
    if firstLine then
      vim.cmd("colorscheme " .. firstLine)
    end
  else
    vim.cmd("colorscheme " .. default_colorscheme)
  end
end

load_colorscheme_if_exist()
